
;; (global-set-key (kbd "C-c l") 'org-store-link)
;; (keymap-global-set "C-c a" 'org-agenda)
;; (keymap-global-set "C-cc" 'org-capture)
;; (keymap-global-set "C-cb" 'org-switchb)


(require-package 'org-bullets)
(add-hook 'org-mode-hook ;; org mode
          '(lambda ()

             (unbind-key (kbd "S-M-<up>") org-mode-map)
             (unbind-key (kbd "S-M-<down>") org-mode-map)
             (unbind-key (kbd "S-M-<left>") org-mode-map)
             (unbind-key (kbd "S-M-<right>") org-mode-map)
             (unbind-key (kbd "C-S-<left>") org-mode-map)
             (unbind-key (kbd "C-S-<right>") org-mode-map)
             
             (local-set-key (kbd "C-M-<up>") 'org-shiftmetaup)
             (local-set-key (kbd "C-M-<down>") 'org-shiftmetadown)
             (local-set-key (kbd "C-M-<left>") 'org-shiftmetaleft)
             (local-set-key (kbd "C-M-<right>") 'org-shiftmetaright)
             (local-set-key (kbd "C-M-S-<left>") 'org-shiftcontrolleft)
             (local-set-key (kbd "C-M-S-<right>") 'org-shiftcontrolright)
             ))
(setq org-todo-keywords
	  '((sequence "TODO(t!)" "IN-PROGRESS(p!/@)" "WAITING(w!/@)" "|" "DONE(d)")))

(setq org-tag-alist '((:startgroup . nil)
			          ("@work" . ?w) ("@home" . ?h)
			          (:endgroup . nil)
			          ("BRITTON" . ?b)
			          ("DAN" . ?d)
			          ("REZA" . ?r)
			          ("NATHAN" . ?n)
			          ("MALCOLM" . ?m)
			          ("TRIPP" . ?t)
			          )
	  )

(setq org-display-remote-inline-images 'cache)

(setq org-capture-templates
	  '(
	    ("t" "Todo" entry (file+headline "~/Documents/todo.org" "Tasks")
	     "* TODO %? %A\n\n %T\n\n")
	    ;; ("n" "Note" entry (file+headline "~/Documents/Notes.org" "Work Notes")
	    ;;  "* NOTES %i\n %?\n %a\n %T\n")
	    )
	  )

(setq org-startup-folded t
	  org-startup-indented t
	  org-log-done t
	  )
(add-hook 'org-mode-hook (lambda ()
			               (visual-line-mode)))
(add-hook 'org-mode-hook (lambda ()
			               (linum-mode 0)))

(add-hook 'org-mode-hook 'company-mode)

;;; BEAUTIFYING ORG
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (setq org-bullets-bullet-list '(" " "⊛" "⊛" "⊛" "⊛" "⊛" "⊛" "⊛")
;; 	  org-pretty-entities-include-sub-superscripts nil
;; 	  org-src-fontify-natively t
;; 	  org-fontify-whole-heading-line t
;; 	  org-fontify-done-headline t
;; 	  org-fontify-quote-and-verse-blocks t
;; 	  )
;; (set-face-attribute 'org-block-end-line nil
;;                     :underline "#44667A"                      
;;                     )

;; 			            ;; '(org-headline-done ((t (:inherit default :strike-through t))))

;;                         ;; `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))
;;   			            '(org-block                 ((t (:inherit default))))
;;   			            '(org-document-info         ((t (:foreground "dark orange"))))
;;   			            '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;;   			            '(org-link                  ((t (:foreground "royal blue" :underline t))))
;;   			            '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;   			            '(org-property-value        ((t (:inherit fixed-pitch))) t)
;;   			            '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;   			            '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;;   			            '(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
;;   			            )

;;;;;;;;;;;;;

(require-package 'org-modern)

(add-hook 'org-mode-hook (lambda () 
                           (custom-theme-set-faces 'user
                                                   ;; '(cursor                 ((t (:foreground "#928374"))))
                                                   ;; '(org-block              ((t (:foreground "#f0eeeb":background "#1c2021" :extend t))))
                                                   '(org-block-begin-line   ((t (:inherit org-block :background "#1d2021" :foreground "#d9b466" :extend t))))
                                                   '(org-block-end-line     ((t (:inherit org-block-begin-line :foreground "#6b7d70"))))
                                                   '(org-document-info      ((t (:foreground "#d5c4a1" :weight bold))))
                                                   '(org-document-info-keyword    ((t (:inherit shadow))))
                                                   '(org-document-title     ((t (:foreground "#fbf1c7" :weight bold :height 1.4))))
                                                   '(org-meta-line          ((t (:inherit shadow))))
                                                   '(org-target             ((t (:height 0.7 :inherit shadow))))
                                                   '(org-link               ((t (:foreground "#b8bb26" :background "#32302f" :overline nil))))  ;; 
                                                   '(org-indent             ((t (:inherit org-hide))))
                                                   '(org-indent             ((t (:inherit (org-hide fixed-pitch)))))
                                                   '(org-footnote           ((t (:foreground "#8ec07c" :background "#32302f" :overline nil))))
                                                   '(org-ref-cite-face      ((t (:foreground "#fabd2f" :background "#32302f" :overline nil))))  ;; 
                                                   '(org-ref-ref-face       ((t (:foreground "#83a598" :background "#32302f" :overline nil))))
                                                   '(org-ref-label-face     ((t (:inherit shadow :box t))))
                                                   '(org-drawer             ((t (:inherit shadow))))
                                                   '(org-property-value     ((t (:inherit org-document-info))) t)
                                                   '(org-tag                ((t (:inherit shadow))))
                                                   '(org-date               ((t (:foreground "#83a598" :underline t))))
                                                   '(org-verbatim           ((t (:inherit org-block :background "#3c3836" :foreground "#d5c4a1"))))
                                                   '(org-code               ((t (:inherit org-verbatim :background "#181818" :foreground "#90d1fc"))))
                                                   '(org-quote              ((t (:inherit org-block :slant italic))))
                                                   '(org-level-1            ((t (:foreground "#3375a8" :background "#181818" :weight bold :height 1.3 :overline nil :underline t :extend t)))) ;; Blue
                                                   '(org-level-2            ((t (:foreground "#8ec07c" :background "#181818" :weight bold :height 1.2 :overline nil :extend t)))) ;; Aqua
                                                   '(org-level-3            ((t (:foreground "#b8bb26" :background "#181818" :weight bold :height 1.1 :overline nil :extend t)))) ;; Green
                                                   '(org-level-4            ((t (:foreground "#fabd2f" :background "#181818" :weight bold :height 1.1 :overline nil :extend t)))) ;; Yellow
                                                   '(org-level-5            ((t (:foreground "#fe8019" :background "#181818" :weight bold :height 1.1 :overline nil :extend t)))) ;; Orange
                                                   '(org-level-6            ((t (:foreground "#fb4934" :background "#181818" :weight bold :height 1.1 :overline nil :extend t)))) ;; Red
                                                   '(org-level-7            ((t (:foreground "#d3869b" :background "#181818" :weight bold :height 1.1 :overline nil :extend t)))) ;; Blue
                                                   '(org-level-8            ((t (:background "#181818" :weight bold :height 1.1 :overline nil :extend t))))
                                                   '(org-headline-done      ((t (:foreground "#5ca637" :background "#181818" :weight bold :overline nil :extend t)))) ;; Gray
                                                   '(org-headline-todo      ((t (:foreground "#d45555" :background "#181818" :weight bold :overline nil :extend t)))) ;; Gray
                                                   '(org-ellipsis           ((t (:inherit shadow :height 1.0 :weight bold :extend t))))
                                                   '(org-latex-and-related  ((t (:inherit org-block :extend t))))                                                   
                                                   '(org-table              ((t (:foreground "#d5c4a1" ))))
                                                   '(org-checkbox           ((t (:foreground "#ffc4a1" :height 1.3))))
                                                   )
                           
                           (org-modern-mode)
                           (org-modern-agenda)
))

(add-hook 'org-mode-hook (lambda ()
			               (setq-local line-spacing 0.1)))
(font-lock-add-keywords
 'org-mode
 `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)" 1 'org-headline-done prepend))
 'append)

(font-lock-add-keywords
 'org-mode
 `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:-\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)" 1 'org-headline-todo prepend))
 'append)


(setq
 ;; Edit settings
 org-babel-min-lines-for-block-output 1
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t
 
 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities nil
 
 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────"

 org-agenda-ndays 7
 org-deadline-warning-days 10
 org-agenda-show-all-dates t
 org-agenda-start-on-weekday nil
 org-reverse-note-order t
 org-fast-tag-selection-single-key (quote expert)
 org-log-into-drawer t
 org-image-actual-width nil
 org-export-with-drawers t
 )

;;;;;;;;;


(setq org-directory '("~/Documents")
	  org-agenda-files '("~/Documents/todo.org")
	  ;; org-archive-location '("~/Documents/archive/")
	  org-default-notes-file '("~/Documents/notes.org"))




;; Backend for HTML Table export

(require 'ox-html)
(defun ox-mrkup-filter-bold
    (text back-end info)
  "Markup TEXT as <bold>TEXT</bold>. Ignore BACK-END and INFO."
  (format "<bold>%s</bold>" text))

(org-export-define-derived-backend 'htmlTable 'html
  :filters-alist
  '((:filter-body . ox-mrkup-filter-body)
    ))

;; * My counter functions

(add-hook 'org-mode-hook (lambda ()
			               (setq-local seth-jupyter-execution-count 1)))
(setq seth-jupyter-execution-count 1)
(defun org-babel-add-time-stamp-after-execute-before-src-block ()
  ;; (sleep-for 2)
  (end-of-line)
  (save-excursion
    (search-backward "#+BEGIN_SRC" 0 t)
    (forward-line -1)
    (beginning-of-line)
 
    (when (not (or
                (looking-at "[[:space:]]*$")
                (looking-at "#\\+LASTRUN:")))
      (forward-line 1)
      (newline)
      (forward-line -1))
    (when (looking-at "#\\+LASTRUN:")
      (delete-region (pos-bol) (1- (pos-bol 2)))
      )
    (insert (concat
             "#+LASTRUN: "
             (format-time-string "[%Y-%m-%d %a %H:%M:%S]" (current-time))
             " ["
             (int-to-string seth-jupyter-execution-count)
             "]"
             ))
    (setq-local seth-jupyter-execution-count (1+ seth-jupyter-execution-count))    
    ))

(add-hook 'org-babel-after-execute-hook
          'org-babel-add-time-stamp-after-execute-before-src-block)


;; * Clean the results

;; ** helper functions

(defun /jupyter-clean-async--results ()
  "cleans drawer results for async jupyter code blocks"
  (search-forward "#+begin_example")
  (beginning-of-line)
  (delete-region (pos-bol) (pos-bol 2))
  
  (search-forward "#+end_example")
  (beginning-of-line)
  (delete-region (pos-bol) (pos-bol 2))
  )

(defun /jupyter-clean-async-ansi--results ()
  "cleans drawer results for async jupyter code blocks"
  (let* ((r (org-babel-where-is-src-block-result))
	     (result (when r
		           (save-excursion
		             (goto-char r)
		             (org-element-context)))))
    (when result
      (let* ((sp (org-element-property :begin result))
             (ep (org-element-property :end result)))
        (replace-string-in-region "[43m" "[45m" sp ep ) ;; replace yellow highlights
        (replace-string-in-region ";43m" ";45m" sp ep )
        (replace-string-in-region "[34m" "[33m" sp ep ) ;; replace blue text
        (replace-string-in-region ";34m" ";33m" sp ep )
        t
        ))
    t)
  (scimax-jupyter-ansi)
  (/jupyter-clean-async--results)
  )

(defun seth-clear-all-results ()
  "Clear all results in the buffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (org-babel-next-src-block)
      (forward-line -1)
      (beginning-of-line)
      (when (looking-at "#\\+LASTRUN:")
        (delete-region (pos-bol) (1- (pos-bol 2)))
        )
      (forward-line 1)
      (org-babel-remove-result))))

(defun seth-interrupt-kernel ()
  "Clear all results in the buffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    ;; (while (org-babel-next-src-block)
    ;;   (forward-line 1)
    ;;   ;; (jupyter-org-interrupt-kernel)
    ;;   )
    (let* ((num 0))
      (while (< num 5)
        (org-babel-next-src-block)
        (forward-line 1)
        (jupyter-org-interrupt-kernel)
        (setq num (+1 num))))
    )
  )


;; *** remove result if empty
(with-eval-after-load 'jupyter-client
  (defun /jupyter-remove-empty-async-results (args)
    "remove results block if the results are empty"
    (let*
        ((req (nth 1 args))
         (msg (nth 2 args))
         (is-org-request (eq (type-of req) 'jupyter-org-request)))
      (when is-org-request
        (jupyter-with-message-content msg (status payload)
          (when (and (jupyter-org-request-async-p req)
                     (equal status "ok")
                     (not (jupyter-org-request-id-cleared-p req)))
            (jupyter-org--clear-request-id req)
            (org-with-point-at (jupyter-org-request-marker req)
              (org-babel-remove-result)))))
      args))

  (unless (advice-member-p #'/jupyter-remove-empty-async-results 'jupyter-handle-execute-reply)
    (advice-add 'jupyter-handle-execute-reply :filter-args #'/jupyter-remove-empty-async-results)))

;; *** remove example and clean up errors
(with-eval-after-load 'jupyter-client
  (defun /jupyter-ansi-async-results (args)
    "Translate the ansi key code in results with errors"
    (let*
        ((req (nth 1 args))
         (msg (nth 2 args))
         (is-org-request (eq (type-of req) 'jupyter-org-request)))
      (when is-org-request
        (jupyter-with-message-content msg (status payload)
          (when (and (jupyter-org-request-async-p req)
                     (not (equal status "ok")))
            (org-with-point-at (jupyter-org-request-marker req)
              (/jupyter-clean-async-ansi--results)
              )
            (org-with-point-at (jupyter-org-request-marker req)
              (when (not (search-forward "KeyboardInterrupt" nil t))
                  (seth-interrupt-kernel)))
            )))
      args))

  (unless (advice-member-p #'/jupyter-ansi-async-results 'jupyter-handle-execute-reply)
    (advice-add 'jupyter-handle-execute-reply :filter-args #'/jupyter-ansi-async-results)))

;; *** remove example src block from result
(with-eval-after-load 'jupyter-client
  (defun /jupyter-clean-async-results (args)
    "calls the cleaning of async results in jupyter blocks"
    (let*
        ((req (nth 1 args))
         (msg (nth 2 args))
         (is-org-request (eq (type-of req) 'jupyter-org-request)))
      (when is-org-request
        (jupyter-with-message-content msg (status payload)
          (when (and (jupyter-org-request-async-p req)
                     (equal status "ok")
                     (jupyter-org-request-id-cleared-p req))
            (org-with-point-at (jupyter-org-request-marker req)
              (/jupyter-clean-async--results)
              ))))
      args))

  (unless (advice-member-p #'/jupyter-clean-async-results 'jupyter-handle-execute-reply)
    (advice-add 'jupyter-handle-execute-reply :filter-args #'/jupyter-clean-async-results)))


;; (plist-put org-format-latex-options :scale 1.5)



(provide 'config-org)
