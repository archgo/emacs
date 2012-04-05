;; -*- coding: utf-8 -*-

;;原始部分已被删除

;============================ 语言环境字符集设置 =================================

;;注意，由于此在后面所以这句有效
(set-default-font "Yahei Monaco:pixelsize=13")

;;发现每次启动emacs，会有*Compiling-log*的编译错误,只是屏蔽，没解决，一般不关，以免影响查阅
;;(setq byte-compile-warnings nil) 

;;;;;;;;;;;;;;;;;;;;语言环境字体设置结束;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Very useful tools when you want to know the font description under win32
;(w32-select-font nil nil)

;; test example:
;; Chinese : 测试
;; Katakana: わたし
;; Hirakana: ワタシ

;; background knowledge:
;; =================================================
;; http://stackoverflow.com/questions/7176276/what-is-script-name-symbol-means-for-emacs-set-fontset-font-function/7178821#7178821
;; 
;; what is "script name symbol" means for emacs set-fontset-font function?
;; (char-table-extra-slot char-script-table 0)
;; (list-character-sets)
;;
;; charset-script-alist
;; script-representative-chars
;; char-script-table
;; =================================================

;;; former used, leave here for reference
;; Font
;(create-fontset-from-fontset-spec
; (concat
;  "-outline-Bitstream Vera Sans Mono-bold-normal-normal-mono-14-*-*-*-c-*-fontset-BVSM,"
;  "chinese-gb2312:-outline-YaHei Consolas Hybrid-normal-normal-normal-mono-*-*-*-*-c-*-gb2312.1980-0,"
;  "sjis:-outline-MS Gothic-normal-normal-normal-mono-13-*-*-*-c-*-jisx0208-sjis" ) )
;;(create-fontset-from-fontset-spec
; (concat
;  "-outline-Consolas-normal-normal-normal-mono-18-*-*-*-c-*-fontset-Consolas,"
;  "ascii:-outline-Consolas-normal-r-normal-normal-18-*-*-*-c-*-iso8859-1,"
;  "chinese-gb2312:-outline-YaHei Consolas Hybrid-normal-normal-normal-sans-*-*-*-*-p-*-gb2312*-0,"
;  "chinese-gbk:-outline-YaHei Consolas Hybrid-normal-normal-normal-sans-*-*-*-*-p-*-gb2312*-0,"
;  "sjis:-outline-MS Gothic-normal-normal-normal-mono-13-*-*-*-c-*-jisx0208-sjis" ) )
;(set-default-font "fontset-Consolas")



(provide 'arch-font)


