;; -*- coding: utf-8 -*-

;; set user information
(setq user-full-name "winterTTr")
(setq user-mail-address "winterTTr@gmail.com")

;====================================
;  UI
;====================================
;; close startup message
(setq inhibit-startup-message t)

;; transprent window
; (set-frame-parameter (selected-frame) 'alpha (list 70 70))
; (add-to-list 'default-frame-alist (cons 'alpha (list 90 85)))


;; turn on syntax hilight
(global-font-lock-mode t)

;; close toolbar and menu bar
;;;(tool-bar-mode nil)
;(menu-bar-mode 0)
;; remove scroll bar
;;;(set-scroll-bar-mode nil)

;; show clock at statusline, now i close the clock
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; show column number in mode line
(setq column-number-mode t)

;; show parent
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; hilight mark area
(transient-mark-mode t)

;; make the title infomation more useful
(setq frame-title-format
      (list "GNU Emacs " emacs-version "@" system-name " - " '(buffer-file-name "%f" "%b")))

; (run-with-idle-timer 0.2 nil 'w32-maximize-frame)
(when arch/os:win32p
  (add-to-list 'emacs-startup-hook #'arch/w32-maximize-frame))

;===================================
; Control
;===================================
;; don't ring at error
(setq ring-bell-function 'ignore)

;; can use the narrow to region
(put 'narrow-to-region 'disabled nil)

;; use mouse to copy thing automatically
(setq mouse-drag-copy-region t)


;; move mouse when cursor is close to it
;(mouse-avoidance-mode 'animate)
(mouse-avoidance-mode 'none)


;; use y --> yes
(fset 'yes-or-no-p 'y-or-n-p)

;; setup for newline auto-appending support
(setq next-line-add-newline t)

;; encoding
(set-language-environment 'UTF-8)
(setq file-name-coding-system 'gb2312)

;; setup up a big kill-ring, so i will never miss anything:-)
(setq kill-ring-max 100)

;; set default mode to text-mode
(setq-default major-mode 'text-mode)

;; set startup scrach buffer to another mode
; (setq initial-major-mode 'text-mode)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3)))   ;; one line at a time
(setq mouse-wheel-progressive-speed nil)              ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                    ;; scroll window under mouse
(setq scroll-step 1)                                  ;; keyboard scroll one line at a time
(setq scroll-margin 0)                                ;; stop autoscroll when mouse is close to margin

;; not use tab, use space to indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; auto-load mode
(global-auto-revert-mode 1)

;; always split window vertically
(setq split-width-threshold nil)

;; add extra binary path
;; it seems the "find" in "unix-utils-bin" works better and the
;; on in the "etc", so we put "ect" after "unix-utils-bin"
(when arch/os:win32p
  (mapc #'arch/prepend-to-exec-path
        (reverse 
         '("~/bin"
           "~/.emacs.d/extra-bin/gnuwin32"
           "~/.emacs.d/extra-bin/unix-utils-bin"
           ))))

;; time stamp support
;(setq time-stamp-active t)
;(setq time-stamp-warn-inactive t)
;(add-hook 'write-file-hooks 'time-stamp)
;(setq time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S winterTTr")

;; http://trey-jackson.blogspot.com/2010/04/emacs-tip-36-abort-minibuffer-when.html
;; very useful when you use mouse meanwhile, close minibuffer when lose focus
(defun arch/kill-minibuffer-when-lost-focus ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'arch/kill-minibuffer-when-lost-focus)

(provide 'arch-basic)
