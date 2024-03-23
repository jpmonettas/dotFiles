(setq custom-file "~/.emacs.d/customizations.el")

(defvar my-emacs-theme-style :dark)
(defvar my-light-emacs-theme 'modus-operandi)
(defvar my-dark-emacs-theme  'doom-nord)

;; load the theme for the current style
(progn
  (mapc #'disable-theme custom-enabled-themes)
  (if (equal my-emacs-theme-style :dark)
      (load-theme my-dark-emacs-theme t)
    (load-theme my-light-emacs-theme t)))

(setq package-native-compile t)
(setq flycheck-emacs-lisp-load-path 'inherit)
;; Super hack for debian testing
(setq package-check-signature nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


;; so we scroll one line at a time with keyboard
(setq scroll-conservatively 101)

(fset 'yes-or-no-p 'y-or-n-p)
;;(set-face-attribute 'default nil :font "peep")
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono-10")
;;(set-face-attribute 'default nil :font "M+ 1mn-11")
;;(set-face-attribute 'default nil :font "Iosevka-15") ;; demo font
(set-face-attribute 'default nil :font "Iosevka-12")
;;(set-face-attribute 'default nil :font "Source Code Pro-10")

;; Replace the selection content when typing
(delete-selection-mode 1)

;; Define package repositories
(require 'package)

(setq package-archives
      '(
        ("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ;; ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/")
        )
      ;; higher number is preffered
      package-archive-priorities
      '(        
        ("GNU ELPA"     . 5)
        ;; ("MELPA Stable" . 10)
        ("MELPA"        . 0)
        ))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; Highlight current line
(global-hl-line-mode 1)

(setq set-mark-command-repeat-pop t)

(electric-indent-mode t)

(setq echo-keystrokes 0.1)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(global-eldoc-mode 1)

(setq auto-window-vscroll nil)

;;(add-hook 'before-save-hook 'whitespace-cleanup)

;;;;;;;;;;;;;;
;; Packages ;;
;;;;;;;;;;;;;;

(use-package ef-themes
  :ensure t
  )

(use-package zig-mode
  :ensure t
  )

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) 
  (add-hook 'css-mode-hook  'emmet-mode))

;; (use-package smart-mode-line
;;   :ensure t
;;   :config
;;   (setq sml/theme 'light)
;;   (sml/setup))

(use-package ag
  :ensure t)

(use-package browse-kill-ring
  :ensure t)

;; (add-to-list 'load-path "/home/jmonetta/my-projects/cider")
;; (load "cider-autoloads" t t)

;; (require 'cider)
;; (setq nrepl-log-messages t)
;; (setq cider-prompt-save-file-on-load nil)
;; (setq nrepl-hide-special-buffers t)
;; (setq cider-repl-history-file "/home/jmonetta/.emacs.d/cider-repl-history")
;; (setq cider-refresh-before-fn "user/stop-system!"
;;       cider-refresh-after-fn "user/start-system!")
;; (define-key cider-repl-mode-map (kbd "C-`") 'cider-repl-previous-matching-input)
;; (define-key cider-repl-mode-map (kbd "C-l") 'cider-repl-clear-buffer)

(use-package cider
  :ensure t
  :config
  (setq nrepl-log-messages t)
  (setq cider-prompt-save-file-on-load nil)
  (setq nrepl-hide-special-buffers t)
  (setq cider-repl-history-file "/home/jmonetta/.emacs.d/cider-repl-history")
  (setq cider-refresh-before-fn "user/stop-system!"
        cider-refresh-after-fn "user/start-system!")
  (define-key cider-repl-mode-map (kbd "C-`") 'cider-repl-previous-matching-input)
  (define-key cider-repl-mode-map (kbd "C-l") 'cider-repl-clear-buffer)
  )


;; (add-to-list 'cider-jack-in-nrepl-middlewares "vlaaad.reveal.nrepl/middleware")

(use-package clj-refactor
  :ensure t
  :config
  (defun my-clojure-mode-hook ()
    (hi-lock-mode 1)
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-m"))

  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))

(defvar no-whitespace-cleanup nil)

(defun clojure-save-hook()
  (message "Running clojure-save-hook no-whitespace-cleanup %s" no-whitespace-cleanup)
  (when (and (not no-whitespace-cleanup)
             (or (eq major-mode 'clojurescript-mode) (eq major-mode 'clojure-mode)))
    (whitespace-cleanup)))

(use-package clojure-mode
  :ensure t
  :config
  (define-key clojure-mode-map (kbd "C->") 'cljr-thread)
  (define-key clojure-mode-map (kbd "C-<") 'cljr-unwind)
  (add-hook 'before-save-hook 'clojure-save-hook)
  )

(use-package company
  :ensure t
  :config
  (global-company-mode t))

(use-package dash
  :ensure t)

(use-package dired
  :config
  ;; (add-hook 'dired-after-readin-hook '(lambda () (dired-dotfiles-toggle)))
  (setq dired-listing-switches "-la")
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "h") 'dired-omit-mode)
  (define-key dired-mode-map (kbd "f") 'find-name-dired)
  (define-key dired-mode-map (kbd "l") 'dired-up-directory)
  (define-key dired-mode-map (kbd "<C-return>") 'dired-open-externally))

;; (use-package dired-x
;;   :config
;;   (setq-default dired-omit-files-p t)
;;   ;; (add-hook 'dired-mode-hook
;;   ;;             (lambda ()
;;   ;;               (setq buffer-face-mode-face '(:family "Source Code Pro" :height 130))
;;   ;;               (buffer-face-mode)
;;   ;;               ;; (dired-hide-details-mode)
;;   ;;               ))
;;   )

(use-package diminish
  :ensure t)

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key [remap mark-sexp] 'easy-mark))

(use-package expand-region
  :ensure t
  :bind
  ("C-." . er/expand-region)
  ("C-," . er/contract-region))

(use-package flx-ido
  :ensure t
  :init (progn
          (setq ido-enable-flex-matching t)
          (setq ido-use-faces nil))
  :config
  (flx-ido-mode 1))

(use-package ido
  :config
  (ido-mode 1)
  (ido-everywhere 1))

(use-package helm
  :ensure t
  :bind
  ("C-x C-f" . helm-find-files)
  :config
  (setq helm-external-programs-associations
      '(("jpg" . "ristretto")
        ("jpeg" . "ristretto")
        ("png" . "ristretto")
        ("gif" . "ristretto")
        ("xls" . "libreoffice")
        ("doc" . "libreoffice")
        ("pdf" . "evince")
        ("html" . "conkeror"))))

(use-package helm-ag
  :ensure t)

(use-package html-to-hiccup
  :ensure t)

(use-package helm-projectile
  :ensure t
  :bind
  ("C-S-g" . helm-projectile-ag))

(use-package hydra
  :ensure t)

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package magit
  :ensure t
  :bind
  ("<f12>" . magit-status)
  :init (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package markdown-mode
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :bind
  ("C-<down>" . mc/mark-next-like-this)
  ("C-<up>" . mc/mark-previous-like-this))

(use-package paredit
  :ensure t)

(use-package perspective
  :pin "MELPA"
  :ensure t
  
  :bind
  ("C-x C-b" . persp-list-buffers)
  
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  
  :config
  (persp-mode))

(use-package persp-projectile
  :pin "MELPA"
  :ensure t)

(use-package popwin
  :ensure t
  :config
  (popwin-mode 1)
  (push '("*compilation*" :width 0.5 :position right) popwin:special-display-config)
  (push '("*helm find files*" :height 0.5) popwin:special-display-config)
  (push '("*eclim: find" :height 0.5) popwin:special-display-config)
  (push '("*helm mini*" :height 0.5) popwin:special-display-config)
  (push '("*helm grep*" :height 0.5) popwin:special-display-config)
  (push '("*helm-ag*" :height 0.5) popwin:special-display-config)
  (push '("*hotspots*" :height 0.5) popwin:special-display-config)
  (push '("*helm locate*" :height 0.5) popwin:special-display-config)
  (push '("*helm-mode-find-file*" :height 0.5) popwin:special-display-config)
  (push '("*helm projectile*" :height 0.5) popwin:special-display-config)
  (push '("*helm projectile all*" :height 0.5) popwin:special-display-config)
  (push '("*helm etags*" :height 0.5) popwin:special-display-config)
  (push '("*helm M-x*" :height 0.5) popwin:special-display-config)
  (push '("*helm bookmarks*" :height 0.5) popwin:special-display-config)
  
  (push '("*cider-error*" :width 0.3 :position right) popwin:special-display-config)

  (push '("*cider-repl" :width 0.5 :position right) popwin:special-display-config)
  
  (push '("*Flycheck errors*" :height 0.2) popwin:special-display-config)
  
  (push '("*helm-mode-cider-repl-set-ns*" :height 0.5) popwin:special-display-config)
  (push '("*helm-mode-nil*" :height 0.5) popwin:special-display-config))

(use-package projectile
  :pin "MELPA"
  :ensure t
  :bind
  ("C-S-h" . projectile-find-file)
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-file-exists-remote-cache-expire nil)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (add-to-list 'projectile-globally-ignored-directories "node_modules"))

(use-package restclient
  :ensure t)

(use-package smartparens
  :ensure t)

(use-package smex
  :ensure t
  :bind
  ("M-x" . smex))

;; (use-package smooth-scrolling
;;   :ensure t
;;   :config (smooth-scrolling-mode))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package window-number
  :config
  (window-number-mode 1)
  (window-number-meta-mode 1)
  )

(use-package paredit)

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode t)
  (show-smartparens-global-mode t)
  (sp-use-paredit-bindings))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package flycheck
  :ensure t)

;; (use-package rustic
;;   :ensure
;;   :bind (:map rustic-mode-map
;;               ("M-j" . lsp-ui-imenu)
;;               ("M-?" . lsp-find-references)
;;               ("C-c C-c l" . flycheck-list-errors)
;;               ("C-c C-c a" . lsp-execute-code-action)
;;               ("C-c C-c r" . lsp-rename)
;;               ("C-c C-c q" . lsp-workspace-restart)
;;               ("C-c C-c Q" . lsp-workspace-shutdown)
;;               ("C-c C-c s" . lsp-rust-analyzer-status))
;;   :config
;;   ;; uncomment for less flashiness  
;;   (setenv "PATH" (concat (getenv "PATH") ":/home/jmonetta/.cargo/bin"))
;;   (setq exec-path (append exec-path '("/home/jmonetta/.cargo/bin")))
;;   (setq flycheck-rust-cargo-executable "/home/jmonetta/.cargo/bin/cargo")

  
;;   ;; comment to disable rustfmt on save
;;   (setq rustic-format-on-save t)
;;   (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

;; (defun rk/rustic-mode-hook ()
;;   ;; so that run C-c C-c C-r works without having to confirm, but don't try to
;;   ;; save rust buffers that are not file visiting. Once
;;   ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
;;   ;; no longer be necessary.
;;   (when buffer-file-name
;;     (setq-local buffer-save-without-query t)))


(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  
  (setq lsp-eldoc-hook nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-lens-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-eldoc-enable-hover t)
  ;;(lsp-eldoc-render-all t)
  ;;(lsp-idle-delay 0.6)
  ;;(lsp-rust-analyzer-server-display-inlay-hints t)
  )

(use-package lsp-java
  :ensure t
  :config
  ;;(add-to-list 'major-mode-remap-alist '(java-mode . java-ts-mode))
  ;;(add-hook 'java-ts-mode-hook #'lsp)
  (add-hook 'java-mode-hook #'lsp)
  )

;; (use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))

;; (use-package dap-java :ensure nil)

;; (use-package lsp-treemacs
;;   :ensure t)

;; (use-package lsp-ui
;;   :ensure
;;   :commands lsp-ui-mode
;;   ;; :custom
;;   ;; (lsp-ui-peek-always-show t)
;;   ;; (lsp-ui-sideline-show-hover t)
;;   ;; (lsp-ui-doc-enable nil)
;;   )

;; (use-package flycheck :ensure)

(use-package rainbow-mode
  :ensure t)

(use-package org-bullets
  :ensure t
  :custom
  (org-bullets-bullet-list '("◉" "○" "✸" "✿" "✜" "◆" "▶"))
  (org-ellipsis "⤵")
  :hook (org-mode . org-bullets-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom functions and utilities ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'hi-lock-mode-hook
      (lambda ()
        (highlight-regexp "FIXME:" (quote hi-red-b))
        (highlight-regexp "TODO:" (quote hi-red-b))
        (highlight-regexp "NOTE:" (quote hi-green-b)))
      t)

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun split-window-right-and-move-there-dammit ()
  (interactive)
  (split-window-right)
  (windmove-right))


(defun duplicate-region (&optional num start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used."
  (interactive "p")
  (save-excursion
   (let* ((start (or start (region-beginning)))
          (end (or end (region-end)))
          (region (buffer-substring start end)))
     (goto-char end)
     (dotimes (i num)
       (insert region)))))

(defun duplicate-current-line (&optional num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (save-excursion
   (when (eq (point-at-eol) (point-max))
     (goto-char (point-max))
     (newline)
     (forward-char -1))
   (duplicate-region num (point-at-bol) (1+ (point-at-eol)))))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (if (region-active-p)
      (let ((beg (region-beginning))
            (end (region-end)))
        (duplicate-region arg beg end)
        (one-shot-keybinding "d" (λ (duplicate-region 1 beg end))))
    (duplicate-current-line arg)
    (one-shot-keybinding "d" 'duplicate-current-line)))

(defun paredit-duplicate-closest-sexp ()
  (interactive)
  ;; skips to start of current sexp
  (while (not (paredit--is-at-start-of-sexp))
    (paredit-backward))
  (set-mark-command nil)
  ;; while we find sexps we move forward on the line
  (while (and (bounds-of-thing-at-point 'sexp)
              (<= (point) (car (bounds-of-thing-at-point 'sexp)))
              (not (= (point) (line-end-position))))
    (forward-sexp)
    (while (looking-at " ")
      (forward-char)))
  (kill-ring-save (mark) (point))
  ;; go to the next line and copy the sexprs we encountered
  (paredit-newline)
  (yank)
  (exchange-point-and-mark))

(defun camelize (s c)
  "Convert c separated  string s to CamelCase string."
  (mapconcat 'identity (mapcar
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s c)) ""))


(defun camelize-method (s c)
  "Convert c separated string S to camelCase string."
  (let* ((camelized (camelize s c))
         (char-list (string-to-list camelized))
         (first-char (first char-list))
         (rest-chars (rest char-list)))
    (concat (cons
             (downcase first-char)
             rest-chars))))

(defun transform-region (f)
  (let* ((region-text (buffer-substring-no-properties (region-beginning) (region-end)))
         (output (funcall f region-text)))
    (save-excursion
      (delete-region (region-beginning) (region-end))
      (insert output))))

(defun jpmonettas/camelize-region (separator-char)
  (interactive (list (read-string "Separator char :")))
  (transform-region (lambda (s) (camelize s separator-char))))

(defun jpmonettas/add-int-at-point (add)
  (interactive (list (string-to-int (read-string "How much :"))))
  (let* ((added (-> (word-at-point)
                    (string-to-int)
                    (+ add)))
         (num-bounds (bounds-of-thing-at-point 'word)))
    (kill-region (car num-bounds) (cdr num-bounds))
    (insert-string added)))

(defun jpmonettas/camelize-method-region (separator-char)
  (interactive (list (read-string "Separator char :")))
  (transform-region (lambda (s) (camelize-method s separator-char))))

(defun jpmonettas/camelize-method-region-underscore ()
  (interactive)
  (jpmonettas/camelize-method-region "_"))


(defun jpmonettas/beautify-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

(defun dired-dotfiles-toggle ()
    "Show/hide dot-files"
    (interactive)
    (when (equal major-mode 'dired-mode)
      (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
      (progn
        (set (make-local-variable 'dired-dotfiles-show-p) nil)
        (message "h")
        (dired-mark-files-regexp "^\\\.")
        (dired-do-kill-lines))
    (progn (revert-buffer) ; otherwise just revert to re-show
           (set (make-local-variable 'dired-dotfiles-show-p) t)))))

;; ;; Cider enhancements

;; (defconst cider-required-middleware-version "0.30.0"
;;   "The CIDER nREPL version that's known to work properly with CIDER.")

;; (defvar cider-jack-in-lein-plugins nil
;;   "")
;; (put 'cider-jack-in-lein-plugins 'risky-local-variable t)
;; (cider-add-to-alist 'cider-jack-in-lein-plugins
;;                     "cider/cider-nrepl" cider-required-middleware-version)

(defvar notes-last-opened nil)

(defun notes-insert-latest-screenshot ()
  (interactive)
  ;; ensure we have a directory to store images
  ;; if directory already exists this is a nop
  (condition-case nil
      (make-directory "./notes-images")
    (error nil))
  (let* ((last-screenshot (car (last (directory-files "~/screenshots" t)))))
    (copy-file last-screenshot "./notes-images/")
    (insert (format "[[./notes-images/%s]]" (file-name-nondirectory last-screenshot)))))

(defun notes-open-last ()
  (interactive)
  (find-file notes-last-opened))

(defun notes-open-note ()
  (interactive)
  (let* ((all-notes (cddr (directory-files "~/notes")))
         (selected-note (ido-completing-read "Notes:" all-notes))
         (note-path (format "~/notes/%s/notes.org" selected-note)))
    (find-file note-path)
    (setq notes-last-opened note-path)))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defvar maximize-window-maximized nil)

(defun maximize-restore-window ()
  (interactive)
  (let ((maximize-registry 5))
    (if maximize-window-maximized
        (progn
          (jump-to-register maximize-registry)
          (setq maximize-window-maximized nil))
      (progn
        (window-configuration-to-register maximize-registry)
        (delete-other-windows)
        (setq maximize-window-maximized t)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading other files  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)

(defconst prettify-symbols-alist
  '(("#+BEGIN_SRC"  . ?→)
    ("#+END_SRC"  . ?←)
    (":results silent"  .?¬)))

(add-hook 'org-mode-hook 'prettify-symbols-mode)

;;;;;;;;;;;;;;;;;;;;;;
;; Dired copy paste ;;
;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/non-elpa/dired-copy-paste.el")

(require 'dired-copy-paste)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load projects utils ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(load custom-file)

(add-to-list 'load-path "/home/jmonetta/my-projects/cider-storm")
(require 'cider-storm)
;;(add-to-list 'cider-jack-in-nrepl-middlewares "flow-storm.nrepl.middleware/wrap-flow-storm")
(define-key cider-mode-map (kbd "C-c C-f") 'cider-storm-map)

(load "/home/jmonetta/my-projects/elisp-utils/emacs.el")
(load "/home/jmonetta/my-projects/elisp-utils/clojure.el")
;; (load "/home/jmonetta/my-projects/elisp-utils/git.el")

(load "/home/jmonetta/other-sources/llvm-mode/llvm-mode.el")

;;;;;;;;;;;;;;
;; Bindings ;;
;;;;;;;;;;;;;;

(global-set-key (kbd "C-x m") 'maximize-restore-window)
(global-set-key (kbd "<f5>") 'flycheck-list-errors)
(global-set-key (kbd "<f6>") 'eval-and-replace)

(global-set-key (kbd "C-9") 'sp-forward-barf-sexp)
(global-set-key (kbd "C-0") 'sp-forward-slurp-sexp)

(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t w") 'transpose-words)

(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)

(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-2") 'duplicate-current-line-or-region)

;; Use join-line instead of the smartparens one that gets loaded everywhere
(global-set-key  (kbd "M-j") (lambda () (interactive) (join-line -1)))
(define-key smartparens-mode-map (kbd "M-j") (lambda () (interactive) (join-line -1)))

(define-key emacs-lisp-mode-map (kbd "C-M-2")  'paredit-duplicate-closest-sexp)
(define-key clojure-mode-map (kbd "C-M-2") 'paredit-duplicate-closest-sexp)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


(define-key global-map (kbd "C-S-n") (lambda () (interactive) (next-line 5)))
(define-key global-map (kbd "C-S-p") (lambda () (interactive) (previous-line 5)))


(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "M-o") 'quick-switch-buffer)
(global-set-key (kbd "M-O") 'persp-switch-last)

(global-set-key (kbd "C-<backspace>") 'kill-whole-line)
(global-set-key (kbd "C-<return>") 'compile)

(global-set-key (kbd "M-(") 'paredit-wrap-sexp)
(global-set-key (kbd "M-U") 'paredit-splice-sexp-killing-backward)

;; ;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(global-set-key (kbd "C-<tab>") 'company-complete)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-n") 'company-select-next)

(global-set-key (kbd "C-x x s") 'persp-switch)
(global-set-key (kbd "M-_") 'undo-redo)

(define-key lsp-mode-map (kbd "M-.") 'lsp-goto-implementation)

(unbind-key (kbd ";") java-mode-map)

(defun refresh-firefox ()
  (interactive)
  (shell-command "xdotool search \"Mozilla Firefox\" windowactivate --sync key F5")
  (shell-command "xdotool search \"emacs\" windowactivate"))

(global-set-key (kbd "C-<f5>") 'refresh-firefox)
(put 'upcase-region 'disabled nil)
