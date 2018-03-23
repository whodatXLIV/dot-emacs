;;MARKDOWN MODE CONFIGURATION
;;------------------------------

(use-package flymd
  :ensure t
  :init
  (cond ((eq system-type 'windows-nt)
	  ;; Windows-specific code goes here.
(defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function)
	  )
          ((eq system-type 'darwin)
           ;; Linux-specific code goes here.
  (defun my-flymd-browser-function (url)
    (let ((process-environment (browse-url-process-environment)))
      (apply 'start-process
	     (concat "firefox " url)
	     nil
	     "/usr/bin/open"
	     (list "-a" "firefox" url))))
  (setq flymd-browser-open-function 'my-flymd-browser-function))
	   ))
