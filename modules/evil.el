;; -*- lexical-binding: t; -*-


;; Code

(use-package evil
  :straight t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (setq evil-default-state 'emacs)
  (evil-mode 1)
  (evil-set-initial-state 'prog-mode 'normal))


;;; evil.el ends here
