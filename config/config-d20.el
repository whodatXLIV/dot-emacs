;;; config-d20.el --- for dnd

;;; Commentary:
;; This is an org mode that helps with dnd

(require-package 'org-d20)


(defun org-d20-initiative ()
  "Generate an Org-mode table with initiative order and monster/NPC HP."
  (interactive "*")
  (let ((rows))
    (let (name-input init-input ac-input hd-input num-input (monster 1))
      (cl-loop
       do (setq name-input (read-string "Monster/NPC name (blank when done): "))
       (when (> (length name-input) 0)
         (setq init-input (read-string (concat name-input "'s init modifier: "))
               ac-input (read-string (concat name-input "'s Armor Class: "))
               hd-input (read-string (concat name-input "'s hit points: "))
               num-input
               (cdr (org-d20--roll
                     (read-string (concat "How many " name-input "? ")))))
         ;; In 5e, all monsters of the same kind have the same
         ;; initiative
         (let ((init (int-to-string
                      (org-d20--d20-plus (string-to-number init-input))))
               (monsters-left num-input))
           (while (>= monsters-left 1)
             (let (
                   (hp (int-to-string (cdr (org-d20--roll hd-input))))
                   (ac (int-to-string (cdr (org-d20--roll ac-input))))
                   )
               (push (list
                      "" (concat name-input
                                 " "
                                 (org-d20--monster-number monster))
                      (org-d20--num-to-term init-input) init ac hp "0")
                     rows))
             (setq monsters-left (1- monsters-left)
                   monster (1+ monster)))))
       (unless org-d20-continue-monster-numbering (setq monster 1))
       while (-all? (lambda (x) (> (length x) 0))
                    (list name-input init-input ac-input hd-input))))
    (dolist (pc org-d20-party)
      (let ((init (read-string (concat (car pc) "'s initiative roll: "))))
        (push (list "" (car pc) (org-d20--num-to-term (cdr pc)) init "-" "-" "-")
              rows)))
    ;; We prepended each new item to the list, so reverse before
    ;; printing.  This ensures that the numbering/lettering of
    ;; monsters on the same initiative count is ascending
    (setq rows (seq-reverse rows))
    (insert
     "Round of combat: 1\n|Turn|Creature|Mod|Init|AC|HP|Damage|Status|\n|-\n")
    (dolist (row rows)
      (dolist (cell row)
        (insert "|" cell))
      (insert "|\n"))
    (delete-char -1)
    (org-table-goto-column 4)
    (org-table-sort-lines nil ?N)
    (org-table-goto-line 2)
    (org-table-goto-column 1)
    (insert ">>>>")                     ; four chars in 'Turn'
    (org-table-align)))


(defun org-d20-initiative-add ()
  "Add a monster to an existing combat."
  (interactive "*" org-mode)
  (if (org-at-table-p)
      (let* ((name-input (read-string "Monster/NPC name: "))
             (init-input (read-number (concat name-input "'s init modifier: ")))
             (ac-input (read-number (concat name-input "'s Armor Class: ")))
             (hd-input (read-string (concat name-input "'s hit points: ")))
             (num-input (read-string (concat "How many " name-input "? "))))
        (org-d20--initiative-add-records name-input init-input ac-input hd-input num-input))
    (org-d20-initiative)))

(defun org-d20--initiative-add-records (name init-mod ac hd num)
  (let ((monster 1))
    ;; First, if we need to, try to count the number of monsters.
    ;; We can only use a crude heuristic here because we don't
    ;; know what kind of things the user might have added to the
    ;; table
    (when org-d20-continue-monster-numbering
      (save-excursion
        (org-table-goto-line 1)
        (while (org-table-goto-line (1+ (org-table-current-line)))
          (org-table-goto-column 2)
          (when (looking-at "[^|]+ \\([A-Z]\\|[0-9]+\\)~? *|")
            (setq monster (1+ monster))))))
    (save-excursion
      ;; Ensure we're not on header row (following won't go past end
      ;; of table)
      (org-table-goto-line (1+ (org-table-current-line)))
      (org-table-goto-line (1+ (org-table-current-line)))
      (let ((init (int-to-string (org-d20--d20-plus init-mod)))
            (monsters-left (cdr (org-d20--roll num))))
        (while (>= monsters-left 1)
          ;; Open a new row and then immediately move it downwards
          ;; to ensure that the monsters on the same initiative
          ;; count are numbered/lettered in ascending order
          (org-table-insert-row)
          (org-table-move-row)
          (org-table-next-field)
          (insert name)
          (insert " ")
          (insert (org-d20--monster-number monster))
          (org-table-next-field)
          (insert (org-d20--num-to-term init-mod))
          (org-table-next-field)
          (insert init)
          (org-table-next-field)
          (insert (int-to-string (cdr (org-d20--roll ac))))
          (org-table-next-field)
          (insert (int-to-string (cdr (org-d20--roll hd))))
          (org-table-next-field)
          (insert "0")
          (setq monsters-left (1- monsters-left)
                monster (1+ monster))))
      (org-table-goto-column 4)
      (org-table-sort-lines nil ?N)
      (org-table-align))))


(defun org-d20-initiative-back ()
  "Go back an turn on the turn tracker in an initiative table."
  (interactive "*")
  (when (org-at-table-p)
    (cl-loop
     do (let* ((back (search-backward ">>>>" (org-table-begin) t))
               (forward (search-forward ">>>>" (org-table-end) t))
               (cur (if back back forward)))
          (goto-char cur)
          (skip-chars-backward ">")
          (delete-char 4)
          (if (not 
               (eq 2 (org-table-current-line)))
              (progn
                (forward-line -1)
                (org-table-next-field)
                (insert ">>>>"))
            (save-excursion
              (search-backward "Round of combat:")
              (search-forward-regexp "[0-9]+")
              (skip-chars-backward "0-9")
              (replace-match
               (int-to-string (1- (string-to-number (match-string 0))))))
            (goto-char (org-table-end))
            (backward-char)
            (org-table-goto-column 1)
            (insert ">>>>")))
     while (save-excursion
             (org-table-goto-column 2)
             (looking-at "~"))))
  (org-table-align))




;;;###autoload
(defun org-d20-d20 (exp)
  "Roll two d20, showing result with advantage and disadvantage, and neither."
  (interactive "sRoll Extra: ")
  (let* ((fst (cdr (org-d20--roll "1d20")))
         (snd (cdr (org-d20--roll "1d20")))
	     (bls (cdr (org-d20--roll (
                                   if (eq 0 (length exp))
                                      "0"
                                    exp
                                      ))))
         (fst* (int-to-string fst))
         (snd* (int-to-string snd))
	 (bls* (int-to-string bls))
         (adv (if (>= fst snd)
                  (propertize fst* 'face 'bold)
                (propertize snd* 'face 'bold)))
         (disadv (if (<= fst snd)
                     (propertize fst* 'face 'bold)
                   (propertize snd* 'face 'bold))))
    (org-d20--record-roll
     "Roll:  %s%s  Adv.:  %s%s  Disadv.:  %s%s  Extra:  %s"
     fst*
     (make-string (- 4 (length fst*)) ?\ )
     adv
     (make-string (- 4 (length adv)) ?\ )
     disadv
     (make-string (- 4 (length disadv)) ?\ )
     bls*))
  (when org-d20-dice-sound
    (play-sound-file org-d20-dice-sound)))




(pretty-hydra-define d20-hydra (:color blue :hint nil)
  (
   "Initiative"
   (
    ("i" org-d20-initiative-add "add initiative")
    ("n" org-d20-initiative-dwim "next initiative")
    ("p" org-d20-initiative-back "prev initiative")
    )
   
   "Roll"
   (
    ("r" org-d20-roll "roll")
    ("P" org-d20-roll-at-point "roll at point")
    ("a" org-d20-d20 "Advantage/Disadvatage")
    )
   
   "Edit"
   (
    ("d" org-d20-damage "damage")
    ("t" org-table-align "align")
    ("q" nil "quit")
    )
   )
  )

(define-key org-mode-map (kbd "H-h d") 'd20-hydra/body)

(provide 'config-d20)

;;; config-d20.el ends here
