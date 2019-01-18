;;; package --- php-mode configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.php$" php-mode)

(after 'php-mode
  '(require 'php-ext)
  )


(provide 'config-php)
;;; config-php.el ends here
