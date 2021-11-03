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

(defmacro chaos-global-set-key (key proc)
  `(global-set-key (kbd ,key) ',proc))

(defmacro chaos-hook (hook &rest procs)
  `(add-hook ',(intern (concat (symbol-name hook) "-hook"))
	     (lambda ()
	       (progn
		 ,@procs))))

(defun chaos-next-buffer ()
  (interactive)
  (let ((i 0))
    (next-buffer)
    (while (< i 100)
      (if (string= (substring (buffer-name) 0 1) "*")
	  (progn
	    (next-buffer)
	    (setq i (1+ i)))
	(setq i 100)))))

(defun chaos-previous-buffer ()
  (interactive)
  (let ((i 0))
    (previous-buffer)
    (while (< i 100)
      (if (string= (substring (buffer-name) 0 1) "*")
	  (progn
	    (previous-buffer)
	    (setq i (1+ i)))
	(setq i 100)))))
