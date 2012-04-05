;; -*- coding: utf-8 -*-

(arch/plugin:prepend-to-load-path "cedet")
(arch/plugin:prepend-to-load-path "cedet/eieio")
(arch/plugin:prepend-to-load-path "cedet/semantic")
(arch/plugin:prepend-to-load-path "cedet/speedbar")
(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")
;(semantic-load-enable-all-exuberent-ctags-support)
;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)
;
;;; the function can be folded
;(global-semantic-tag-folding-mode 1)
;
;; (global-ede-mode 1)
;; (global-srecode-minor-mode 1) 
;; 
;; (setq senator-minor-mode-name "SN")
;; (setq semantic-imenu-auto-rebuild-directory-indexes nil)
;; (global-semantic-mru-bookmark-mode 1)
;; 
;; (require 'semantic-decorate-include)
;; (require 'semantic-ia)
;; (require 'semantic-gcc)
;;; use need to update the specific path
;(let ((c++-include-path-list (cond
;                              (arch/host:MSWSp
;                               (list "D:/src/zephyr/perf/OTHERS/STDCPP/INCLUDE"
;                                     "D:/src/zephyr/perf/TOOLS/PUBLIC/ext/crt80/inc"
;                                     "D:/src/zephyr/perf/PUBLIC/COMMON/OAK/INC"
;                                     "D:/src/zephyr/perf/PUBLIC/COMMON/SDK/INC"))
;                              (arch/host:HOMEp
;                               (list "D:/Program Files/Microsoft Visual Studio 10.0/VC/include"
;                                     "D:/Program Files/Microsoft Visual Studio 10.0/VC/atlmfc/include"
;                                     "D:/_SRC_/boost/include"))
;                              (t
;                               nil))))
;  (mapc (lambda (x)
;          (semantic-add-system-include x 'c++-mode)
;          (semantic-add-system-include x 'c-mode))
;        c++-include-path-list))
;; 
;; 
;; 
;; (setq-mode-local c-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; (setq-mode-local c++-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; 
;; (require 'eassist)
;; 
;; 
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)
;; (semantic-load-enable-primary-exuberent-ctags-support)
;; 
;; 
;(defun arch/cedet-hook ()
;  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
;  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
;  ;;
;  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
;
;  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
;  (local-set-key "\C-cq" 'semantic-ia-show-doc)
;  (local-set-key "\C-cs" 'semantic-ia-show-summary)
;  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;
;(add-hook 'c-mode-common-hook 'arch/cedet-hook)
;(add-hook 'c++-mode-hook 'arch/cedet-hook)
;(add-hook 'emacs-lisp-mode-hook 'arch/cedet-hook)
;(add-hook 'lisp-mode-hook 'arch/cedet-hook)
;; 
;; 
;(defun arch/c-mode-cedet-hook ()
;  ;(local-set-key "." 'semantic-complete-self-insert)
;  ;(local-set-key ">" 'semantic-complete-self-insert)
;  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
;  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
;  (local-set-key "\C-ce" 'eassist-list-methods)
;  (local-set-key "\C-c\C-r" 'semantic-symref))
;
;(add-hook 'c-mode-common-hook 'arch/c-mode-cedet-hook)
;(add-hook 'c++-mode-hook 'arch/c-mode-cedet-hook)
;
;;; Always use C++ mode for file
;(add-to-list 'auto-mode-alist '("\\.[hc]$" . c++-mode))
;; 
;; 
;; (require 'semantic-lex-spp)
;; (ede-enable-generic-projects)
;
;
;;;Getting information about tags
;
;;;The semantic-ia package implements several commands, that allows to
;;;get information about classes, functions & variables. As
;;;documentation are used comments, extracted from source code,
;;;including comments, written for Doxygen. Now following commands are
;;;implemented:
;
;;;semantic-ia-show-doc
;;;    shows documentation for function or variable, whose names is
;;;    under point. Documentation is shown in separate buffer. For
;;;    variables this command shows their declaration, including type
;;;    of variable, and documentation string, if it available. For
;;;    functions, prototype of the function is shown, including
;;;    documentation for arguments and returning value (if comments are
;;;    available);
;;;semantic-ia-show-summary
;;;    shows documentation for name under point, but information is
;;;    shown in the mini-buffer, so user will see only variable's
;;;    declaration or function's prototype;
;;;semantic-ia-describe-class
;;;    asks user for a name of the class, and return list of functions
;;;    & variables, defined in given class, and all its parent classes.
;
;;semantic-ia-fast-jump
;;semantic-mrub-switch-tag
;
;
;; ============================
;;         ecb mode
;; ============================
(arch/plugin:prepend-to-load-path "ecb-2.40")
(require 'ecb-autoloads)

;;error reports if i do not set this var
;;(setq stack-trace-on-error t) ;;滚至文档首尾时，弹出新窗口，trace，      
;;disable tips, kinda noisy;;;;禁止每日提醒  
(setq ecb-tip-of-the-day nil)
;;use 'image style, i like this than 'ascii-guide
(setq ecb-tree-buffer-style 'image)
;;do not remove record in history when kill-buffer
(setq ecb-kill-buffer-clears-history nil)
;;bucket the history by major-mode
(setq ecb-history-make-buckets 'mode)
;use manually update, c-c . r
;(setq ecb-analyse-buffer-sync nil)
;; start ecb in a new frame
(setq ecb-new-ecb-frame nil)
;; use mouse 1 instead of mouse 2
(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)
;; compile window
;(setq ecb-compile-window-height nil)
;; whether show file in directory-buffer
;(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-show-sources-in-directories-buffer
      (list "left7" "left13" "left14" "left15"))


(defun arch/ecb:smart-switch-layout (layout-name)
  "If the layout name is not current layout, open/swtich to it.
Other close current ecb layout."
  (if (and (boundp 'ecb-minor-mode) ecb-minor-mode)
      (if (string-equal ecb-layout-name layout-name)
          (ecb-deactivate)
        (ecb-layout-switch layout-name))
    (progn
      (setq ecb-layout-name layout-name)
      (ecb-activate))))

(defun arch/ecb:left-method-layout ()
  (interactive)
  (arch/ecb:smart-switch-layout "left9"))
  

(defun arch/ecb:left-directory-layout ()
  (interactive)
  (arch/ecb:smart-switch-layout "left13"))

    
(defun arch/ecb:left-directory-method-layout ()
  "Open left directory window, default to left15 layout"
  (interactive)
  (arch/ecb:smart-switch-layout "left15"))

(global-set-key (kbd "<f11>") 'arch/ecb:left-directory-layout)
(global-set-key (kbd "<f12>") 'arch/ecb:left-method-layout)


;===================== ecb设置 =====================================
;;消除了第一个warning 对文件ecb-method-browser.el做如下修改： 
;; (default-major-mode 'emacs-lisp-mode)
;;    (major-mode 'emacs-lisp-mode)

;;载入cedet(require 'cedet)，或采用第7行的载入方式
;;(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")

;;自动启动ecb
;;(setq ecb-auto-activate t
;;      ecb-tip-of-the-day nil)
;;;; maximum specify window
(global-set-key [f9] 'ecb-toggle-ecb-windows)
;;;; recover window layout

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Ecb的操作:
;; C-c . g d 目录列表窗口
;; C-c . g s 源码窗口
;; C-c . g m 方法和变量窗口
;; C-c . g h 历史窗口
;; C-c . g l 最后选择过的编辑窗口
;; C-c . g 1 编辑窗口1
;; C-c . g n 编辑窗口n
;; C-c . l c 选择版面
;; C-c . l r 重画版面
;; C-c . l t 拴牢版面(锁定版面)
;; C-c . l w 拴牢可见的ecb窗口
;; C-c . \   拴牢编绎窗口

;; 其中l为小写字母(L),大家别看错!!


(provide 'arch-cedet)














