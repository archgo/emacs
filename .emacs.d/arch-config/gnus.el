;=====================    GNUS设置  =================================
(add-to-list 'load-path "~/lisp/gnus")
(require 'gnus)

(setq gnus-select-method '(nntp "news.yaako.com"))
(setq gnus-default-subscribed-newsgroups
  '( "cn.comp.os.linux")) ;;

;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.yourSecondProvider.net"))
;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.yourThirdProvider.net"))
;;想让 Gnus 在多个的服务器上取新闻


;;中文相关
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
       '((pop :server "pop3.163.com" ;; 在这里设置pop3服务器
       :user "XXXXXXX" ;; 用户名
;;       :port "110"
       :password "XXXXXX"))) ;; 密码
(setq gnus-secondary-select-methods '((nnfolder "")))



(setq user-full-name "XXXXXXXX") ;; 外发的邮件采用这个名字
(setq user-mail-address "XXXXXX@163.com") ;;外发的邮件采用这个地址
(setq smtpmail-auth-credentials
      '(("smtp.163.com" ;; SMTP服务器
      25
      "XXXXXX" ;; 用户名
      "XXXXXX"))) ;; 密码
(setq smtpmail-default-smtp-server "smtp.163.com")
(setq smtpmail-smtp-server "smtp.163.com")
(setq message-send-mail-function 'smtpmail-send-it)

(setq nnmail-expiry-wait 3);;Gnus 默认的保质期是7天，如果你觉得时间不合适，可以自己设置

(add-hook 'gnus-article-prepare-hook
          (lambda ()
            (setq fill-column 60)
            (gnus-article-fill-long-lines)))
;;让gnus把这种邮件排版整齐后再显示给我们看

(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)
;;将邮件的发出时间转换为本地时间

(gnus-add-configuration '(article
                          (vertical 1.0
                                    (summary .4 point)
                                    (article 1.0))))
;; 改变阅读新闻时窗口的布局，窗口划分为上4下6（比例）

(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))
;另外，有些用web方式发出的邮件里有html，加入下面的设置，只看其中的
;plain text部分：

(setq gnus-thread-sort-functions
      '(
        (not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)
        ))
;;排序

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; 有时订阅了很多新闻组，堆在一起不好管理。这个功能可以创建目录来分层管理

(setq gnus-read-newsrc-file nil  gnus-save-newsrc-file nil)

;========================   GNUS设置结束  ===============================

(provide 'gnus)