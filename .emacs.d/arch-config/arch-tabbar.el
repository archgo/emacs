;; -*- coding: utf-8 -*-
;======================== tabbar设置 ========================
;;;没有时提示<DOCTYPE，文件夹有时是：tabbar或 emhacks

(arch/plugin:prepend-to-load-path "tabbar-2.0")
(require 'tabbar)
(tabbar-mode t)
(set-face-attribute 'tabbar-default nil
                    :family "Consolas"
                    :background "gray80"
                    :foreground "gray30"
                    :height 1.0
                    )
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "gray30")
                    )
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "DarkGreen"
                    :background "LightGoldenrod"
                    :box '(:line-width 2 :color "DarkGoldenrod")
                    ;; :overline "black"
                    ;; :underline "black"
                    :weight 'bold
                    )
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 2 :color "gray70")
                    )
;========================tabbar设置结束=======================

(provide 'arch-tabbar)
