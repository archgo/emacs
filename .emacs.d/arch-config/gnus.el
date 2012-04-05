;=====================    GNUS����  =================================
(add-to-list 'load-path "~/lisp/gnus")
(require 'gnus)

(setq gnus-select-method '(nntp "news.yaako.com"))
(setq gnus-default-subscribed-newsgroups
  '( "cn.comp.os.linux")) ;;

;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.yourSecondProvider.net"))
;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.yourThirdProvider.net"))
;;���� Gnus �ڶ���ķ�������ȡ����


;;�������
(set-language-environment 'Chinese-GB)
(setq gnus-default-charset 'chinese-iso-8bit
   gnus-group-name-charset-group-alist '((".*" . chinese-iso-8bit))
   gnus-summary-show-article-charset-alist
       '((1 . chinese-iso-8bit)
         (2 . gbk)
         (3 . big5)
         (4 . utf-8))
   gnus-newsgroup-ignored-charsets
       '(unknown-8bit x-unknown iso-8859-1))


(setq mail-sources
       '((pop :server "pop3.163.com" ;; ����������pop3������
       :user "XXXXXXX" ;; �û���
;;       :port "110"
       :password "XXXXXX"))) ;; ����
(setq gnus-secondary-select-methods '((nnfolder "")))



(setq user-full-name "XXXXXXXX") ;; �ⷢ���ʼ������������
(setq user-mail-address "XXXXXX@163.com") ;;�ⷢ���ʼ����������ַ
(setq smtpmail-auth-credentials
      '(("smtp.163.com" ;; SMTP������
      25
      "XXXXXX" ;; �û���
      "XXXXXX"))) ;; ����
(setq smtpmail-default-smtp-server "smtp.163.com")
(setq smtpmail-smtp-server "smtp.163.com")
(setq message-send-mail-function 'smtpmail-send-it)

(setq nnmail-expiry-wait 3);;Gnus Ĭ�ϵı�������7�죬��������ʱ�䲻���ʣ������Լ�����

(add-hook 'gnus-article-prepare-hook
          (lambda ()
            (setq fill-column 60)
            (gnus-article-fill-long-lines)))
;;��gnus�������ʼ��Ű����������ʾ�����ǿ�

(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)
;;���ʼ��ķ���ʱ��ת��Ϊ����ʱ��

(gnus-add-configuration '(article
                          (vertical 1.0
                                    (summary .4 point)
                                    (article 1.0))))
;; �ı��Ķ�����ʱ���ڵĲ��֣����ڻ���Ϊ��4��6��������

(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))
;���⣬��Щ��web��ʽ�������ʼ�����html��������������ã�ֻ�����е�
;plain text���֣�

(setq gnus-thread-sort-functions
      '(
        (not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)
        ))
;;����

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; ��ʱ�����˺ܶ������飬����һ�𲻺ù���������ܿ��Դ���Ŀ¼���ֲ����

(setq gnus-read-newsrc-file nil  gnus-save-newsrc-file nil)

;========================   GNUS���ý���  ===============================

(provide 'gnus)