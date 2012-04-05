;; -*- coding: utf-8 -*-


(arch/plugin:prepend-to-load-path "auctex-11.86-e23.3-msw/site-lisp")
(load "site-start.el" nil t t)
(require 'tex-mik)

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'LaTex-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

(setq preview-image-type 'pnm)
(setq preview-scale-function 1.5)
(require 'preview)

;===================== AUCTeX设置 =================================
;;;一个是编辑，一个是预览
;;;(load "~/lisp/auctex/site-lisp/auctex.el" nil t t)
;;;(load "~/lisp/auctex/site-lisp/preview-latex.el" nil t t)
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)
;;(add-hook 'LaTeX-mode-hook #'LaTeX-install-toolbar)
;;(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(provide 'arch-auctex)
