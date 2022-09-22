(when (eq dotemacs-pair-engine 'smartparens)
  (require-package 'smartparens)
  (require 'smartparens-config)

  
  (smartparens-global-mode t)

  (require-package 'bind-key)
  
   (bind-keys
   :map smartparens-mode-map
   	     ("M-<up>" . sp-beginning-of-sexp)
   	     ("M-<down>" . sp-end-of-sexp)

   	     ("C-<right>" . sp-forward-slurp-sexp)
   	     ("M-<right>" . sp-forward-barf-sexp)
   	     ("C-<left>"  . sp-backward-slurp-sexp)
   	     ("M-<left>"  . sp-backward-barf-sexp)

   	     ("C-M-k" . sp-kill-sexp)
   	     ("C-k"   . sp-kill-hybrid-sexp)
   	     ("M-k"   . sp-backward-kill-sexp)
   	     ("C-M-w" . sp-copy-sexp)

   	     ("M-s s" . sp-split-sexp)
   	     ("M-s j" . sp-join-sexp)

   	     ("M-]" . sp-backward-unwrap-sexp)
   	     ("M-[" . sp-unwrap-sexp)
   	     ; C-M space highlights words forward then use par to wrap them
   	     ("C-x C-t" . sp-transpose-hybrid-sexp)))

 (set-face-attribute 'highlight nil :background "forest green" :foreground "white")

  (provide 'config-smartparens)
