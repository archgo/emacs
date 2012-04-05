;;================================ ����==============================================

;;===================================  
;;���ñ�����==========================  
;;===================================  
;;(setq compile-command (concat "D:/DEV-CPP/bin/g++ -g " "/"" buffer-file-name "/""))   
(global-set-key (kbd "<f7>") 'smart-compile)  
(defun smart-compile()  
  
;;  "�Ƚ����ܵ�C/C++��������  
;;�����ǰĿ¼��makefile����make -k���룬���������  
;;����c-mode������gcc -Wall���룬�����c++-mode���� g++ -Wall����"  
  (interactive)  
  ;; ���� Makefile  
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))  
        (command nil))  
    (if (not (null  
              (find t candidate-make-file-name :key  
                    '(lambda (f) (file-readable-p f)))))  
        (setq command "make -k ")  
        ;; û���ҵ� Makefile ���鿴��ǰ mode �Ƿ�����֪�Ŀɱ����ģʽ  
        (if (null (buffer-file-name (current-buffer)))  
            (message "Buffer not attached to a file, won't compile!")  
            (if (eq major-mode 'c-mode)  
                (setq command  
                      (concat "D:/DEV-CPP/bin/gcc.exe -Wall -o "      ;;��Ҫ��ȷ֪���Լ��ı�����������,  
                              (file-name-sans-extension               ;;����,�����gcc.exe�ĵ�ַ���������			 						;;D:/Dev-Cpp/bin/gcc.exe      
                         (file-name-nondirectory buffer-file-name)) ;;ע��,�����·����б�� ��vista��ϰ���෴,��Ҫע���޸�  
                              " "  
                              (file-name-nondirectory buffer-file-name)  
                              " -g -lm "))  
              (if (eq major-mode 'c++-mode)  
                  (setq command  
                        (concat "D:/DEV-CPP/bin/g++.exe -Wall -o " ;;���������g++,Ҳͬgccһ��...  
                                (file-name-sans-extension  
                                 (file-name-nondirectory buffer-file-name))  
                                " "  
                                (file-name-nondirectory buffer-file-name)  
                                " -g -lm "))  
                (message "Unknow mode, won't compile!")))))  
    (if (not (null command))  
        (let ((command (read-from-minibuffer "Compile command: " command)))  
          (compile command)))))  

(provide 'arch-compile)