;===================== ���ܲ�ȫ ===========================

;;�﷨��ȫ
;;(arch/plugin:prepend-to-load-path "cedet")
;;(require 'yasnippet-bundle)


;===================== ���ȫ =======================
;�����������Զ���ȫ
(arch/plugin:prepend-to-load-path "smex-1.1.2")
(require 'smex)

(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

;===================== �ļ�ͷheader���� ===========================
;;�����Ǳ����ļ���ʱ��,�кܶ���Ϣ�����Զ�����.����Զ�������Ϣ, ������Щ��Ϣ,
;Ҳ�ǿ�����ȫ�Լ�����. �����ļ�����,���һ���޸�ʱ��,�ļ��������,���һ���޸ĵ����ߵȵ�.
;;������ M-x make-header �Զ������ļ�ͷ��Ϣ.
;;(add-to-list 'load-path  "~/lisp")
;;(require 'header)
(setq make-header-hooks '(header-mode-line
                            header-blank
                            header-file-name
                            header-blank
                            header-copyright
                            header-blank
                            header-author
                            header-creation-date
                            header-modification-author
                            header-modification-date
                            header-update-count
                            header-blank
                            header-history
                            header-blank
                            ))
(setq header-copyright-notice "  Դ�ɹ����� ��Ʒ" )
(make-local-variable 'user-full-name)
(make-local-variable 'user-mail-address)
;; Update file headers when write files.
;(add-hook 'write-file-hooks 'update-file-header)
;; Create headers for file buffers in my favorite modes.
;(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
;(add-hook 'c-mode-common-hook   'auto-make-header)

;===================== �ļ�ͷheader���ý��� ==========================


;========================    �۵�     ================================
;;�۵�
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;�ܰ�һ�����������������Ҫ��ʱ����չ��
;;  M-x              hs-minor-mode
;;  C-c @ ESC C-s    show all
;;  C-c @ ESC C-h    hide all
;;  C-c @ C-s        show block
;;  C-c @ C-h        hide block
;;  C-c @ C-c toggle hide/show

;;; hide-show  �����۵������ã��������﷨����
;;;(setq hs-allow-nesting t)  
;;;(add-hook 'c-mode-common-hook  
;;;          (lambda ()  
;;;            (hs-minor-mode 1)  
;;;            ))  
;;;(add-hook 'emacs-lisp-mode-hook  
;;;          (lambda()  
;;;            (hs-minor-mode 1)))  
;;;(add-hook 'tcl-mode-hook (lambda ()  
;;;                           (hs-minor-mode 1)  
;;;                          ))
;;;(define-key hs-minor-mode-map [?/C-/ ?H] 'hs-hide-all)  
;;;(define-key hs-minor-mode-map [?/C-/ ?S] 'hs-show-all)  
;;;(define-key hs-minor-mode-map [?/C-/ ?h] 'hs-hide-block)  
;;;(define-key hs-minor-mode-map [?/C-/ ?s] 'hs-show-block)  
;;;(define-key hs-minor-mode-map [?/C-/ ?l] 'hs-hide-level)  
;;;(define-key hs-minor-mode-map [?/C-/ ?t] 'hs-toggle-hiding) 

;========================================================================
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ " )")
    (?\[ ?  _ " ]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;������ߵ����ţ��ͻ��Զ���ȫ�ұߵĲ���.����(), "", [] , {} , �ȵȡ�

(provide 'omni-hideshow)
