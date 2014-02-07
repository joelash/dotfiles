;;; Clojure

;;;;; Required packages
(package-require 'paredit)
(package-require 'rainbow-delimiters)
(package-require 'clojure-mode)
(package-require 'clojure-test-mode)
(package-require 'clojurescript-mode)
(package-require 'cider)
(package-require 'ac-nrepl)
(package-require 'clj-refactor)

(require 'clojure-mode)
(require 'clojurescript-mode)
(require 'clj-refactor)
(require 'joelash-paredit)

;;;; Cider settings

(setq cider-interactive-eval-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock nil)

(setq nrepl-hide-special-buffers t)
;; Stop the error buffer from popping up while working in buffers
;; other than the REPL
(setq cider-popup-stacktraces nil)

;(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces nil)
;; Do not auto-select the error buffer when it's displayed.
(setq cider-auto-select-error-buffer t)

;;;; Hooks

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'joelash/define-paredit-keys)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(defun clj-scratch ()
  "Create/retrieve a Clojure scratch buffer and switch to it.."
  (interactive)
  (let ((buf (get-buffer-create "*clj-scratch*")))
    (switch-to-buffer buf)
    (clojure-mode)))

(defun cljs-scratch ()
  "Create/retrieve a ClojureScript scratch buffer and switch to it.."
  (interactive)
  (let ((buf (get-buffer-create "*cljs-scratch*")))
    (switch-to-buffer buf)
    (clojurescript-mode)))

;; Execute thing from Joel Holdbrooks
;; Commandeered from https://github.com/halgari/clojure-conj-2013-core.async-examples#usage
(defun cider-eval-expression-at-point-in-repl ()
  (interactive)
  (let ((form (cider-defun-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    (set-buffer (cider-find-or-create-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))

(defun cider-eval-sexp-at-point-in-repl ()
  (interactive)
  (let ((form (cider-sexp-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    (set-buffer (cider-find-or-create-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))

(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               ;; insert keybinding setup here
                               ))

(cljr-add-keybindings-with-prefix "C-c C-r")

;;;; Keybindings


(define-key clojure-mode-map (kbd "C-;") 'cider-eval-expression-at-point-in-repl)
(define-key clojure-mode-map (kbd "C-:") 'cider-eval-sexp-at-point-in-repl)

(provide 'joelash-clojure)
