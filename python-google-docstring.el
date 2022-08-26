;; -*- lexical-binding: t; -*-

(defcustom python-google-docstring-return "0"
  "return return info")
(defcustom python-google-docstring-default "1"
  "return default value")
(defcustom python-google-docstring-type "0"
  "return type info")

(defvar python-google-docstring-python-file
  (expand-file-name "format-g-docs.py" (file-name-directory load-file-name)))

(defun python-google-docstring ()
  "Generate google-style docstring for python."
  (interactive)
  (if (region-active-p)
      (progn
        (call-process-region (region-beginning) (region-end) "python3" nil t t
                             python-google-docstring-python-file
                             python-google-docstring-return
                             python-google-docstring-default
                             python-google-docstring-type)
        (message "Docs are generated")
        (deactivate-mark))
    (message "No region active; can't generate docs!"))
  )

(provide 'python-google-docstring)
