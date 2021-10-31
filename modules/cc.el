;; -*- lexical-binding: t; -*-


;; Code

(defun chaos-c-setup ()
  (setq tab-width 8
        indent-tabs-mode t)
  (c-set-style "linux"))

(use-package cc-mode
  :ensure nil
  :hook
  (c-mode-common . chaos-c-setup))


;;; cc.el ends here
