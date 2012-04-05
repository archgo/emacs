;; -*- coding: utf-8 -*-

(global-set-key [(meta ?/)] 'hippie-expand)
(global-set-key (kbd "<f4>") 'arch/kill-buffer-may-have-clients)

;; change C-m and enter
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline )

;; some useful key binding
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)

;; quick open internal shell
(defun kid-switch-to-shell ()
  (interactive)
  (when (null (cdr (window-list)))
    (split-window-vertically))
  (let ((file buffer-file-name))
    (other-window 1)
    (shell)
    (when file
      (end-of-buffer)
      (when (looking-back shell-prompt-pattern)
        (insert "cd " (file-name-directory file))
        (call-interactively 'comint-send-input)))))
(global-set-key (kbd "<C-S-f6>") 'kid-switch-to-shell)

;; open file in current buffer from outer explorer
(defun w32-open-current-file-in-explorer ()
  "open the current buffer file in windows explorer"
  (interactive)
  (let ((file buffer-file-name))
    (when file
      (w32-shell-execute
       nil
       "explorer.exe"
       (concat "/e,/select," (replace-in-string file "/" "\\\\") )))))
(global-set-key (kbd "<C-f5>") 'w32-open-current-file-in-explorer)

; open external shell from current file directory
(defun w32-open-shell-from-current-file-directory ()
  "open cmd from current file directory"
  (interactive)
  (let ((file buffer-file-name))
    (when (and file (file-name-directory file))
      (w32-shell-execute
       nil
       "cmd.exe"
       (concat "/k cd /d" (file-name-directory file))))))
(global-set-key (kbd "<C-f6>") 'w32-open-shell-from-current-file-directory)


;=============================��������==================================
;;(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper)

(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'hyper)


;; editing
(global-set-key (kbd "H-c") 'kill-ring-save) ;; copy
(global-set-key (kbd "H-x") 'kill-region) ;; cut
(global-set-key (kbd "H-v") 'yank) ;; paste

(global-set-key (kbd "H-a") 'mark-whole-buffer) ;; select all

(if (load "undo-trees" t)
   (progn
      (global-set-key (kbd "H-z") 'undo-tree-undo)
      (global-set-key (kbd "H-S-z") 'undo-tree-redo)
      (global-set-key (kbd "H-y") 'undo-tree-redo))
   (progn
      (global-set-key (kbd "H-z") 'undo)
      (if (load "redo" t)
         (progn
            (global-set-key (kbd "H-S-z") 'redo)
            (global-set-key (kbd "H-y") 'redo)))))


;; files
;;(global-set-key (kbd "H-n") 'create-empty-buffer) ;;FIXME
(global-set-key (kbd "H-o") 'menu-find-file-existing)
(global-set-key (kbd "H-s") 'save-buffer)
(global-set-key (kbd "H-S-s") 'write-file)

;; search
(global-set-key (kbd "H-f") 'isearch-forward)
(global-set-key (kbd "H-h") 'query-replace)
(global-set-key [H-f3] 'nonincremental-repeat-search-forward)
(global-set-key [C-H-f3] 'nonincremental-repeat-search-backward)

;; bookmarks (within buffer)
(if (featurep 'bm)
    (progn
       (global-set-key [H-f2] 'bm-next)
       (global-set-key [C-H-f2] 'bm-toggle)
       (global-set-key [S-H-f2] 'bm-previous)))

;; completion (Emacs default: M-TAB - lisp-complete-symbol, M-/ - dabbrev-expand)
(global-set-key (kbd "H-/") 'hippie-expand)

;;============================����pre��=================================================
;; Ĭ�ϵ� Ctrl-z ����С�� Emacs�����Ѿ����� F12 ����
;; �Ҿͽ� Ctrl-z ��Ϊ�ҵļ��İ�
;(define-prefix-command 'ctl-z-map)
;(global-set-key (kbd "C-z") 'ctl-z-map)
;; ���뵱ǰemacs-lispԴ��Ϊelc
;(global-set-key (kbd "C-z b") 'emacs-lisp-byte-compile)
;; Debug
;(global-set-key (kbd "C-z j") 'jdb)
;; �鿴ǰ��ɾ�������ݼ�¼
;(global-set-key (kbd "C-z k") 'browse-kill-ring)
;; �����ҵ�maxima��Ư��ģʽ
;(global-set-key (kbd "C-z m") 'imaxima)
;; ������ Emacs �༭�ļ�ʹ�� Vim ϰ��
;(global-set-key (kbd "C-z v") 'vi-mode)
;; ͬ C-z b �е㲻ͬ���ڱ���󲢼���
;(global-set-key (kbd "C-z x") 'emacs-lisp-byte-compile-and-load)

;=======================�������ü�================================
(global-set-key [C-f9] 'dired)
;;����[C-f9]Ϊ����dired����

(global-set-key [f10] 'undo)
;;����F10Ϊ����

(global-set-key [f11] 'calendar)
;;����F11��ݼ�ָ��Emacs ������ϵͳ

(global-set-key [f12] 'list-bookmarks)
;;����F12 ���ٲ쿴�ճ̰���



(provide 'arch-key)
