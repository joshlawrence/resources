;; init.el
;; 2018-06-13 jhl

;; instructions:
;; M-x package-refresh-contents
;; now install the packages:
;; M-x package-install RET neotree doom-themes evil
;; you also have to install fonts for neotree:
;; https://github.com/domtronn/all-the-icons.el

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (neotree doom-themes dracula-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'doom-themes)
(load-theme 'doom-one t)
(doom-themes-neotree-config)

(require 'evil)
(evil-mode 1)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; to debug the .emacs file
(setq debug-on-error nil)
(setq visible-bell nil)

;; setup the default mode to use
;;Text mode is happier than Fundamental mode ;-)
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)

;; define the mail and name
(setq user-mail-address "joshlawrence@fastmail.com")
(setq user-full-name "Josh Lawrence")

;; be nice with X clipboard
(setq x-select-enable-clipboard t)

;; use Control+g for goto-line
(global-set-key [(control g)] 'goto-line)

;; enable menubar and tool bar
(menu-bar-mode 1)
(tool-bar-mode 1)

;; turn on font-lock mode
(global-font-lock-mode t)
(require 'font-lock) ; enable syntax highlighting

;; simple cut, copy, paste
(global-set-key [f2] 'clipboard-kill-region)
(global-set-key [f3] 'clipboard-kill-ring-save)
(global-set-key [f4] 'clipboard-yank)

(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)

(global-set-key [delete] 'delete-char)

;;(dysplay question in 'y/n' instead of 'yes/no')
(fset 'yes-or-no-p 'y-or-n-p)

;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

(setq make-backup-files nil)
