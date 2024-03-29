;;; config-bufler.el --- butler for buffer.

;;; Commentary:
;;  Bufler is like a butler for your buffers, presenting them to you in an organized way based on your instructions. The instructions are written as grouping rules in a simple language, allowing you to customize the way buffers are grouped. The default rules are designed to be generally useful, so you don’t have to write your own.
;; It also provides a workspace mode which allows frames to focus on buffers in certain groups. Since the groups are created automatically, the workspaces are created dynamically, rather than requiring you to put buffers in workspaces manually.

(require-package 'bufler)

;; https://github.com/alphapapa/bufler.el#usage

(bufler-mode)

(global-set-key (kbd "H-b") 'bufler)
(define-key bufler-list-mode-map (kbd "H-h b") 'hydra:bufler/body)


(provide 'config-bufler)

;;; config-bufler.el ends here
