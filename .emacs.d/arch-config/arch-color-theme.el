;; -*- coding: utf-8 -*-

;; Color Theme
(arch/plugin:prepend-to-load-path "color-theme-6.6.0")
(require 'color-theme)

;; Color theme subdued
(require 'color-theme-subdued)
(color-theme-subdued)

;; color theme solarized
;(arch/plugin:prepend-to-load-path "color-theme-solarized")
;(require 'color-theme-solarized)
;(color-theme-solarized-dark)

(provide 'arch-color-theme)
