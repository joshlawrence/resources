
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; backups

;; disable auto-save
;;(setq auto-save-default nil)
;;(setq make-backup-files nil)

(setq
  backup-by-copying t
  backup-directory-alist '(("." . "~/.emacs.d/bkups"))
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
