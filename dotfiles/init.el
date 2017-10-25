;; disable auto-save
(setq auto-save-default nil)
(setq make-backup-files nil)

;; wrap at 80 columns
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)
