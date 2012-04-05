;; -*- coding: utf-8 -*-

;;;; load base settings
(add-to-list 'load-path "~/.emacs.d/arch-config")
(require 'arch-utils)
(require 'arch-font)
(require 'arch-basic)
(require 'arch-minor-modes)
(require 'arch-key)
;(require 'arch-viper)
(require 'arch-evil);;c-x��emacs��ͻ
;(require 'arch-color-theme);;û�������
(require 'arch-mode-line)
(require 'diary);;���ں��治���ã�����
(require 'omni-hideshow)
(require 'gnus)
(require 'save)
(require 'window)


;;;; some complex mode
(require 'arch-dired)
(require 'arch-linum)
(require 'arch-org)
;;(require 'arch-slime)
(require 'arch-tabbar)
(require 'arch-yasnippet)
(require 'arch-auto-complete)
(require 'arch-python)
(require 'arch-cedet)
(require 'arch-auctex)

(require 'arch-compile)
(require 'arch)

;;(require 'auto-complete)
