;;;;;;;;;;;;;;;;;;;;;;;;;;;  ���ô��ڽ��� ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; �����ڼ��л�  
(global-set-key [M-left] 'windmove-left)  
(global-set-key [M-right] 'windmove-right)  
(global-set-key [M-up] 'windmove-up)  
(global-set-key [M-down] 'windmove-down)

(global-set-key [f4] 'speedbar)  

;;����
(setq ecb-compile-window-height 8)
(setq ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("*shell*") ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*") ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*") ("*Python*"))))
  
(setq ecb-tip-of-the-day nil)
  
(setq ecb-layout-name "leftright2")
(setq ecb-windows-width 0.2) 



;��Emacs�������Զ����
;�����.emacs�ļ��������������Щ������,��ʵ,��΢���׵�Ķ���,��������defun��������������,���÷ֱ��Ӧ��Window�����,��С��,��ԭ��������.��Ȼ�������ֻ�ʺ�Windows,���Һ���emacs22�߰汾����,������Ҫʲô�汾��û��ע��,�������������˷����޷�����ʹ��,��ô��������İ汾���ʺ���,�Ͽ���emacs22,�Ҹ����Ƽ�ֱ����emacs23,��Ϊ֧��gbk��.
(defun emacs-maximize ()
  "Maximize emacs window in windows os"
  (interactive)
  (w32-send-sys-command 61488))        ; WM_SYSCOMMAND #xf030 maximize
(defun emacs-minimize ()
  "Minimize emacs window in windows os"
  (interactive)
  (w32-send-sys-command #xf020))    ; #xf020 minimize������#xf��ͷ��ֱ������61728
(defun emacs-normal ()
  "Normal emacs window in windows os"
  (interactive)
  (w32-send-sys-command #xf120))    ; #xf120 normalimize��61488������������󻯣�
;; ����emacsʱ�������
(when window-system
(emacs-maximize)) 

;;putty�ն��£�����Ҫ����������һ��emacs�Ĳ˵����֣�����ʹ����emacs��Ч

(set-scroll-bar-mode 1)
;;ȡ��������

;;(customize-set-variable 'scroll-bar-mode 'right)
;;���ù������ڴ����Ҳ࣬��Ĭ���������

(tool-bar-mode nil)
;;ȡ��������,basic���Ѿ�����Ϊ0�ˣ�һ��������Ǻ�������ø���ǰ��ģ���scroll����������Ź֣��Ǹ�������

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

              
;; ��������һЩ��ɫ���﷨������ʾ�ı��������⣬����ѡ��ı��������⣬����ѡ��ı�����ѡ��
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;  ���ý������  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'window)