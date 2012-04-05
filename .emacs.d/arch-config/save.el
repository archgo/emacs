;========================Session�����洢=======================
;; Session�����洢
(arch/plugin:prepend-to-load-path "session")
(require 'session)
(add-hook 'after-init-hook 'session-initialize)


;;��ǩ����
(setq bookmark-save-flag t)
;;t means save bookmarks when Emacs is killed.

;;==========����==========
(desktop-save-mode t)

;========================����ļ�=======================
;; Recent File
;;;;(require 'recentf)
;;;;(recentf-mode 1)
;;;;(defun recentf-open-files-compl ()
;;;;  (interactive)
;;;;  (let* ((all-files recentf-list)
;;;;	 (tocpl (mapcar (function
;;;;   (find-file (cdr (assoc-ignore-representation fname tocpl)))))

;========================�ļ�=====================
(setq make-backup-files nil)
;; �趨�����������ļ�
;;(setq version-control 'never);;����Ҫ�������뻻���ط����汸���ļ�

(setq auto-save-mode nil)
;;�Զ�����ģʽ

(setq-default make-backup-files nil)
;; ��������ʱ�ļ�

;;��������
;; (setq version-control t);;���ð汾���ƣ������Ա��ݶ��
;; (setq kept-old-versions 2);;������ԭʼ�İ汾���Σ�����һ�α༭ǰ���ĵ����͵ڶ��α༭ǰ���ĵ�
;; (setq kept-new-versions 5);;�������µİ汾1�Σ����ͬ��
;; (setq delete-old-versions t);;ɾ������������7�а汾�İ汾
;; (setq backup-directory-alist '(("." . "~/backups")));;���ñ����ļ���·��
;; (setq backup-by-copying t);;�������÷�����ֱ�ӿ���
;; Emacs �У��ı��ļ�ʱ��Ĭ�϶�����������ļ�(�� ~ ��β���ļ�)��������ȫȥ��
;; (������ȡ)��Ҳ�����ƶ����ݵķ�ʽ��������õ��ǣ������е��ļ����ݶ�����һ
;; ���̶��ĵط�("~/backups")������ÿ�������ļ���������ԭʼ�������汾�����µ�
;; 1���汾�����ұ��ݵ�ʱ�򣬱����ļ��Ǹ�����������ԭ����

;========================�ļ�=====================
;; ȫ�ֿ�ݼ�
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;;����home��ָ��buffer��ͷ��end��ָ��buffer��β


(global-set-key (kbd "C-,") 'scroll-left)
;; "C-,"��Ϊ��Ļ��������
(global-set-key (kbd "C-.") 'scroll-right)
;; "C-."��Ϊ��Ļ��������

(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

(global-set-key [f3] 'repeat-complex-command)

(global-set-key [f4] 'other-window)
;; ��ת�� Emacs ����һ��buffer����

(defun du-onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
  (global-set-key [C-f5] 'compile)
  (global-set-key [f5] 'du-onekey-compile)
;;  C-f5, ���ñ�������; f5, ���������ļ�Ȼ����뵱ǰ�����ļ�

(global-set-key [f6] 'gdb)            
;;F6����Ϊ��Emacs�е���gdb

(global-set-key [C-f7] 'previous-error)
(global-set-key [f7] 'next-error)

(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))
(global-set-key [(f8)] 'open-eshell-other-buffer)
(global-set-key [C-f8] 'eshell)
;;Ŀ���ǿ�һ��shell��Сbuffer�����ڸ�����ز��Գ���(Ҳ�������г�����)���Ҿ������õ���
;;f8������һ��bufferȻ���shell��C-f8�����ڵ�ǰ��buffer��shell

(setq speedbar-show-unknown-files t);;������ʾ����Ŀ¼�Լ��ļ�
(setq dframe-update-speed nil);;���Զ�ˢ�£��ֶ� g ˢ��
(setq speedbar-update-flag nil)
(setq speedbar-use-images nil);;��ʹ�� image �ķ�ʽ
(setq speedbar-verbosity-level 0)

;;����Ĵ�ecbҲ��F9
;;(global-set-key [f9] 'speedbar)
;;����f9����speedbar����
;;ʹ�� n �� p ���������ƶ���
;; + չ��Ŀ¼���ļ����������- ������RET ����Ŀ¼���ļ���g ���� speedbar��

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;;�� dired ���Եݹ�Ŀ�����ɾ��Ŀ¼��

(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")
;; ����ʱ�������ʶ�����һ�α����ļ���ʱ�䡣


(provide 'save)
