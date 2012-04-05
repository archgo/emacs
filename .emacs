;; -*- coding: utf-8 -*-

;;;; load base settings
(add-to-list 'load-path "~/.emacs.d/arch-config")
(require 'arch-utils)
(require 'arch-font)
(require 'arch-basic)
(require 'arch-minor-modes)
(require 'arch-key)
;(require 'arch-viper)
(require 'arch-evil);;c-x与emacs冲突
;(require 'arch-color-theme);;没理想外挂
(require 'arch-mode-line)
(require 'diary);;放在后面不管用，报错
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
