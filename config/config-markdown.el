;;; package --- markdown Configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.md$" markdown-mode)

(after 'markdown-mode
  (setq markdown-command "pandoc")
  )

(provide 'config-markdown)
;;; config-markdown.el ends here
