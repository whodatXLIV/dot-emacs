;; SMARTPARENS CONFIGURATION
;;--------------------------------------------------

(use-package smartparens-config
  :ensure smartparens
  :init (smartparens-global-mode t)
  :bind(:map smartparens-mode-map
	     ("M-<up>" . sp-beginning-of-sexp)
	     ("M-<down>" . sp-end-of-sexp)

	     ;("C-<down>" . sp-down-sexp)
	     ;("C-<up>"   . sp-backward-up-sexp)
	    ; ("M-<down>" . sp-backward-down-sexp)
	    ; ("M-<up>"   . sp-up-sexp)

	     ;("C-M-f" . sp-forward-sexp)
	     ;("C-M-b" . sp-backward-sexp)

	     ;("C-M-n" . sp-next-sexp)
	     ;("C-M-p" . sp-previous-sexp)

	     ("C-<right>" . sp-forward-slurp-sexp)
	     ("M-<right>" . sp-forward-barf-sexp)
	     ("C-<left>"  . sp-backward-slurp-sexp)
	     ("M-<left>"  . sp-backward-barf-sexp)

	     ;("C-M-t" . sp-transpose-sexp)
	     ("C-M-k" . sp-kill-sexp)
	     ("C-k"   . sp-kill-hybrid-sexp)
	     ("M-k"   . sp-backward-kill-sexp)
	     ("C-M-w" . sp-copy-sexp)

	     ("M-s s" . sp-split-sexp)
	     ("M-s j" . sp-join-sexp)

	     ;("C-M-d" . delete-sexp)

	     ;("M-<backspace>" . backward-kill-word)
	     ;("C-<backspace>" . sp-backward-kill-word)
	     ;([remap sp-backward-kill-word] . backward-kill-word)

	     ("M-]" . sp-backward-unwrap-sexp)
	     ("M-[" . sp-unwrap-sexp)
	     ; C-M space highlights words forward then use par to wrap them
	     ("C-x C-t" . sp-transpose-hybrid-sexp)
	     )
  )
