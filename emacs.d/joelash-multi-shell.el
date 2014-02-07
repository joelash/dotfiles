;; Like multi-term but for shell. 

(defun joelash/shell-buffer-name (n)
  (format "*shell<%d>*" n))

(defun joelash/next-available-shell-buffer-name ()
  (let ((n 1))
    (while (get-buffer (joelash/shell-buffer-name n))
      (setq n (+ n 1)))
    (joelash/shell-buffer-name n)))

(defun multi-shell ()
  (interactive)
  (shell (joelash/next-available-shell-buffer-name)))

(provide 'joelash-multi-shell)
