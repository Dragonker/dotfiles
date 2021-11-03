;; -*- lexical-binding: t; -*-

;;  _____ ___________  ___  _____ _____  _   _ _____     _
;; /  ___|_   _| ___ \/ _ \|_   _|  __ \| | | |_   _|   | |
;; \ `--.  | | | |_/ / /_\ \ | | | |  \/| |_| | | |  ___| |
;;  `--. \ | | |    /|  _  | | | | | __ |  _  | | | / _ \ |
;; /\__/ / | | | |\ \| | | |_| |_| |_\ \| | | | | ||  __/ |
;; \____/  \_/ \_| \_\_| |_/\___/ \____/\_| |_/ \_(_)___|_|

(defvar bootstrap-version)

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)

      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package evil
  :straight t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (evil-set-initial-state 'org-mode 'emacs))

(use-package dracula-theme
  :straight t
  :config
  (load-theme 'dracula t))

(use-package org
  :ensure nil
  :config
  (setq org-hide-emphasis-markers t))

;; ---------------------------------------- 
;; ----------------------------------------   

(load (concat user-emacs-directory "helper.el"))

(chaos-toggle-mode off
  menu-bar-mode
  tool-bar-mode
  scroll-bar-mode)

(chaos-toggle-mode on
  ido-mode
  global-visual-line-mode)

(chaos-global-set-key "M-1" delete-other-windows)
(chaos-global-set-key "M-2" split-window-below)
(chaos-global-set-key "M-3" split-window-right)
(chaos-global-set-key "M-0" delete-window)

(chaos-global-set-key "M-[" chaos-previous-buffer)
(chaos-global-set-key "M-]" chaos-next-buffer)

(chaos-hook prog-mode
	    (setq display-line-numbers 'relative))

(set-frame-font "Iosevka-12")

(set-fontset-font (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Noto Sans CJK JP" . "unicode-bmp"))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)


;;; init.el ends here
