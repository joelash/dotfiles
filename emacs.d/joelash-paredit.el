;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paredit
(package-require 'paredit)
(require 'paredit)

(defun paredit-wrap-quote ()
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

(defun joelash/define-paredit-keys ()
  (progn
    (nlmap "W("  'paredit-wrap-round)
    (nlmap "W["  'paredit-wrap-square)
    (nlmap "W{"  'paredit-wrap-curly)
    (nlmap "W\"" 'paredit-wrap-quote)
    (nlmap "("   'paredit-backward-slurp-sexp)
    (nlmap ")"   'paredit-backward-barf-sexp)
    (nlmap "{"   'paredit-forward-barf-sexp)
    (nlmap "}"   'paredit-forward-slurp-sexp)
    (nlmap "S"   'paredit-splice-sexp)
    (nlmap "s"   'paredit-split-sexp)
    (nlmap "T"   'transpose-sexps)
    (nlmap "t"   'clojure-test-run-test)
    (nlmap "Y"   'paredit-copy-as-kill)
    (nlmap "C"   'joelash/paredit-insert)
    (nlmap "D"   'paredit-kill)))

(provide 'joelash-paredit)
