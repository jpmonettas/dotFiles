(load (expand-file-name "/home/jmonetta/NonRepSoftware/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(add-to-list 'load-path "~/.elisp")
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
(package-initialize)

;;---------------------------------------------------------
;; ido
;;---------------------------------------------------------
(require 'ido)
(ido-mode t)

;;(load-theme 'wombat)
(load "color-theme-wombat+")
(color-theme-wombat+)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))


(require 'auto-complete-config)
(ac-config-default)

(require 'ac-slime)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
