;;; package --- latex configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.tex$" tex-mode)

(after 'tex-mode
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (require 'reftex)
  (require 'flyspell)
  (require-package 'pdf-view)


  (add-hook 'tex-mode-hook 'visual-line-mode)
  (add-hook 'tex-mode-hook 'flyspell-mode)
  (add-hook 'tex-mode-hook 'LaTeX-math-mode)
  (add-hook 'tex-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t)

  

  (require-package 'pdf-tools)
  (pdf-tools-install) ;;for view pdfs
  (load "pdf-tools") ;;for spooling to pdf.

  ;; view generated PDF with pdf-tools.

  ;; (add-to-list 'TeX-view-program-list '(("PDF Tools" "TeX-pdf-tools-sync-view")))
  ;; '(output-pdf "PDF Tools"))
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
	TeX-source-correlate-start-server t)
  (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))))
(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
          #'TeX-revert-document-buffer)
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

(fset 'recipeEnvironment
   "\\begin{recipe\C-f\C-m\C-m[\C-mpreparationtime={\\unit[\C-f{\C-f\C-f,\C-o\C-mbakingtime={\\unit[\C-f{\C-f\C-f,\C-mbakingtemperature={\\unit[\C-f{\C-f\C-f,\C-mportion={\C-f\C-n\C-m{Name\C-f\C-m\C-m\\introduction{\C-f\C-o\C-o\C-n\C-i\\ingredients{\C-f\C-m\\preparation{\C-o\C-m\\step{\C-f\C-n\C-m\C-a\\end{recipe")

(fset 'insertIngredient
   "\\unit[\C-f{\C-f &  \\\\\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b")


(provide 'config-latex)

;;; config-auctec.el ends here
