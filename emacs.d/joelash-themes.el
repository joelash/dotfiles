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

(provide 'joelash-themes)
