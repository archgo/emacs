;;================================ 编译==============================================

;;===================================  
;;设置编译器==========================  
;;===================================  
;;(setq compile-command (concat "D:/DEV-CPP/bin/g++ -g " "/"" buffer-file-name "/""))   
(global-set-key (kbd "<f7>") 'smart-compile)  
(defun smart-compile()  
  
;;  "比较智能的C/C++编译命令  
;;如果当前目录有makefile则用make -k编译，否则，如果是  
;;处于c-mode，就用gcc -Wall编译，如果是c++-mode就用 g++ -Wall编译"  
  (interactive)  
  ;; 查找 Makefile  
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))  
        (command nil))  
    (if (not (null  
              (find t candidate-make-file-name :key  
                    '(lambda (f) (file-readable-p f)))))  
        (setq command "make -k ")  
        ;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式  
        (if (null (buffer-file-name (current-buffer)))  
            (message "Buffer not attached to a file, won't compile!")  
            (if (eq major-mode 'c-mode)  
                (setq command  
                      (concat "D:/DEV-CPP/bin/gcc.exe -Wall -o "      ;;你要明确知道自己的编译器在哪里,  
                              (file-name-sans-extension               ;;这样,用你的gcc.exe的地址代替这里的			 						;;D:/Dev-Cpp/bin/gcc.exe      
                         (file-name-nondirectory buffer-file-name)) ;;注意,这里的路径的斜杠 和vista的习惯相反,你要注意修改  
                              " "  
                              (file-name-nondirectory buffer-file-name)  
                              " -g -lm "))  
              (if (eq major-mode 'c++-mode)  
                  (setq command  
                        (concat "D:/DEV-CPP/bin/g++.exe -Wall -o " ;;还有这里的g++,也同gcc一样...  
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