;;; config-highlight-indent-guides.el --- minor mode for indentation highlighting

;;; Commentary:
;; This minor mode highlights indentation levels via font-lock. Indent widths are dynamically discovered, which means this correctly highlights in any mode, regardless of indent width, even in languages with non-uniform indentation such as Haskell. By default, this mode also inspects your theme dynamically, and automatically chooses appropriate colors for highlighting. This mode works properly around hard tabs and mixed indentation, and it behaves well in large buffers.

(require-package 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-responsive 'top)

(provide 'config-highlight-indent-guides)

;;; config-highlight-indent-guides.el ends here
