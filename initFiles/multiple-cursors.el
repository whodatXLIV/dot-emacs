;; MULTIPLE CURSORS CONFIGURATION
;;--------------------------------------------------

(use-package multiple-cursors
  :ensure t
  :bind (     ("C-> e" . mc/edit-lines)
	      ("C-> m" . mc/mark-more-like-this-extended)
	      ("C-> a" . mc/mark-all-like-this)
	      ("C-> n" . mc/insert-numbers)
	      ("C-> l" . mc/insert-letters)              
	      )
  )
