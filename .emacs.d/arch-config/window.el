;;;;;;;;;;;;;;;;;;;;;;;;;;;  设置窗口界面 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 各窗口间切换  
(global-set-key [M-left] 'windmove-left)  
(global-set-key [M-right] 'windmove-right)  
(global-set-key [M-up] 'windmove-up)  
(global-set-key [M-down] 'windmove-down)

(global-set-key [f4] 'speedbar)  

;;布局
(setq ecb-compile-window-height 8)
(setq ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("*shell*") ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*") ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*") ("*Python*"))))
  
(setq ecb-tip-of-the-day nil)
  
(setq ecb-layout-name "leftright2")
(setq ecb-windows-width 0.2) 



;让Emacs启动后自动最大化
;在你的.emacs文件里面加入上面这些就行了,其实,稍微明白点的都懂,这里面用defun定义了三个函数,作用分别对应于Window的最大化,最小化,还原三个功能.当然这个方法只适合Windows,而且好像emacs22高版本才行,具体需要什么版本我没有注意,不过如果你加入了发现无法正常使用,那么估计是你的版本不适合啦,赶快用emacs22,我个人推荐直接用emacs23,因为支持gbk嘛.
(defun emacs-maximize ()
  "Maximize emacs window in windows os"
  (interactive)
  (w32-send-sys-command 61488))        ; WM_SYSCOMMAND #xf030 maximize
(defun emacs-minimize ()
  "Minimize emacs window in windows os"
  (interactive)
  (w32-send-sys-command #xf020))    ; #xf020 minimize还不是#xf开头，直接数字61728
(defun emacs-normal ()
  "Normal emacs window in windows os"
  (interactive)
  (w32-send-sys-command #xf120))    ; #xf120 normalimize或61488（这个是真的最大化）
;; 启动emacs时窗口最大化
(when window-system
(emacs-maximize)) 

;;putty终端下，必须要用鼠标左键点一下emacs的菜单部分，才能使鼠标对emacs有效

(set-scroll-bar-mode 1)
;;取消滚动栏

;;(customize-set-variable 'scroll-bar-mode 'right)
;;设置滚动栏在窗口右侧，而默认是在左侧

(tool-bar-mode nil)
;;取消工具栏,basic中已经定义为0了，一般情况都是后面的设置覆盖前面的（如scroll），但这个古怪，是负负得正

(setq default-frame-alist
             '((vertical-scroll-bars) 
               ;(top . 25)
               ;(left . 45)                              
               ;(width . 85)
               ;(height . 32)          
               ;(background-color . "black")
               ;(foreground-color . "grey")
               ;(cursor-color     . "gold1")
               ;(mouse-color      . "gold1")
               (tool-bar-lines . 0)
               (menu-bar-lines . 1)
               (right-fringe)
               (left-fringe)))

;(set-foreground-color "grey")
;(set-background-color "black")
;(set-cursor-color "gold1")
;(set-mouse-color "gold1")

              
;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;  设置界面结束  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'window)