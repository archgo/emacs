;========================Session变量存储=======================
;; Session变量存储
(arch/plugin:prepend-to-load-path "session")
(require 'session)
(add-hook 'after-init-hook 'session-initialize)


;;书签保存
(setq bookmark-save-flag t)
;;t means save bookmarks when Emacs is killed.

;;==========保存==========
(desktop-save-mode t)

;========================最近文件=======================
;; Recent File
;;;;(require 'recentf)
;;;;(recentf-mode 1)
;;;;(defun recentf-open-files-compl ()
;;;;  (interactive)
;;;;  (let* ((all-files recentf-list)
;;;;	 (tocpl (mapcar (function
;;;;   (find-file (cdr (assoc-ignore-representation fname tocpl)))))

;========================文件=====================
(setq make-backup-files nil)
;; 设定不产生备份文件
;;(setq version-control 'never);;不需要而不是想换个地方保存备份文件

(setq auto-save-mode nil)
;;自动保存模式

(setq-default make-backup-files nil)
;; 不生成临时文件

;;备份设置
;; (setq version-control t);;启用版本控制，即可以备份多次
;; (setq kept-old-versions 2);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
;; (setq kept-new-versions 5);;备份最新的版本1次，理解同上
;; (setq delete-old-versions t);;删掉不属于以上7中版本的版本
;; (setq backup-directory-alist '(("." . "~/backups")));;设置备份文件的路径
;; (setq backup-by-copying t);;备份设置方法，直接拷贝
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/backups")。对于每个备份文件，保留最原始的两个版本和最新的
;; 1个版本。并且备份的时候，备份文件是复本，而不是原件。

;========================文件=====================
;; 全局快捷键
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;;设置home键指向buffer开头，end键指向buffer结尾


(global-set-key (kbd "C-,") 'scroll-left)
;; "C-,"设为屏幕左移命令
(global-set-key (kbd "C-.") 'scroll-right)
;; "C-."设为屏幕右移命令

(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

(global-set-key [f3] 'repeat-complex-command)

(global-set-key [f4] 'other-window)
;; 跳转到 Emacs 的另一个buffer窗口

(defun du-onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
  (global-set-key [C-f5] 'compile)
  (global-set-key [f5] 'du-onekey-compile)
;;  C-f5, 设置编译命令; f5, 保存所有文件然后编译当前窗口文件

(global-set-key [f6] 'gdb)            
;;F6设置为在Emacs中调用gdb

(global-set-key [C-f7] 'previous-error)
(global-set-key [f7] 'next-error)

(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))
(global-set-key [(f8)] 'open-eshell-other-buffer)
(global-set-key [C-f8] 'eshell)
;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell

(setq speedbar-show-unknown-files t);;可以显示所有目录以及文件
(setq dframe-update-speed nil);;不自动刷新，手动 g 刷新
(setq speedbar-update-flag nil)
(setq speedbar-use-images nil);;不使用 image 的方式
(setq speedbar-verbosity-level 0)

;;下面的打开ecb也是F9
;;(global-set-key [f9] 'speedbar)
;;设置f9调用speedbar命令
;;使用 n 和 p 可以上下移动，
;; + 展开目录或文件进行浏览，- 收缩，RET 访问目录或文件，g 更新 speedbar。

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;;让 dired 可以递归的拷贝和删除目录。

(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")
;; 设置时间戳，标识出最后一次保存文件的时间。


(provide 'save)
