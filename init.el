;; -*- lexical-binding: t; -*-

(defmacro chaos-toggle-mode (on/off &rest modes)
  "Turns ON/OFF the specified MODES."
  (declare (indent defun))
  (if (string= (symbol-name on/off) "off")
      `(progn
	 ,@(mapcar (lambda (mode) `(,mode -1))
		   modes))
    `(progn
       ,@(mapcar (lambda (mode) `(,mode 1))
		 modes))))

(chaos-toggle-mode off
  menu-bar-mode
  tool-bar-mode
  scroll-bar-mode)

(chaos-toggle-mode on
  ido-mode
  global-visual-line-mode)

(defmacro chaos-global-set-key (key proc)
  `(global-set-key (kbd ,key) ',proc))

(chaos-global-set-key "M-1" delete-other-windows)
(chaos-global-set-key "M-2" split-window-below)
(chaos-global-set-key "M-3" split-window-right)
(chaos-global-set-key "M-0" delete-window)

(defmacro chaos-hook (hook &rest procs)
  `(add-hook ',(intern (concat (symbol-name hook) "-hook"))
	     (lambda ()
	       (progn
		 ,@procs))))

(chaos-hook prog-mode
	    (setq display-line-numbers 'relative))


;;; init.el ends here
