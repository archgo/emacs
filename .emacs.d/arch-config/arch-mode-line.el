;; -*- coding: utf-8 -*-

(eval-when-compile
  (require 'cl))

(defun arch/mode-line:current-height ()
  "Return the mode line height of the current window.
NOTE: this function should be used after you apply any font settings.
Otherwise, the return value may not be the corrent value for current fontset."
  (- (elt (window-pixel-edges) 3)
     (elt (window-inside-pixel-edges) 3)))

(defun arch/defun-bicolor-face (face fg-color bg-color)
    (make-face face)
    (set-face-attribute face nil
                        :foreground fg-color
                        :background bg-color))

(defun arch/defun-bicolor-transition-face (face bicolor-face-from bicolor-face-to)
  (arch/defun-bicolor-face face
                           (face-attribute bicolor-face-from :background)
                           (face-attribute bicolor-face-to :background)))
  
    

(defun arch/bicolor-face-attribute (face)
  (list
   (face-attribute face :foreground)
   (face-attribute face :background)))

(defun arch/mode-line:data-generator-left-triangle (height width)
  "Generator for the data section of the XPM format image.
This function is used to generate the left triangle XPM image.
It return a list of string, each string stands for one line of data.
"
  (let* ((min-triagle-width (+ (/ height 2) (% height 2)))
         (final-width (max min-triagle-width width))
         (make-line #'(lambda (offset)
                        (format "%s%s"
                                (make-string offset ?.)
                                (make-string (- final-width offset) ? ))))
         (top-part
          (loop for offset from 1 to (/ height 2)
                collect (funcall make-line offset))))
    (append top-part
            (if (equal (% height 2) 1)
                (list (funcall make-line min-triagle-width)))
            (reverse top-part))))

(defun arch/mode-line:data-generator-eight-trigrams (height width)
  (list "..............      "
        "............        "
        ".........           "
        ".......             "
        "......              "
        "......    .         "
        "......   ...        "
        "......    .         "
        ".......             "
        "........            "
        "..........          "
        "............        "
        ".............       "
        "..............      "
        ".......... ...      "
        ".........   ..      "
        ".......... ...      "
        ".............       "
        "............        "
        "...........         "
        ".........           "
        ".......             "))

(defun arch/create-bicolor-xpm (height width fg-color bg-color data-generator)
  "Create the xpm image for showing based on the width and height.
The actual result will based on the return value of data-generator,
which shows the real width and height of the final data.

The input DATA-GENERATOR is a funciton object, will be called as:
\(DATA-GENERATOR height width\)

It should return a list of string, each string stands for one line in
<Pixels> part of XPM, of course, each string should be the same length.

The data is the <Pixels> part of a XPM format image.  You can refer
here : http://en.wikipedia.org/wiki/X_PixMap. The width and height
gives the real image created by this generator, which will filled
into <Values> part of the XPM.

All the data must only contains dot(.) and Space( ), so that the dot
will be filled with FG-COLOR and Space will be filled with BG-COLOR."
  (let ((base-xpm-format "/* XPM */
static char * XPM_IMAGE[] = {
/* <Values> */
/* <width/cols> <height/rows> <colors> <char on pixel>*/
\"%d %d 2 1\",
/* <Colors> */
\". c %s\",
\"  c %s\",
/* <Pixels> */
%s}\;")
        (generated-data (funcall data-generator height width)))
    (create-image (format base-xpm-format
                          (length (car generated-data))
                          (length generated-data)
                          fg-color
                          bg-color
                          (mapconcat #'(lambda (x)
                                         (concat "\"" x "\""))
                                     generated-data
                                     ",\n"))
                  'xpm t :ascent 'center)))



(defun arch/create-bicolor-xpm-from-face (height width bicolor-face data-generator)
  (apply #'arch/create-bicolor-xpm
         (append 
          (list height width)
          (arch/bicolor-face-attribute bicolor-face)
          (list data-generator))))


(defun arch/mode-line:create-left-triangle-xpm (bicolor-face &optional width)
  "This function will create the left triangle XPM based on the
current height of the mode line, with FG-COLOR to be triangle color,
and BG-COLOR to be the background color"
  (let* ((height (arch/mode-line:current-height))
         (width (or width height)))
    (arch/create-bicolor-xpm-from-face height
                                       width
                                       bicolor-face
                                       #'arch/mode-line:data-generator-left-triangle)))

(defun arch/mode-line:create-eight-trigrams-xpm (bicolor-face)
  (let ((height (arch/mode-line:current-height)))
    (arch/create-bicolor-xpm-from-face height
                                       height
                                       bicolor-face
                                       #'arch/mode-line:data-generator-eight-trigrams)))


(defun arch/mode-line:decorate-string-face (mode-line-var bicolor-face)
  (let ((decorate-into (lambda (var)
                         (cond
                          ((stringp var)
                           ;; it should be better to add "%" check
                           ;; actually I need more better way to know which kind of
                           ;; string need to be decorated.
                           (if (string-match-p "%" var)
                               (propertize var 'face bicolor-face)
                             var))
                          ((listp var)
                           ;(if (and (integerp (car var))
                           ;         (listp (cdr var))
                           ;         (stringp (cadr var)))
                           ;    (cons (length (replace-regexp-in-string "%\\d*\\w+" " " (cadr var)))
                           ;            (mapcar decorate-into (cdr var)))
                           ; if it is a list not a cons
                           (if (listp (cdr var))
                               (mapcar decorate-into var)
                             (cons (funcall decorate-into (car var))
                                   (funcall decorate-into (cdr var)))))
                          (t
                           var)))))
    (funcall decorate-into mode-line-var)))



(arch/defun-bicolor-face 'mode-line-face/encoding-writable-modified "#000000" "#999999")
(arch/defun-bicolor-face 'mode-line-face/buffer-name "#FFFFFF" "#555555")
(arch/defun-bicolor-transition-face 'mode-line-face/transition1
                                    'mode-line-face/encoding-writable-modified
                                    'mode-line-face/buffer-name)
(arch/defun-bicolor-transition-face 'mode-line-face/transition2
                                    'mode-line-face/buffer-name
                                    'mode-line)

(defun arch/mode-line:create-triangle-seperator (face)
  (propertize " "
              'display
              (arch/mode-line:create-left-triangle-xpm face)))

(defun arch/mode-line:create-eight-trigrams-seperator (face)
  (propertize " "
              'display
              (arch/mode-line:create-eight-trigrams-xpm face)))

(setq-default mode-line-format
              (list
               '(:eval (propertize (concat "%e"
                                           "-"
                                           ;mode-line-mule-info, use more readable format
                                           (format "%s" buffer-file-coding-system)
                                           ":")
                                   'face 'mode-line-face/encoding-writable-modified))
               (arch/mode-line:decorate-string-face mode-line-modified
                                                    'mode-line-face/encoding-writable-modified)
               (arch/mode-line:create-eight-trigrams-seperator 'mode-line-face/transition1)
               ;mode-line-remote, remove
               ;mode-line-frame-identification, remove
               (arch/mode-line:decorate-string-face mode-line-buffer-identification
                                                    'mode-line-face/buffer-name)
               (arch/mode-line:create-triangle-seperator 'mode-line-face/transition2)
               mode-line-position
               '(vc-mode vc-mode)
               mode-line-modes
               ;("" viper-mode-string)    ;global-mode-string contains it
               global-mode-string
               ;("[" default-directory "]")
               "-%-" ))

;; normal one without decoration
;(setq-default mode-line-format
;      '( "%e"
;         "-"
;         ("[" (:eval (format "%s" buffer-file-coding-system)) ":")   ;mode-line-mule-info, use more readable format
;         ;mode-line-client, remove
;         ("" mode-line-modified "]") ; change format to be together with encoding
;         ;mode-line-remote, remove
;         ;mode-line-frame-identification, remove
;         "["
;         mode-line-buffer-identification
;         "]"
;         mode-line-position
;         (vc-mode vc-mode)
;         mode-line-modes
;         ;("" viper-mode-string)    ;global-mode-string contains it
;         global-mode-string
;         ;("[" default-directory "]")
;         "-%-" ) )

;(insert (arch/mode-line:create-triangle-seperator 'mode-line-face/transition1))
;(arch/create-bicolor-xpm 20 10 "#0A0A0A" "#A0A0A0" #'arch/mode-line:data-generator-left-triangle)
;(arch/create-bicolor-xpm-from-face 20 10 'mode-line-face/transition1
;                                   'arch/mode-line:data-generator-left-triangle)

(provide 'arch-mode-line)

