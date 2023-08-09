;;; config-git-gutter.el --- git-gutter configurations

;;; Commentary:
;; This pacakge is a plug-in to show information about files in a git repository


(require 'git-gutter-fringe)
(global-git-gutter-mode t)

                                        ; If you want to show git diff information at right fringe
(setq git-gutter-fr:side 'right-fringe)


;; (setq-default left-fringe-width  20)
;; (setq-default right-fringe-width 10)
(fringe-helper-define 'git-gutter-fr:added nil
  "...XX..."
  "...XX..."
  "...XX..."
  "XXXXXXXX"
  "XXXXXXXX"
  "...XX..."
  "...XX..."
  "...XX...")
(fringe-helper-define 'git-gutter-fr:deleted nil
  "......."
  "......."
  "......."
  "XXXXXXXX"
  "XXXXXXXX"
  "........"
  "........"
  "........")
(fringe-helper-define 'git-gutter-fr:modified nil
  "........"
  "...XX..."
  "..XXXX.."
  ".XXXXXX."
  ".XXXXXX."
  "..XXXX.."
  "...XX..."
  "........")

(set-face-foreground 'git-gutter-fr:added "mediumseagreen")
(set-face-foreground 'git-gutter-fr:deleted "firebrick")
(set-face-foreground 'git-gutter-fr:modified "darkorchid2")
(set-face-background 'git-gutter-fr:modified nil) 


(provide 'config-git-gutter-fringe)

;;; config-git-gutter-fringe.el ends here
