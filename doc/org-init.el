(setq make-backup-files nil)
(setq auto-save-default nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LaTeX Settings

;; Emacs/Org mode - TeX Wiki
;; - https://texwiki.texjp.org/?Emacs%2FOrg%20mode#h20d131a

(require 'ox-latex)

(setq
 org-latex-pdf-process
 `(,(concat
     "latexmk -e '$latex=q/uplatex -shell-escape %S/' "
     "-e '$bibtex=q/upbibtex %B/' "
     "-e '$biber=q/biber --bblencoding=utf8 -u -U --output_safechars %B/' "
     "-e '$makeindex=q/upmendex -o %D %S/' "
     "-e '$dvipdf=q/dvipdfmx -o %D %S/' "
     "-norc -gg -pdfdvi %f")))

;; (setq
;;  org-latex-pdf-process
;;  `(,(concat
;;      "latexmk -e '$pdflatex=q/xelatex -shell-escape %S/' "
;;      "-e '$bibtex=q/upbibtex %B/' "
;;      "-e '$biber=q/biber --bblencoding=utf8 -u -U --output_safechars %B/' "
;;      "-e '$makeindex=q/upmendex -o %D %S/' "
;;      "-norc -gg -pdf %f")))

(add-to-list 'org-latex-classes
             '("handout"
               "\\ifdefined\\kanjiskip
  \\documentclass[uplatex,ja=standard,jbase=11Q,a4paper,twocolumn,dvipdfmx]{bxjsarticle}
\\else
  \\documentclass[xelatex,ja=standard,jbase=11Q,a4paper,twocolumn]{bxjsarticle}
\\fi
[DEFAULT-PACKAGES]
\\hypersetup{colorlinks=true}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Beamer Settings

(require 'ox-beamer)

;; Outlineのタイトルを目次にします
(setq org-beamer-outline-frame-title "目次")

;; Beamer用クラスの設定（3階層用）
(add-to-list 'org-latex-classes
	     '("slide"
	       "\\ifdefined\\kanjiskip
  \\documentclass[uplatex,14pt,presentation,t,dvipdfmx]{beamer}
  \\usepackage{pxjahyper}
\\else
  \\documentclass[xelatex,14pt,presentation,t]{beamer}
  \\XeTeXgenerateactualtext=1
  \\usepackage{zxjatype}
  \\setjamainfont{IPAexMincho}
  \\setjasansfont{IPAexGothic}
  \\setjamonofont{IPAexGothic}
\\fi
[DEFAULT-PACKAGES]
\\hypersetup{colorlinks=true}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

  ;; Beamer用クラスの設定（4階層用）
  (add-to-list 'org-latex-classes
               '("beamer-part"
	       "\\ifdefined\\kanjiskip
  \\documentclass[uplatex,14pt,presentation,t,dvipdfmx]{beamer}
  \\usepackage{pxjahyper}
\\else
  \\documentclass[xelatex,14pt,presentation,t]{beamer}
  \\XeTeXgenerateactualtext=1
  \\usepackage{zxjatype}
  \\setjamainfont{IPAexMincho}
  \\setjasansfont{IPAexGothic}
  \\setjamonofont{IPAexGothic}
\\fi
[DEFAULT-PACKAGES]
\\hypersetup{colorlinks=true}"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LaTeX Packages

;; Times を TeX 用に配置し直した TX フォント
(add-to-list 'org-latex-packages-alist '("" "txfonts") t)

;; ソースコードの整形にmintedを利用
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted") t)
(setq org-latex-minted-options
      '(("frame" "single") ("linenos" "true") ("numbersep" "3pt")
	("fontfamily" "courier") ("breaklines" "true")))
