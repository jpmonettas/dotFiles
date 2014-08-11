(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(browse-url-browser-function (quote browse-url-chromium))
 '(cider-repl-print-length 1)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-file "/home/jmonetta/.live-packs/jmonetta-pack/customizations.el")
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "ccba14aeee25adc49effe868f1820dfbf28b557353e4f69ca55de50642caf63f" "5bff694d9bd3791807c205d8adf96817ee1e572654f6ddc5e1e58b0488369f9d" default)))
 '(fci-rule-color "#073642")
 '(haskell-notify-p t)
 '(haskell-process-type (quote ghci))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(helm-boring-buffer-regexp-list (quote ("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*")))
 '(helm-buffer-max-length 50)
 '(helm-ff-auto-update-initial-value nil)
 '(helm-ff-ido-style-backspace t)
 '(indent-tabs-mode nil)
 '(initial-scratch-message nil)
 '(notmuch-address-selection-function (quote notmuch-address-helm-select))
 '(notmuch-always-prompt-for-sender t)
 '(notmuch-hello-sections (quote (notmuch-hello-insert-saved-searches notmuch-hello-insert-alltags)))
 '(notmuch-identities (quote ("juan.monetta@internetbrands.com" "jpmonettas@gmail.com" "juan@infuy.com")))
 '(notmuch-saved-searches (quote ((:name "inbox" :query "tag:inbox") (:name "unread" :query "tag:unread") (:name "infuy" :query "tag:infuy") (:name "ib" :query "tag:ib") (:name "gmail" :query "tag:gmail"))))
 '(notmuch-search-oldest-first nil)
 '(notmuch-tag-added-formats (quote ((".*" (notmuch-apply-face tag (quote (:underline "green")))) ("important" (notmuch-apply-face tag (quote (:foreground "black" :background "red")))))))
 '(org-columns-default-format "%80ITEM(Task) %10TODO(Todo) %10Time_Estimate{:} %CLOCKSUM")
 '(org-emphasis-alist (quote (("*" bold) ("_" underline) ("=" org-code verbatim) ("~" org-verbatim verbatim) ("+" (:strike-through t)))))
 '(org-hide-leading-stars t)
 '(org-html-postamble nil)
 '(projectile-completion-system (quote helm))
 '(sclang-auto-scroll-post-buffer t)
 '(sclang-eval-line-forward nil)
 '(term-eol-on-send t)
 '(truncate-lines t)
 '(truncate-partial-width-windows nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#cb4b16") (60 . "#b58900") (80 . "#859900") (100 . "#2aa198") (120 . "#268bd2") (140 . "#d33682") (160 . "#6c71c4") (180 . "#dc322f") (200 . "#cb4b16") (220 . "#b58900") (240 . "#859900") (260 . "#2aa198") (280 . "#268bd2") (300 . "#d33682") (320 . "#6c71c4") (340 . "#dc322f") (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(wdired-allow-to-change-permissions (quote advanced)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(eval-sexp-fu-flash ((((class color) (background dark)) (:background "grey15" :foreground "DeepPink3"))))
 '(helm-ff-directory ((t (:foreground "deep sky blue" :height 1.3))))
 '(helm-ff-file ((t (:foreground "white smoke"))))
 '(helm-grep-file ((t (:foreground "DarkOrange1" :underline t))))
 '(helm-selection ((t (:background "dark violet"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))) t)
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))) t)
 '(notmuch-message-summary-face ((t (:background "#404040"))))
 '(notmuch-search-count ((t (:foreground "#6c71c4"))))
 '(notmuch-search-date ((t (:foreground "#268bd2"))))
 '(notmuch-search-matching-authors ((t (:foreground "#2aa198"))))
 '(notmuch-search-subject ((t (:inherit default))))
 '(notmuch-tag-face ((t (:foreground "#cb4b16"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.6))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.4))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.3))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-6 ((t (:height 1.1))))
 '(persp-selected-face ((t (:foreground "#d33682" :weight bold))))
 '(powerline-active1 ((t (:inherit mode-line :background "grey22" :weight extra-bold))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "grey11"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "grey11"))))
 '(secondary-selection ((t (:background "purple4")))))
