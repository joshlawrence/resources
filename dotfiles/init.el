;; .emacs init file
;; August 1, 2017 at 11:25:20 AM CDT

;; setup package repos
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; full-screen
;(setq ns-use-native-fullscreen nil)

;; disable auto-save
(setq auto-save-default nil)
(setq make-backup-files nil)

;; wrap at 80 columns
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)

;; neotree config
;(require 'neotree)
;(global-set-key [f8] 'neotree-toggle)
;(setq neo-smart-open t)
;(setq neo-theme 'ascii)
;(setq neo-window-fixed-size nil)

;; themes
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'base16-ashes t)

;; move customize blocks to another file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
