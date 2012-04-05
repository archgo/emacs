;; -*- coding: utf-8 -*-

;; viper-mode
(setq viper-custom-file-name "~/.emacs.d/arch-config/arch-viper-rc.el")
(setq viper-mode t)
(require 'viper)
(arch/plugin:prepend-to-load-path "vimpulse-0.5")
(require 'vimpulse)


(provide 'arch-viper)
