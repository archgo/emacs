;; -*- coding: utf-8 -*-

;;'(load-file "D:\emacs-23.3\.emacs");;放在C:\~~~\.emacs文件里第一行且单独一行

;;改变默认路径，家目录一定要注意，设在emacs目录，不得有误，否则，插件配置有问题
;;可eval:(getenv "HOME")查询初始的HOME值（分大小写），然后把_emacs拷贝到此
;;据说"HKEY_CURRENT_USER\\SOFTWARE\\GNU\\Emacs", and then the key 
(setenv "HOME" "E:/emacs-23.4")
(setenv "PATH" "E:/emacs-23.4")

;;选取可被覆盖，可被删除
(delete-selection-mode 1)

;;设置打开文件的缺省路径
(setq default-directory "F:/source/project1")  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;定制操作习惯;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(ido-mode t)

(setq visible-bell t)
;;关闭烦人的出错时的提示声
(setq inhibit-startup-message t)
;;关闭emacs启动时的画面

(setq gnus-inhibit-startup-message t)
;;关闭gnus启动时的画面

(fset 'yes-or-no-p 'y-or-n-p)
;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。

(setq font-lock-maximum-decoration t)
;;(setq font-lock-global-modes '(not shell-mode text-mode))	;;这句导致语法不再高亮了
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))
;; 语法高亮。除 shell-mode 和 text-mode 之外的模式中使用语法高亮。

(setq global-font-lock-mode t)
;;进行语法加亮。

(blink-cursor-mode -1)
;; 指针不要闪，我得眼睛花了

(transient-mark-mode 1)
(setq-default transient-mark-mode t)
;;Non-nil if Transient-Mark mode is enabled.

;; 滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
scroll-margin 3
scroll-conservatively 10000)

;;(setq column-number-mode t)	;; 在 minibuffer 上面可以显示列号
;;(setq line-number-mode t)
;;(setq global-linum-mode t);行号
;;(global-linum-mode 'linum-mode);;在左边显示行号 
;;显示行列号

(setq mouse-yank-at-point t)
;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置。
;;不管你的光标在文档的那个位置，或是在 minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置。

;; 增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)

(setq kill-ring-max 200)
;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西

(setq-default auto-fill-function 'do-auto-fill)
 ; Autofill in all modes;;
(setq default-fill-column 120)
;;;; 显示默认的文档的宽度，把 fill-column 设为 60. 这样的文字更好读

(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)
(setq tab-stop-list ())
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

(setq enable-recursive-minibuffers t)
;;可以递归的使用 minibuffer

(setq scroll-margin 3 scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode

(setq show-paren-mode t) ;;打开括号匹配显示模式
(setq show-paren-style 'parenthesis)
;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。

(setq mouse-avoidance-mode 'animate)
;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。

(setq frame-title-format "emacs@%b")
;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。

(setq uniquify-buffer-name-style 'forward);;好像没起作用
;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的foobar<?> 形式。

(setq auto-image-file-mode t)
;;让 Emacs 可以直接打开和显示图片。

;(auto-compression-mode 1)  
;打开压缩文件时自动解压缩。

(setq-default kill-whole-line t)
;; 在行首 C-k 时，同时删除该行。

;; 以下定义的功能是将当前行设为本页第一行
(defun yao-line-to-top-of-window ()
"Move the line point is on to top of window."
(interactive)
(recenter 0))

(add-hook 'comint-output-filter-functions
      'comint-watch-for-password-prompt)
;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码


;允许屏幕左移
(put 'scroll-left 'disabled nil)     
;允许屏幕右移
(put 'scroll-right 'disabled nil)    
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;;把这些缺省禁用的功能打开。

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

(setq mouse-yank-at-point t)
;;使用鼠标中键可以粘贴

(setq user-full-name "XXXXXX")
(setq user-mail-address "XXXXXX@163.com")
;;设置有用的个人信息,这在很多地方有用。

(setq require-final-newline t)
;; 自动的在文件末增加一新行

(setq track-eol t)
;; 当光标在行尾上下移动的时候，始终保持在行尾。

(setq Man-notify-method 'pushy)
;; 当浏览 man page 时，直接跳转到 man buffer。

(setq next-line-add-newlines nil)
;;Emacs 21 中已经是缺省设置。按 C-n 或向下键时不添加新行。

(global-set-key (kbd "M-g") 'goto-line)
;;设置M-g为goto-line

(global-set-key (kbd "C-SPC") 'nil)
;;取消control+space键设为mark

(global-set-key (kbd "S-<SPC>") 'set-mark-command)
;;这样 我就不用按 C-@ 来 setmark 了, C-@ 很不好按。

;; 启动 Emacs 自动设置为两个窗口(上下各一个)
;(split-window-vertically)

;;=======================个人信息
;; 缺省的名字和邮件地址，很多地方用得到，比如 VC(version control) 中产生
;; ChangeLog 文件。
(setq user-full-name "Yao Heng")
(setq user-mail-address "yaoheng@sjtu.edu.cn")

;; 设置时间戳，标识出最后一次保存文件的时间。
;; 启用 time-stamp
(setq time-stamp-active t)
;; 去掉 time-stamp 的警告？
(setq time-stamp-warn-inactive t)
;; 设置 time-stamp 的格式，我如下的格式所得的一个例子：<hans 05/18/2004 12:01:12>
(setq time-stamp-format "%:u %02m/%02d/%04y %02H02M02S")
;; 将修改时间戳添加到保存文件的动作里。
(add-hook 'write-file-hooks 'time-stamp)

;; Emacs TODO 模式的相关文件,好像是作章节之用
;;;;(setq todo-file-do "~/.emacs.d/todo-do")
;;;;(setq todo-file-done "~/.emacs.d/todo-done")
;;;;(setq todo-file-top "~/.emacs.d/todo-top")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;定制操作习惯结束;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'arch)