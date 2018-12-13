(after 'org
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cb" 'org-switchb)
  
  (setq org-todo-keywords
	'((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELLED")))


  (setq org-capture-templates
	'(
	  ("t" "Todo" entry (file+headline "~/Documents/todo.org" "Tasks")
	   "* TODO %?\n  %i\n  %a\n")
	  ("s" "School" entry (file+headline "~/Documents/todo.org" "School")
	   "* TODO %?\n %i\n %a\n")
	  )
	)
  
  (setq org-startup-folded t)
  (setq org-startup-indented t)
  (setq org-log-done t)
  
  )

(setq org-directory '("~/Documents"))  
(setq org-agenda-files '("~/Documents/todo.org"))
(setq org-archive-location '("~/Documents/archive"))
(setq org-default-notes-file '("~/Documents/notes.org"))


(provide 'config-org)
