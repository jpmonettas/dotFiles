;;(load "/home/jmonetta/.emacs.d/nxhtml/autostart.el")

(load (expand-file-name "/home/jmonetta/NonRepSoftware/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(add-to-list 'load-path "~/.elisp")
(print load-path)

(defvar backup-dir (expand-file-name "~/.ebackups/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(defvar autosave-dir (expand-file-name "~/.eautosave/"))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))
(setq visible-bell t)
(setq ring-bell-function (lambda ()))
(fset 'yes-or-no-p 'y-or-n-p)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(scroll-bar-mode 0)

(show-paren-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode t)
(global-font-lock-mode t)
;; (icomplete-mode t)
(auto-compression-mode t)
(setq font-lock-maximum-decoration t)
(add-hook 'text-mode-hook 'auto-fill-mode)
;; (setq transient-mark-mode nil)
;; (delete-selection-mode t)
(display-time-mode 0)
(setq-default truncate-lines t)

(server-start)


(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives 
     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


(require 'expand-region)
(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)


(global-set-key (kbd "C-x b") 'helm-mini)

(require 'helm-utils)

(defun jpms/describe-function ()
  (interactive)
  (let ((function (or (function-called-at-point)
		      (completing-read "Describe function: " obarray 'fboundp t))))
    (when function
      (helm-describe-function function))))


(global-set-key (kbd "C-h f") 'jpms/describe-function)

(require 'ox-confluence)


(global-set-key (kbd "C-x C-f") 'helm-find-files)
;;---------------------------------------------------------
;; Ido
;;---------------------------------------------------------
(require 'ido)
(ido-mode t)

(load-theme 'subatomic t)
;; (load "color-theme-wombat+")
;; (color-theme-wombat+)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("06f5145c01ec774a0abb49eeffa3980743ce2f997112b537effeb188b7c51caf" "88d556f828e4ec17ac074077ef9dcaa36a59dccbaa6f2de553d6528b4df79cbd" "4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(debug-on-error nil)
 '(eclim-executable "/opt/eclipse/eclim")
 '(helm-buffer-details-flag nil)
 '(helm-buffer-max-length 60)
 '(helm-ff-auto-update-initial-value nil)
 '(org-hide-leading-stars t)
 '(org-html-postamble nil)
 '(org-return-follows-link t)
 '(pretty-symbol-patterns
   (quote
    ((955 lambda "\\<fn\\>"
	  (clojure-mode))
     (955 lambda "\\<lambda\\>"
	  (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode python-mode inferior-python-mode))
     (402 lambda "\\<function\\>"
	  (js-mode))
     (8800 relational "!="
	   (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8800 relational "/="
	   (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode))
     (8805 relational ">="
	   (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode))
     (8804 relational "<="
	   (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode))
     (8743 logical "&&"
	   (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8743 logical "\\<and\\>"
	   (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode))
     (8744 logical "||"
	   (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8744 logical "\\<or\\>"
	   (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode))
     (172 logical "\\<not\\>"
	  (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode)))))
 '(show-paren-mode t)
 '(svn-status-default-log-arguments (quote ("-l 20")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(helm-ff-directory ((t (:foreground "dark cyan" :height 1.2))))
 '(helm-ff-file ((t (:foreground "white smoke"))))
 '(helm-selection ((t (:background "SlateBlue3"))))
 '(helm-source-header ((t (:background "SlateBlue4" :foreground "white" :weight bold :height 1.3 :family "Sans Serif"))))
 '(org-level-1 ((t (:inherit outline-1 :height 2.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "gold"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green yellow"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "light goldenrod")))))

(require 'tramp)
(setq tramp-default-method "ssh")

(require 'nrepl)

;; Configure nrepl.el
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces-in-repl t)
(setq nrepl-history-file "~/.emacs.d/nrepl-history")

;; Some default eldoc facilities
(add-hook 'nrepl-connected-hook
          (defun pnh-clojure-mode-eldoc-hook ()
            (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
            (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
            (nrepl-enable-on-existing-clojure-buffers)))

;; Repl mode hook
(add-hook 'nrepl-mode-hook 'subword-mode)

;; Auto completion for NREPL
(require 'ac-nrepl)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)

;; (load-file "/home/jmonetta/NonRepSoftware/nrepl-inspect/nrepl-inspect.el")
;; (define-key nrepl-mode-map (kbd "C-c C-i") 'nrepl-inspect)

(require 'auto-complete-config)
(ac-config-default)


(global-set-key (kbd "C-S-n") 'anything-git-goto)
(global-set-key (kbd "C-S-l") 'helm-locate)

(helm-mode 1)

;;(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
(require 'nrepl-ritz)

;; (defun my-nrepl-mode-setup ()
;;   (require 'nrepl-ritz))
;; Ritz middleware
(define-key nrepl-interaction-mode-map (kbd "C-c C-j") 'nrepl-javadoc)
(define-key nrepl-mode-map (kbd "C-c C-j") 'nrepl-javadoc)
(define-key nrepl-interaction-mode-map (kbd "C-c C-a") 'nrepl-apropos)
(define-key nrepl-mode-map (kbd "C-c C-a") 'nrepl-apropos)

(key-chord-mode 1)
(key-chord-define-global "zx" 'comment-or-uncomment-region)


(require 'eclim)
(global-eclim-mode)



(require 'eclimd)

(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
;;(global-company-mode t)

;; (require 'flymake)

;; (defun my-flymake-init ()
;;   (list "/home/jmonetta/bin/my-java-flymake-checks.sh"
;;         (list (flymake-init-create-temp-buffer-copy
;;                'flymake-create-temp-with-folder-structure))))

;; (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.java$" my-flymake-init flymake-simple-cleanup))





(fset 'jpms/html-select-to-value-name
   (lambda (&optional arg) 
     "Keyboard macro."
     (interactive "p")
     (kmacro-exec-ring-item (quote ([24 114 106 49 19 118 97 108 117 101 13 right 67108896 19 34 19 24 114 115 51 right 67108896 19 44 127 60 left 24 114 115 52 right right right right right right right right 24 114 32 49 24 114 106 50 24 114 105 51 5 32 45 32 24 114 105 52 5 return 24 114 32 50 24 114 106 49] 0 "%d")) arg)))

(defun jpms/xml-pretty-print-region (begin end)
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))


(require 'vc-svn)

(global-undo-tree-mode)

(global-rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook (lambda ()
			       (paredit-mode 1)
			       (electric-indent-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (paredit-mode 1)
				  (electric-indent-mode 1)))
(global-hl-line-mode)
