;; -*- coding: utf-8 -*-

;; org-mode setting

; always use english times format
(setq system-time-locale "C")

; add new path at the begining
(setq load-path (cons "~/.emacs.d/plugins/org-7.7/lisp/" load-path) )
; we also turn on contrib : htmlize.el
(setq load-path (cons "~/.emacs.d/plugins/org-7.7/contrib/lisp/" load-path) )


(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
;(setq org-agenda-files
;      (list
;       "E:/My Dropbox/Material/Org/gomez.org") )

(setq org-insert-mode-line-in-empty-file t)
(setq org-hierarchical-todo-statistics t)


;; work flow for the gomez
(setq org-todo-keyword-faces
      '(
        ;; bug workflow
        ("OPEN" . (:foreground "PeachPuff" ) )
        ("REOPEN" . (:foreground "PeachPuff" ) )
        ("STEPPING" . (:foreground "LawnGreen") )
        ("BLOCK" .  (:foreground "IndianRed" ) )
        ("PENDING" . (:foreground "DarkGreen"))
        ("MOVE" . (:foreground "DeepSkyBlue" :weight bold))
        ("FIXED" . (:foreground "DeepSkyBlue" :weight bold))
        ("DUPLICATE" . (:foreground "DeepSkyBlue" :weight bold))
        ("WAD" .  (:foreground "DeepSkyBlue" :weight bold) )
        ("IRREPRODUCIBLE" .  (:foreground "DeepSkyBlue" :weight bold) )
        ;; type workflow
        ("Paul"   (:foreground "DarkSlateGray" ) )
        ("Hunter"   (:foreground "DarkSlateGray" ) )
        ("Drizzt"   (:foreground "DarkSlateGray" ) )
        ("Sean"   (:foreground "DarkSlateGray" ) )
        ("Kirill"   (:foreground "DarkSlateGray" ) )
        ;; todo workflow
        ("TODO" . (:foreground "PeachPuff") )
        ("DONE" . (:foreground "DeepSkyBlue" :weight bold) )
        )) 

;; setting for the inline source code.
;(setq org-src-lang-modes
;      (append org-src-lang-modes
;              '( ("latex" . latex-mode)
;                 ("powershell" . powershell-mode))))
(setq org-src-preserve-indentation t)
(setq org-src-ask-before-returning-to-edit-buffer nil)
(setq org-src-fontify-natively t)

;; startup settings i like
(setq org-startup-folded 'content)
(setq org-startup-indented t)
; (setq org-startup-align-all-tables t)
(setq org-startup-with-inline-images t)
(setq org-hide-leading-stars t)


;; export settings
;;;; prevent the _ to become a sub title
(setq org-export-with-sub-superscripts nil)

(provide 'arch-org)
