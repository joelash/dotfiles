(package-require 'theme-park-mode)

;; Themes
(package-require 'tronesque-theme)
(package-require 'jujube-theme)
(package-require 'soothe-theme)
(package-require 'noctilux-theme)

;; Color theme
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "themes"))
;; (load-theme 'noctilux t)
(load-theme 'misterioso t)

(require 'color)

(let ((bg (face-attribute 'default :background)))
  (guibg 'cursor (color-darken-name bg 1))
  (guifg 'highlight nil)
  (guibg 'highlight (color-lighten-name bg 20)))

(provide 'joelash-themes)
