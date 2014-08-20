(package-require 'theme-park-mode)

(package-require 'powerline)
(powerline-default-theme)

;; Themes
(package-require 'tronesque-theme)
(package-require 'jujube-theme)
(package-require 'soothe-theme)
(package-require 'noctilux-theme)
(package-require 'monokai-theme)
(package-require 'color-theme-sanityinc-tomorrow)

;; Color theme
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "themes"))
;; (load-theme 'noctilux t)
;; (load-theme 'misterioso t)
;; (load-theme 'monokai t)
(load-theme 'sanityinc-tomorrow-night t)

(require 'color)

(defun update-hl-line-bg ()
  (interactive)
  (let ((bg (face-attribute 'default :background)))
    (guibg 'cursor (color-lighten-name bg 10))
    (guifg 'highlight nil)
    (guibg 'highlight (color-lighten-name bg 20))))

(update-hl-line-bg)

(provide 'joelash-themes)
