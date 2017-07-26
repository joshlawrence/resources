;; .emacs init file

;; setup package repos
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; full-screen
(setq ns-use-native-fullscreen nil)

;; disable auto-save
(setq auto-save-default nil)
(setq make-backup-files nil)

;; 80 column rule
(setq-default fill-column 80)

;; neotree config
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(setq neo-theme 'ascii)
(setq neo-window-fixed-size nil)

;; themes
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; move customize blocks to another file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

