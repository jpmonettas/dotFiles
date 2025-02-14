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
 '(browse-url-browser-function 'browse-url-firefox)
 '(browse-url-firefox-program "/usr/bin/firefox")
 '(c-default-style
   '((java-mode . "whitesmith")
     (awk-mode . "awk")
     (other . "gnu")))
 '(cider-cljs-lein-repl
   "(cemerick.piggieback/cljs-repl (cljs.repl.rhino/repl-env))" t)
 '(cider-cljs-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-clojure-cli-aliases ":dev")
 '(cider-clojure-cli-command "clojure")
 '(cider-debug-use-overlays t)
 '(cider-enable-nrepl-jvmti-agent t)
 '(cider-enrich-classpath nil)
 '(cider-inject-dependencies-at-jack-in t)
 '(cider-injected-nrepl-version "1.3.1")
 '(cider-inspector-page-size 200)
 '(cider-lein-command "lein")
 '(cider-lein-parameters "with-profile +dev repl :headless :host ::")
 '(cider-print-options '(("length" 50) ("level" 50)))
 '(cider-repl-display-help-banner nil)
 '(cider-request-dispatch 'dynamic)
 '(cider-show-error-buffer t)
 '(cider-stacktrace-print-length 5)
 '(cider-stacktrace-print-level 1)
 '(cider-test-defining-forms '("deftest" "defspec" "def-instrumentation-test"))
 '(cider-use-tooltips nil)
 '(column-number-mode t)
 '(company-dabbrev-code-ignore-case t)
 '(company-idle-delay nil)
 '(confirm-kill-emacs 'y-or-n-p)
 '(cursor-type 'box)
 '(custom-file "/home/jmonetta/.emacs.d/customizations.el")
 '(custom-safe-themes
   '("2853dd90f0d49439ebd582a8cbb82b9b3c2a02593483341b257f88add195ad76" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "63865ac3d0f7fe970be87f4690ed3c19be51632808f65e6fdd812e74f98b95fa" "0f08efc35f1190204ac227e8c866b18400612d2137e2d13dcbf4693953681ff3" "8d371c95370c5965746ccddd94fe96d7a2fbcdd67a77b3951db6fb11f68baf7d" "578db0ce196a4c849aa995a0dd32d5fe85da59a1ec303614aa40a28bf9ad8b99" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "0685ffa6c9f1324721659a9cd5a8931f4bb64efae9ce43a3dba3801e9412b4d8" "56d10d2b60685d112dd54f4ba68a173c102eacc2a6048d417998249085383da1" "fd22c8c803f2dac71db953b93df6560b6b058cb931ac12f688def67f08c10640" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "e27556a94bd02099248b888555a6458d897e8a7919fd64278d1f1e8784448941" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "f94110b35f558e4c015b2c680f150bf8a19799d775f8352c957d9d1054b0a210" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "a3bdcbd7c991abd07e48ad32f71e6219d55694056c0c15b4144f370175273d16" "8a1750df099643aead89ec2762c8617589283d5ce259963a35c1df77bfbc0fd2" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "4ed6edbad2c19b775d5b22efcbd117b395e4194da2014e28c9e80f5f3fb93f36" "af4dc574b2f96f5345d55b98af024e2db9b9bbf1872b3132bc66dffbf5e1ba1d" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "61ae193bf16ef5c18198fbb4516f0c61a88f7b55b693a3b32d261d8501c4a54b" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" "b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "b8b5c353e73470377f2111fddb0ea652d35ce98e0a27a5c592d2ab9f66855106" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "ccba14aeee25adc49effe868f1820dfbf28b557353e4f69ca55de50642caf63f" "5bff694d9bd3791807c205d8adf96817ee1e572654f6ddc5e1e58b0488369f9d" default))
 '(dired-guess-shell-alist-user nil)
 '(dired-hide-details-hide-information-lines t)
 '(dired-listing-switches "-lg")
 '(dired-recursive-deletes 'always)
 '(eclim-eclipse-dirs '("~/non-rep-software/eclipse/"))
 '(eclim-executable "~/non-rep-software/eclipse/eclim")
 '(ediff-merge-split-window-function 'split-window-vertically)
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(enable-local-variables :all)
 '(exec-path
   '("/usr/lib/emacs/26.1/x86_64-linux-gnu" "/home/jmonetta/.nvm/versions/node/v16.17.1/bin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/local/games" "/usr/games" "/home/jmonetta/bin"))
 '(fci-rule-color "#073642")
 '(flycheck-c/c++-gcc-executable "avr-gcc")
 '(flycheck-error-list-minimum-level 'warning)
 '(flycheck-gcc-args '("-mmcu=atmega32"))
 '(flycheck-highlighting-mode nil)
 '(gud-gdb-command-name "avr-gdb -i=mi")
 '(haskell-notify-p t)
 '(haskell-process-type 'ghci)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(helm-boring-buffer-regexp-list
   '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf"))
 '(helm-buffer-max-length 50)
 '(helm-external-programs-associations
   '(("pdf" . "evince")
     ("'((\"jpg\" . \"ristretto\") (\"jpeg\" . \"ristretto\") (\"png\" . \"ristretto\") (\"gif\" . \"ristretto\") (\"xls\" . \"libreoffice\") (\"doc\" . \"libreoffice\") (\"pdf\" . \"evince\") (\"html\" . \"conkeror\"))" . "")) t)
 '(helm-ff-auto-update-initial-value nil)
 '(helm-ff-ido-style-backspace t)
 '(helm-grep-ignored-directories
   '("SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "resources/public/js/compiled/"))
 '(helm-projectile-sources-list
   '(helm-source-projectile-files-list helm-source-projectile-buffers-list helm-source-projectile-recentf-list))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(ispell-dictionary "es_ES")
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(lsp-eldoc-enable-hover nil)
 '(magit-diff-arguments '("--ignore-all-space" "--no-ext-diff" "--stat"))
 '(magit-diff-section-arguments '("--no-ext-diff"))
 '(magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
 '(magit-merge-arguments '("--ff-only"))
 '(magit-use-overlays nil)
 '(menu-bar-mode nil)
 '(mode-line-format
   '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification sml/pos-id-separator mode-line-position sml/pre-modes-separator mode-line-modes mode-line-misc-info mode-line-end-spaces))
 '(neo-dont-be-alone t)
 '(neo-window-width 40)
 '(notmuch-always-prompt-for-sender t)
 '(notmuch-hello-sections
   '(notmuch-hello-insert-saved-searches notmuch-hello-insert-alltags))
 '(notmuch-identities '("jpmonettas@gmail.com" "juan@infuy.com"))
 '(notmuch-saved-searches
   '((:name "inbox" :query "tag:inbox")
     (:name "unread" :query "tag:unread")
     (:name "infuy" :query "tag:infuy")
     (:name "ib" :query "tag:ib")
     (:name "gmail" :query "tag:gmail")))
 '(notmuch-search-oldest-first nil)
 '(notmuch-tag-added-formats
   '((".*"
      (notmuch-apply-face tag
                          '(:underline "green")))
     ("important"
      (notmuch-apply-face tag
                          '(:foreground "black" :background "red")))))
 '(nrepl-sync-request-timeout 120)
 '(org-columns-default-format "%80ITEM(Task) %10TODO(Todo) %10Time_Estimate{:} %CLOCKSUM")
 '(org-confirm-babel-evaluate nil)
 '(org-emphasis-alist
   '(("*" bold)
     ("_" underline)
     ("=" org-code verbatim)
     ("~" org-verbatim verbatim)
     ("+"
      (:strike-through t))))
 '(org-export-use-babel nil)
 '(org-hide-leading-stars t)
 '(org-html-postamble nil)
 '(org-src-fontify-natively t)
 '(package-selected-packages
   '(ido-vertical-mode flx ido-completing-read+ kotlin-mode dart-mode logview heml google-c-style counsel zig-mode evil tree-sitter tree-sitter-ess-r tree-sitter-indent tree-sitter-ispell tree-sitter-langs flycheck lsp-java java-lsp ef-themes lsp-mode rustic cider html-to-hiccup org-bullets racer emacs-racer company-solidity easy-kill yasnippet use-package smartparens paredit multiple-cursors helm doom-nord company spinner ag clj-refactor rust-mode clojure-mode elpy doom-themes rainbow-mode speed-type helm-ag anti-zenburn-theme spacemacs-theme solidity-mode apropospriate-theme edit-indirect sublime-themes monokai-theme forth-mode buttercup ztree zenburn-theme window-number which-key web-mode web-beautify wanderlust undo-tree solarized-theme smooth-scrolling smex smart-mode-line slamhound scss-mode restclient rainbow-delimiters pretty-mode popwin php-extras php-eldoc php+-mode paradox ox-reveal org-tree-slide org-present objc-font-lock nrepl-eval-sexp-fu notmuch-unread nm neotree multi-term mingus markdown-preview-eww markdown-mode magit lispy less-css-mode json-mode javap-mode java-snippets java-file-create htmlize hindent hide-lines help-fns+ helm-themes helm-projectile haskell-mode flymake-sass flycheck-pos-tip flycheck-clojure fancy-narrow f expand-region eredis emmet-mode emacsql-mysql emacs-eclim easy-kill-extras dracula-theme dot-mode django-theme dired-subtree dired-rainbow dired-open diminish company-flx color-theme-sanityinc-tomorrow clojurescript-mode clojure-snippets cider-spy browse-kill-ring ack-and-a-half ack ace-isearch ac-nrepl ac-cider))
 '(paradox-automatically-star t)
 '(pretty-symbol-patterns
   '((955 lambda "\\<lambda\\>"
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
           (emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode clojure-mode))))
 '(projectile-completion-system 'ivy)
 '(projectile-globally-ignored-directories
   '("node_modules" ".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".cljs_node_repl" ".shadow-cljs" ".cpcache"))
 '(projectile-globally-ignored-file-suffixes '(".map"))
 '(projectile-switch-project-action 'projectile-find-file)
 '(recentf-auto-cleanup 'never)
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values
   '((elisp-lint-indent-specs
      (if-let* . 2)
      (when-let* . 1)
      (let* . defun)
      (nrepl-dbind-response . 2)
      (cider-save-marker . 1)
      (cider-propertize-region . 1)
      (cider-map-repls . 1)
      (cider--jack-in . 1)
      (cider--make-result-overlay . 1)
      (insert-label . defun)
      (insert-align-label . defun)
      (insert-rect . defun)
      (cl-defun . 2)
      (with-parsed-tramp-file-name . 2)
      (thread-first . 0)
      (thread-last . 0)
      (transient-define-prefix . defmacro)
      (transient-define-suffix . defmacro))
     (clojure-indent-style 'always-indent)
     (clojure-dev-menu-name . "magic-dev-menu")
     (eval setq! cljr-clojure-test-declaration "[clojure.test :refer [deftest testing is]]\12                  [magic.script :refer [compile-python]]\12                  [magic.script.passes :refer [compile-sample compile-sample* conform]]\12                  [magic.script.util :refer [niceid]]\12                  [pattern :refer [ok]]")
     (no-whitespace-cleanup quote t)
     (clojure-dev-menu-name . "weather-alerts-dev-menu")
     (clojure-dev-menu-name . "playground-dev-menu")
     (clojure-dev-menu-name . "clindex-dev-menu")
     (clojure-dev-menu-name . "hansel-dev-menu")
     (clojure-dev-menu-name . "flow-storm-dev-menu")
     (cider-ns-refresh-before-fn . "com.stuartsierra.component.repl/stop")
     (cider-ns-refresh-after-fn . "com.stuartsierra.component.repl/start")
     (cider-known-endpoints
      ("localhost" "9656"))
     (cider-path-translations
      ("/root" . "/home/jmonetta")
      ("/usr/src/app" . "/home/jmonetta/my-projects/clash-co/clash-backend"))
     (eval define-clojure-indent
           (animation/interpolate 0)
           (animation/start 0)
           (animation/parallel 0))
     (elisp-lint-indent-specs
      (if-let* . 2)
      (when-let* . 1)
      (let* . defun)
      (nrepl-dbind-response . 2)
      (cider-save-marker . 1)
      (cider-propertize-region . 1)
      (cider-map-repls . 1)
      (cider--jack-in . 1)
      (cider--make-result-overlay . 1)
      (insert-label . defun)
      (insert-align-label . defun)
      (insert-rect . defun)
      (cl-defun . 2)
      (with-parsed-tramp-file-name . 2)
      (thread-first . 1)
      (thread-last . 1))
     (cider-shadow-cljs-default-options . "app")
     (bug-reference-bug-regexp . "#\\(?2:[[:digit:]]+\\)")
     (checkdoc-package-keywords-flag)))
 '(sclang-auto-scroll-post-buffer t)
 '(sclang-eval-line-forward nil)
 '(scroll-bar-mode nil)
 '(smartparens-global-mode t)
 '(smartparens-global-strict-mode t)
 '(sml/no-confirm-load-theme t)
 '(sml/theme 'light)
 '(sr-listing-switches "-a")
 '(tab-width 4)
 '(term-eol-on-send t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(truncate-partial-width-windows nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
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
     (360 . "#cb4b16")))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(wdired-allow-to-change-permissions 'advanced)
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(window-number-meta-mode t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "#b58900"))))
 '(diff-added ((t (:foreground "#546E00"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ediff-current-diff-A ((t (:background "#E57373" :foreground "#3a3a3a"))))
 '(ediff-current-diff-Ancestor ((t (:background "#E57373" :foreground "#3a3a3a"))))
 '(ediff-current-diff-B ((t (:background "#C5E1A5" :foreground "#3a3a3a"))))
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-fine-diff-A ((t (:background "#E57373" :foreground "#3a3a3a"))))
 '(ediff-fine-diff-Ancestor ((t (:background "#E57373" :foreground "#3a3a3a"))))
 '(ediff-fine-diff-B ((t (:background "#C5E1A5" :foreground "#3a3a3a"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(eval-sexp-fu-flash ((((class color) (background dark)) (:background "grey15" :foreground "DeepPink3"))) t)
 '(magit-blame-date ((t (:foreground "magenta"))))
 '(magit-blame-hash ((t (:foreground "magenta"))))
 '(magit-blame-heading ((t (:foreground "dim gray"))))
 '(magit-blame-name ((t (:background "dark magenta" :foreground "light gray"))))
 '(magit-diff-added-highlight ((t (:background "#C5E1A5" :foreground "#3a3a3a"))))
 '(magit-diff-removed-highlight ((t (:background "#E57373" :foreground "#3a3a3a"))))
 '(magit-diff-their-highlight ((t (:background "#C5E1A5" :foreground "#3a3a3a"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))) t)
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))) t)
 '(notmuch-message-summary-face ((t (:background "#404040"))))
 '(notmuch-search-count ((t (:foreground "#6c71c4"))))
 '(notmuch-search-date ((t (:foreground "#268bd2"))))
 '(notmuch-search-matching-authors ((t (:foreground "#2aa198"))))
 '(notmuch-search-subject ((t (:inherit default))))
 '(notmuch-tag-face ((t (:foreground "cyan"))))
 '(org-block ((t (:background "#183538"))))
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
 '(window-number-face ((t (:foreground "grey22"))) t))
