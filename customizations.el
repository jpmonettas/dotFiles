(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(auto-hscroll-mode t)
 '(browse-url-browser-function (quote browse-url-chromium))
 '(cider-cljs-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-debug-use-overlays t)
 '(cider-request-dispatch (quote static))
 '(cider-show-error-buffer t)
 '(cider-stacktrace-print-length 5)
 '(cider-stacktrace-print-level 1)
 '(company-dabbrev-code-ignore-case t)
 '(company-idle-delay nil)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-file "/home/jmonetta/.emacs.d/customizations.el")
 '(custom-safe-themes
   (quote
    ("2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" "b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "b8b5c353e73470377f2111fddb0ea652d35ce98e0a27a5c592d2ab9f66855106" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "ccba14aeee25adc49effe868f1820dfbf28b557353e4f69ca55de50642caf63f" "5bff694d9bd3791807c205d8adf96817ee1e572654f6ddc5e1e58b0488369f9d" default)))
 '(dired-hide-details-hide-information-lines t)
 '(dired-listing-switches "-al")
 '(dired-omit-files "^\\.?#\\|^\\..*$\\|^\\.\\.$")
 '(dired-recursive-deletes (quote always))
 '(eclim-eclipse-dirs (quote ("~/non-rep-software/eclipse/")))
 '(eclim-executable "~/non-rep-software/eclipse/eclim")
 '(ediff-merge-split-window-function (quote split-window-vertically))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(fci-rule-color "#073642")
 '(flx-ido-threshold 5000)
 '(haskell-notify-p t)
 '(haskell-process-type (quote ghci))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(helm-boring-buffer-regexp-list
   (quote
    ("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf")))
 '(helm-buffer-max-length 50)
 '(helm-external-programs-associations
   (quote
    (("'((\"jpg\" . \"ristretto\") (\"jpeg\" . \"ristretto\") (\"png\" . \"ristretto\") (\"gif\" . \"ristretto\") (\"xls\" . \"libreoffice\") (\"doc\" . \"libreoffice\") (\"pdf\" . \"evince\") (\"html\" . \"conkeror\"))" . ""))))
 '(helm-ff-auto-update-initial-value nil)
 '(helm-ff-ido-style-backspace t)
 '(helm-projectile-sources-list
   (quote
    (helm-source-projectile-files-list helm-source-projectile-buffers-list helm-source-projectile-recentf-list)))
 '(ido-ignore-buffers (quote ("\\` ")))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(magit-use-overlays nil)
 '(menu-bar-mode nil)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification sml/pos-id-separator mode-line-position sml/pre-modes-separator mode-line-modes mode-line-misc-info mode-line-end-spaces)))
 '(neo-dont-be-alone t)
 '(neo-window-width 40)
 '(notmuch-always-prompt-for-sender t)
 '(notmuch-hello-sections
   (quote
    (notmuch-hello-insert-saved-searches notmuch-hello-insert-alltags)))
 '(notmuch-identities (quote ("jpmonettas@gmail.com" "juan@infuy.com")))
 '(notmuch-saved-searches
   (quote
    ((:name "inbox" :query "tag:inbox")
     (:name "unread" :query "tag:unread")
     (:name "infuy" :query "tag:infuy")
     (:name "ib" :query "tag:ib")
     (:name "gmail" :query "tag:gmail"))))
 '(notmuch-search-oldest-first nil)
 '(notmuch-tag-added-formats
   (quote
    ((".*"
      (notmuch-apply-face tag
                          (quote
                           (:underline "green"))))
     ("important"
      (notmuch-apply-face tag
                          (quote
                           (:foreground "black" :background "red")))))))
 '(nrepl-sync-request-timeout 40)
 '(org-columns-default-format "%80ITEM(Task) %10TODO(Todo) %10Time_Estimate{:} %CLOCKSUM")
 '(org-confirm-babel-evaluate nil)
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("_" underline)
     ("=" org-code verbatim)
     ("~" org-verbatim verbatim)
     ("+"
      (:strike-through t)))))
 '(org-export-babel-evaluate nil)
 '(org-hide-leading-stars t)
 '(org-html-postamble nil)
 '(org-src-fontify-natively t)
 '(paradox-automatically-star t)
 '(pretty-symbol-patterns
   (quote
    ((955 lambda "\\<lambda\\>"
          (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode python-mode inferior-python-mode))
     (402 lambda "\\<function\\>"
          (js-mode))
     (8800 relational "!="
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8800 relational "/="
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8805 relational ">="
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8804 relational "<="
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8743 logical "&&"
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8743 logical "\\<and\\>"
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8744 logical "||"
           (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))
     (8744 logical "\\<or\\>"
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (172 logical "\\<not\\>"
          (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode))
     (8709 nil "\\<nil\\>"
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode clojure-mode)))))
 '(projectile-completion-system (quote ido))
 '(projectile-switch-project-action (quote projectile-find-file))
 '(recentf-auto-cleanup (quote never))
 '(sclang-auto-scroll-post-buffer t)
 '(sclang-eval-line-forward nil)
 '(scroll-bar-mode nil)
 '(smartparens-global-mode t)
 '(smartparens-global-strict-mode t)
 '(sml/no-confirm-load-theme t)
 '(sml/theme (quote dark))
 '(sr-listing-switches "-a")
 '(tab-width 4)
 '(term-eol-on-send t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(truncate-partial-width-windows nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(wdired-allow-to-change-permissions (quote advanced))
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2))

 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "#b58900"))))
 '(diff-added ((t (:foreground "#546E00"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(eval-sexp-fu-flash ((((class color) (background dark)) (:background "grey15" :foreground "DeepPink3"))) t)
 '(mode-line ((t (:background "#073642" :foreground "white" :box nil :underline nil :slant normal :weight normal))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))) t)
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))) t)
 '(notmuch-message-summary-face ((t (:background "#404040"))))
 '(notmuch-search-count ((t (:foreground "#6c71c4"))))
 '(notmuch-search-date ((t (:foreground "#268bd2"))))
 '(notmuch-search-matching-authors ((t (:foreground "#2aa198"))))
 '(notmuch-search-subject ((t (:inherit default))))
 '(notmuch-tag-face ((t (:foreground "cyan"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.6))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.4))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.3))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-6 ((t (:inherit variable-pitch :foreground "#859900" :height 1.1))))
 '(persp-selected-face ((t (:foreground "#d33682" :weight bold))))
 '(powerline-active1 ((t (:inherit mode-line :background "grey22" :weight extra-bold))) t)
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "grey11"))) t)
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "grey11"))) t)
 '(secondary-selection ((t (:background "purple4")))))
