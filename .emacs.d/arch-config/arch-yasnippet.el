;; -*- coding: utf-8 -*-

;; yasnippet
(arch/plugin:prepend-to-load-path "yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (arch/plugin:expand-file-name "yasnippet-0.6.1c/snippets"))


(provide 'arch-yasnippet)
