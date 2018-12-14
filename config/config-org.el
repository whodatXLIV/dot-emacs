
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
  
  (setq org-startup-folded t)
  (setq org-startup-indented t)
  (setq org-log-done t)
  
  (setq org-hide-emphasis-markers t)
  (setq org-pretty-entities 1)
  (setq org-pretty-entities-include-sub-superscripts nil)
  (setq org-src-fontify-natively t)
  (add-hook 'org-mode-hook #'(lambda ()
			       (visual-line-mode)))

  )

(setq org-directory '("~/Documents"))  
(setq org-agenda-files '("~/Documents/todo.org"))
(setq org-archive-location '("~/Documents/archive"))
(setq org-default-notes-file '("~/Documents/notes.org"))


(custom-set-variables
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 10)
 '(org-agenda-show-all-dates t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-log-into-drawer t)
 )


(provide 'config-org)
