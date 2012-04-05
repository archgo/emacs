;; -*- coding: utf-8 -*-

;; we need to add the ccl binary path
(when arch/os:win32p
  (arch/prepend-to-exec-path "~/../ccl-1.7-windows")
  (setq inferior-lisp-program
        (if (getenv "PROGRAMW6432") "wx86cl64.exe" "wx86cl.exe"))
  (arch/plugin:prepend-to-load-path "quicklisp" "~/../ccl-quicklisp")
  (autoload 'slime "slime-helper" nil t))

;; we use emacs to slime repl
(when (boundp 'evil-emacs-state-modes)
  (add-to-list 'evil-emacs-state-modes 'slime-repl-mode))


(provide 'arch-slime)
