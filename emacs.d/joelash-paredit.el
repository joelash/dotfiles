;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paredit
(package-require 'paredit)
(require 'paredit)

(defun joelash/paredit-wrap-quote ()
  "Wrap the following sexp in double quotes."
  (interactive)
  (save-excursion
    (insert "\"")
    (forward-sexp)
    (insert "\"")))

(defun joelash/paredit-insert ()
  (interactive)
  (paredit-kill)
  (evil-insert-state))


(defun joelash/forward-transpose-sexps ()
  (interactive)
  (paredit-forward)
  (transpose-sexps 1)
  (paredit-backward))

(defun joelash/backward-transpose-sexps ()
  (interactive)
  (transpose-sexps 1)
  (paredit-backward)
  (paredit-backward))




(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(global-set-key (kbd "RET") 'electrify-return-if-match)

(defun joelash/define-paredit-keys ()
  (progn
    (nlmap "W("  'paredit-wrap-round)
    (nlmap "W["  'paredit-wrap-square)
    (nlmap "W{"  'paredit-wrap-curly)
    (nlmap "W\"" 'joelash/paredit-wrap-quote)
    (nlmap "("   'paredit-backward-slurp-sexp)
    (nlmap ")"   'paredit-backward-barf-sexp)
    (nlmap "{"   'paredit-forward-barf-sexp)
    (nlmap "}"   'paredit-forward-slurp-sexp)
    (nlmap "S"   'paredit-splice-sexp)
    (nlmap "s"   'paredit-split-sexp)
    (nlmap "T"   'joelash/backward-transpose-sexps)
    (nlmap "t"   'joelash/forward-transpose-sexps)
    (nlmap "Y"   'paredit-copy-as-kill)
    (nlmap "C"   'joelash/paredit-insert)
    (nlmap "D"   'paredit-kill)))

(provide 'joelash-paredit)
