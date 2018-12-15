(require-package 'org-bullets)

(after 'org
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cb" 'org-switchb)
  
  (setq org-todo-keywords
	'((sequence "TODO(t!)" "IN-PROGRESS(p!/@)" "WAITING(w!/@)" "|" "DONE(d)")))

  (setq org-tag-alist '((:startgroup . nil)
			("@work" . ?w) ("@home" . ?h)
			(:endgroup . nil)
			("BRITTON" . ?b)
			("DAN" . ?d)
			("REZA" . ?r)
			("MALCOLM" . ?m)
			("TRIPP" . ?t)
			)
	)
  
  (setq org-capture-templates
	'(
	  ("t" "Todo" entry (file+headline "~/Documents/todo.org" "Tasks")
	   "* TODO %a\n %?\n %T\n")
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

  ;;; BEAUTIFYING ORG
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  (setq org-bullets-bullet-list '(" " "➢" "⊛" "⊛" "⊛" "⊛" "⊛" "⊛")
	org-ellipsis "..."
	org-hide-emphasis-markers t
	org-pretty-entities 1
	org-pretty-entities-include-sub-superscripts nil
	org-src-fontify-natively t
	org-fontify-whole-heading-line t
	org-fontify-done-headline t
	org-fontify-quote-and-verse-blocks t
	)

  

    
    
  (custom-theme-set-faces 'user
                          `(org-level-8 ((t
					  (:font "Verdana" :weight regular :foreground "gray50" )
					  )))
                          `(org-level-7 ((t
					  (:font "Verdana" :weight regular :foreground "gray60" )
					  )))
                          `(org-level-6 ((t
					  (:font "Verdana" :weight regular :foreground "DarkOliveGreen" )
					  )))
                          `(org-level-5 ((t
					  (:font "Verdana" :weight regular :foreground "orange3" )
					  )))
                          `(org-level-4 ((t
					  (:font "Verdana" :weight regular :foreground "SlateBlue3" :height 1.1)
					  )))
                          `(org-level-3 ((t
					  (:font "Verdana" :weight regular :foreground "SkyBlue" :height 1.2)
					  )))
                          `(org-level-2 ((t (:font "Courier New"
						 :weight regular
						 :underline t
						 :foreground "salmon"
						 :height 1.3
						 ))))
                          `(org-level-1 ((t (:font "American Typewriter"
						 :weight regular
						 :background "gray15"
						 :foreground "#70c0b1"
						 :height 1.5
						 ))))

  			  '(org-todo ((t (:foreground "OrangeRed"
						    :background "gray10"
						    :box (:color "firebrick" :line-width 2 :style none)
						    :height 1
						    ))))
			  '(org-done ((t (:foreground "lime green"
						    :background "gray10"
						    :box (:color "forest green" :line-width 2 :style none)
						    :height 1
						    ))))

			  '(org-headline-done ((t (:inherit default :strike-through t))))
			  
                          ;; `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))
  			  '(org-block                 ((t (:inherit default))))
  			  '(org-document-info         ((t (:foreground "dark orange"))))
  			  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  			  '(org-link                  ((t (:foreground "royal blue" :underline t))))
  			  '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  			  '(org-property-value        ((t (:inherit fixed-pitch))) t)
  			  '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  			  '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  			  '(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
  			  )
    
  
  

  (setq org-directory '("~/Documents")
	org-agenda-files '("~/Documents/todo.org")
	org-archive-location '("~/Documents/archive")
	org-default-notes-file '("~/Documents/notes.org")))


(setq org-agenda-ndays 7
      org-deadline-warning-days 10
      org-agenda-show-all-dates t
      org-agenda-start-on-weekday nil
      org-reverse-note-order t
      org-fast-tag-selection-single-key (quote expert)
      org-log-into-drawer t
      )

(plist-put org-format-latex-options :scale 1.5)



(provide 'config-org)
