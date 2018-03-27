(after 'org
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cb" 'org-switchb)
  
  (setq org-todo-keywords
	'((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELLED")))

  (setq org-directory '("~/Google\ Drive/Org"))  
  (setq org-agenda-files org-directory)
  (setq org-archive-location '("~/Google Drive/Org~/Google\ Drive/Org/Archive"))
  (setq org-default-notes-file '("~/Google Drive/Org/notes.org"))

  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Google Drive/Org/notes.org" "Tasks")
	   "* TODO %?\n  %i\n  %a")))
  
  (setq org-startup-folded t)
  (setq org-startup-indented t)
  (setq org-log-done t)
  
  )

(provide 'config-org)
