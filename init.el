(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

;;(set-face-attribute 'default nil :font "peep")
(set-face-attribute 'default nil :font "DejaVu Sans Mono-9")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))


(package-initialize)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(setq req-pack '(ace-jump-mode
                 ac-cider
                 ac-cider-compliment
                 ac-nrepl
                 ack
                 ack-and-a-half
                 apel
                 async
                 auto-complete
                 browse-kill-ring
                 cider
                 cider-spy
                 clj-refactor
                 clojure-mode
                 clojure-snippets
                 clojurescript-mode
                 company
                 dash
                 diminish
                 dired-hacks-utils
                 dired-open
                 dired-rainbow
                 dired-subtree
                 dot-mode
                 easy-kill
                 easy-kill-extras
                 emmet-mode
                 epl
                 expand-region
                 f
                 flim
                 flx
                 flx-ido
                 flycheck
                 flymake-easy
                 flymake-sass
                 git-commit-mode
                 git-rebase-mode
                 guide-key
                 helm
                 helm-projectile
                 helm-swoop
                 help-fns+
                 highlight
                 ido-at-point
                 ido-ubiquitous
                 ido-vertical-mode
                 iedit
                 javap-mode
                 json-mode
                 json-reformat
                 json-snatcher
                 let-alist
                 lispy
                 magit
                 multi-term
                 multiple-cursors
                 neotree
                 nm
                 noflet
                 notmuch
                 notmuch-unread
                 nrepl-eval-sexp-fu
                 objc-font-lock
                 org
                 org-present
                 paredit
                 peg
                 persp-projectile
                 perspective
                 php+-mode
                 php-eldoc
                 php-extras
                 php-mode
                 pkg-info
                 popup
                 popwin
                 pretty-mode
                 projectile
                 queue
                 rainbow-delimiters
                 restclient
                 rich-minority
                 s
                 scss-mode
                 semi
                 slamhound
                 smart-mode-line
                 smartparens
                 smex
                 smooth-scrolling
                 solarized-theme
                 undo-tree
                 wanderlust
                 web-beautify
                 web-mode
                 window-number
                 yasnippet))


;; (dolist (p req-pack)
;;      (when (not (package-installed-p p))
;;        (package-install p)))

(global-hl-line-mode)

(require 'smex)


(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)


(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)


(require 'flx-ido)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)




;; (require 'helm)
;; (helm-mode 1)
;; (require 'browse-kill-ring)
;; (browse-kill-ring-default-keybindings)

(require 'popwin)
(popwin-mode 1)
(push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)
(push '("*Helm Find Files*" :height 0.5) popwin:special-display-config)
(push '("*helm mini*" :height 0.5) popwin:special-display-config)
(push '("*helm grep*" :height 0.5) popwin:special-display-config)
(push '("*helm locate*" :height 0.5) popwin:special-display-config)
(push '("*helm-mode-find-file*" :height 0.5) popwin:special-display-config)
(push '("*helm projectile*" :height 0.5) popwin:special-display-config)
(push '("*helm projectile all*" :height 0.5) popwin:special-display-config)
(push '("*helm etags*" :height 0.5) popwin:special-display-config)
(push '("*helm M-x*" :height 0.5) popwin:special-display-config)

(push '("*helm-mode-cider-repl-set-ns*" :height 0.5) popwin:special-display-config)
(push '("*helm-mode-nil*" :height 0.5) popwin:special-display-config)
;; (defun popup-todos () (interactive)
;;        (popwin:popup-buffer "TODOS.org" :width 0.5 :position 'left))


(load-theme 'solarized-dark t)




;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Email
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq sendmail-program "/usr/bin/msmtp")
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq mail-specify-envelope-from t
      ;; needed for debians message.el cf. README.Debian.gz
      message-sendmail-f-is-evil nil
      mail-envelope-from 'header
      message-sendmail-envelope-from 'header)

(require 'notmuch-address)
(setq notmuch-address-command "/home/jmonetta/non-rep-software/notmuch-addrlookup/addrlookup")
(notmuch-address-message-insinuate)

(require 'notmuch)

(defun search-toggle-message-delete ()
  "toggle deleted tag for message"
  (interactive)
  (notmuch-search-tag
   (list
    (if (member "deleted" (notmuch-search-get-tags))
        "-deleted" "+deleted"))))

(defun show-toggle-message-delete ()
  "toggle deleted tag for message"
  (interactive)
  (notmuch-show-tag
   (list
    (if (member "deleted" (notmuch-show-get-tags))
        "-deleted" "+deleted"))))

(defun show-toggle-message-unread ()
  "toggle unread tag for message"
  (interactive)
  (notmuch-show-tag
   (list
    (if (member "unread" (notmuch-show-get-tags))
        "-unread" "+unread"))))

(defun search-toggle-message-unread ()
  "toggle unread tag for message"
  (interactive)
  (notmuch-search-tag
   (list
    (if (member "unread" (notmuch-search-get-tags))
        "-unread" "+unread"))))

(defun reply-to-thread-show ()
  (interactive)
  (notmuch-show-reply 't))

(defun reply-to-thread-sender-show ()
  (interactive)
  (notmuch-show-reply-sender 't))

(defun reply-to-thread-search ()
  (interactive)
  (notmuch-search-reply-to-thread 't))

(defun reply-to-thread-sender-search ()
  (interactive)
  (notmuch-search-reply-to-thread-sender 't))


(defun notmuch-address-helm-select (prompt collection initial-input)
  (helm :sources `((name . "Email Addresses")
                   (candidates . ,(cons initial-input collection))
                   (pattern-transformer . (lambda (pattern) (regexp-quote pattern)))
                   (action . identity))
        :buffer "*email addresses*"
        :keymap helm-buffer-map))

(defun switch-to-mail-persp ()
  (interactive)
  (persp-switch "mail")
  (notmuch-search-unread))

(defun notmuch-search-unread ()
  (interactive)
  (notmuch-search "tag:unread"))


(defun notmuch-jump-to-tag ()
  (interactive)
  (let ((selected-tag (helm :sources `((name . "Tags")
                                       (candidates . ,(notmuch-tag-completions))
                                       (pattern-transformer . (lambda (pattern) (regexp-quote pattern)))
                                       (action . identity))
                            :buffer "*email tags*"
                            :keymap helm-buffer-map)))
    (notmuch-search (concat "tag:" selected-tag))))


(defun show-email-externally ()
  (interactive)
  (notmuch-show-pipe-message nil "view-html.sh"))

(defun show-email-externally-full-thread ()
  (interactive)
  (notmuch-show-pipe-message 't "view-html.sh"))

(defun set-english-dictionary ()
  (interactive)
  (ispell-change-dictionary "english")
  (flyspell-buffer))

(defun set-spanish-dictionary ()
  (interactive)
  (ispell-change-dictionary "castellano")
  (flyspell-buffer))

(defun cofi/helm-flyspell-correct ()
  "Use helm for flyspell correction.
Adapted from `flyspell-correct-word-before-point'."
  (interactive)
  ;; use the correct dictionary
  (flyspell-accept-buffer-local-defs)
  (let ((cursor-location (point))
        (word (flyspell-get-word))
        (opoint (point)))
    (if (consp word)
        (let ((start (car (cdr word)))
              (end (car (cdr (cdr word))))
              (word (car word))
              poss ispell-filter)
          ;; now check spelling of word.
          (ispell-send-string "%\n")	;put in verbose mode
          (ispell-send-string (concat "^" word "\n"))
          ;; wait until ispell has processed word
          (while (progn
                   (accept-process-output ispell-process)
                   (not (string= "" (car ispell-filter)))))
          ;; Remove leading empty element
          (setq ispell-filter (cdr ispell-filter))
          ;; ispell process should return something after word is sent.
          ;; Tag word as valid (i.e., skip) otherwise
          (or ispell-filter
              (setq ispell-filter '(*)))
          (if (consp ispell-filter)
              (setq poss (ispell-parse-output (car ispell-filter))))
          (cond
           ((or (eq poss t) (stringp poss))
            ;; don't correct word
            t)
           ((null poss)
            ;; ispell error
            (error "Ispell: error in Ispell process"))
           (t
            ;; The word is incorrect, we have to propose a replacement.
            (flyspell-do-correct (helm-comp-read "Correction: "
                                                 (append
                                                  (third poss)
                                                  '(("Save word" . save)
                                                    ("Accept (session)" . session)
                                                    ("Accept (buffer)" . buffer)))
                                                 :name (format "%s [%s]" word (or ispell-local-dictionary
                                                                                  ispell-dictionary
                                                                                  "Default"))
                                                 :must-match t
                                                 :alistp t)

                                 poss word cursor-location start end opoint)))
          (ispell-pdict-save t)))))

(add-hook 'message-mode-hook (lambda () (flyspell-mode 1)))

;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;;; Projectile
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-file-exists-remote-cache-expire nil)


(setq helm-swoop-split-direction 'split-window-horizontally)
(setq helm-swoop-speed-or-color nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; HTML
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'css-mode-hook 'flymake-css-load)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Clojure
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-company-mode)

(require 'cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-log-messages t)
(setq cider-prompt-save-file-on-load nil)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-history-file "/home/jmonetta/.emacs.d/cider-repl-history")

;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;;; Utils
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Org
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq org-agenda-files (list "~/notes/projects.org"
;;                              "~/notes/pricing-insider-email-campaign.org"))

;; ;; (add-hook 'org-mode-hook (lambda ()
;; ;;                            (setq buffer-face-mode-face '(:family "DejaVu Sans" :height 100 :widthtype semi-condensed))
;; ;;                            (buffer-face-mode)))

;; ;; (set-face-attribute 'org-table nil :inherit 'fixed-pitch)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Dired
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'dired)
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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Malabar
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;; ;;                                   global-semanticdb-minor-mode
;; ;;                                   global-semantic-idle-summary-mode
;; ;;                                   global-semantic-mru-bookmark-mode))


;; ;; (semantic-mode 1)
;; ;; (require 'malabar-mode)
;; ;; (setq malabar-groovy-lib-dir "/home/jmonetta/non-rep-software/malabar-mode-jar/target/")
;; ;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; ;; (add-hook 'malabar-mode-hook
;; ;;      (lambda ()
;; ;;        (add-hook 'after-save-hook 'malabar-compile-file-silently
;; ;;                   nil t)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Perspective
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'perspective)
(persp-mode)
(require 'persp-projectile)

(projectile-persp-bridge helm-projectile)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Modeline
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'smart-mode-line)
(sml/setup)

(sml/apply-theme 'dark nil t)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; JSX (javascript + react)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flycheck)
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker)
              (flycheck-mode))))


(defun enable-lisp-minors ()
  (rainbow-delimiters-mode))


(add-hook 'clojure-mode-hook 'enable-lisp-minors)
(add-hook 'emacs-lisp-mode-hook 'enable-lisp-minors)


;;window-number mode
(require 'window-number)
(window-number-mode 1)
(window-number-meta-mode 1)

(yas-global-mode)

;; global
(require 'smartparens-config)
(smartparens-global-strict-mode t)

;; highlights matching pairs
(show-smartparens-global-mode t)
(sp-use-paredit-bindings)

(electric-indent-mode t)

(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(global-undo-tree-mode t)

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-r")))

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)


(global-pretty-mode t)


;;(require 'smooth-scrolling)

;; Easily navigate sillycased words
(global-subword-mode 1)

(delete-selection-mode 1)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Auto refresh buffers
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Editing funcitons
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun split-window-right-and-move-there-dammit ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

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



;; My version of slamhound
;; It uses nrepl-sync-request:eval and nrepl-dict-get instead of the original ones

;; (or (require 'nrepl-client nil t)
;;     (require 'nrepl nil t)
;;     (error "Please install either the nrepl.el or cider package."))

;; (defun slamhound-clj-string (filename)
;;   (format "%s" `(do (require 'slam.hound)
;;                     (try (print (.trim (slam.hound/reconstruct
;;                                         ,(format "\"%s\"" filename))))
;;                      (catch Exception e
;;                             (println :error (.getMessage e)))))))

;; ;;;###autoload
;; (defun slamhound ()
;;   "Run slamhound on the current buffer.

;;   Requires active nrepl or slime connection."
;;   (interactive)
;;   (let* ((code (slamhound-clj-string buffer-file-name))
;;          (result (nrepl-dict-get (nrepl-sync-request:eval code) "out")))
;;     (if (string-match "^:error \\(.*\\)" result)
;;         (error (match-string 1 result))
;;       (goto-char (point-min))
;;       ;; skip any header comments before the ns
;;       (forward-sexp)
;;       (backward-kill-sexp)
;;       (insert result))))

;; (provide 'slamhound)
;; ;;; slamhound.el ends here


(setq org-default-notes-file "~/notes/capture.org")
(define-key global-map (kbd "C-0") 'org-capture)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; From magnar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'recentf)
(recentf-load-list)
(defvar user-home-directory (concat (expand-file-name "~") "/"))

(defun shorter-file-name (file-name)
  (s-chop-prefix user-home-directory file-name))

(defun recentf--file-cons (file-name)
  (cons (shorter-file-name file-name) file-name))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let* ((recent-files (mapcar 'recentf--file-cons recentf-list))
         (files (mapcar 'car recent-files))
         (file (completing-read "Choose recent file: " files)))
    (find-file (cdr (assoc file recent-files)))))

(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to.
Symbols matching the text at point are put first in the completion list."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))
                              
                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))
                              
                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))
                             
                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
    (let ((symbol-at-point (thing-at-point 'symbol)))
      (when symbol-at-point
        (let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
               (matching-symbols (delq nil (mapcar (lambda (symbol)
                                                   (if (string-match regexp symbol) symbol))
                                                 symbol-names))))
          (when matching-symbols
            (sort matching-symbols (lambda (a b) (> (length a) (length b))))
            (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
                  matching-symbols)))))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/conkeror")

(defun incs (s &optional num)
  (let* ((inc (or num 1))
         (new-number (number-to-string (+ inc (string-to-number s))))
         (zero-padded? (s-starts-with? "0" s)))
    (if zero-padded?
        (s-pad-left (length s) "0" new-number)
      new-number)))

(defun change-number-at-point (arg)
  (interactive "p")
  (unless (or (looking-at "[0-9]")
              (looking-back "[0-9]"))
    (error "No number to change at point"))
  (save-excursion
    (while (looking-back "[0-9]")
      (forward-char -1))
    (re-search-forward "[0-9]+" nil)
    (replace-match (incs (match-string 0) arg) nil nil)))

(defun subtract-number-at-point (arg)
  (interactive "p")
  (change-number-at-point (- arg)))


(add-hook 'nrepl-connected-hook #'cljr-update-artifact-cache)


(add-hook 'php-mode-hook
          (lambda ()
            (yas-minor-mode 1)
            (define-key php-mode-map (kbd "C-.") 'er/expand-region)
            (define-key php-mode-map (kbd "C-|") 'mc/mark-next-like-this)
            (define-key php-mode-map (kbd "C-<tab>") 'yas/create-php-snippet)
            ;; (define-key php-mode-map (kbd "M-j") 'jp-join-lines)
            (c-set-style "bsd")
            (setq c-basic-offset 4)
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            (setq comment-multi-line nil ;; maybe
                  comment-start "// "
                  comment-end ""
                  comment-style 'indent
                  comment-use-syntax t)
            ))
(put 'upcase-region 'disabled nil)


(defun paredit--is-at-start-of-sexp ()
  (and (looking-at "(\\|\\[\\|{")
     (not (nth 3 (syntax-ppss)))     ;; inside string
     (not (nth 4 (syntax-ppss)))))  ;; inside comment

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

(require 'diminish)
(diminish'undo-tree-mode)
(diminish 'yas-minor-mode)
(diminish 'company-mode)
(diminish 'projectile-mode)
(diminish 'smartparens-mode)
(diminish 'window-number-mode)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c p" "C-x x" "C-c C-r"))
(guide-key-mode 1)  ; Enable guide-key-mode


(setq helm-external-programs-associations
      '(("jpg" . "ristretto")
        ("jpeg" . "ristretto")
        ("png" . "ristretto")
        ("gif" . "ristretto")
        ("xls" . "libreoffice")
        ("doc" . "libreoffice")
        ("pdf" . "evince")
        ("html" . "conkeror")))

(defun eshell-open-externally (file-name)
  (interactive)
  (helm-open-file-externally (concat (eshell/pwd) "/" file-name)))

(defun dired-open-externally ()
  (interactive)
  (helm-open-file-externally (dired-get-file-for-visit)))

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

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;;; Java
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 's)
(require 'eclim)
(global-eclim-mode)
(require 'eclimd)
(custom-set-variables
 '(eclim-eclipse-dirs '("~/non-rep-software/eclipse/"))
 '(eclim-executable "~/non-rep-software/eclipse/eclim"))

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

;; (require 'misc)

(defun jpmonettas/run-test-at-point ()
  (interactive)
  (let* ((class-name (eclim--java-current-class-name))
        (method-name (cdr (eclim--java-identifier-at-point t)))
        (mvn-command (concat "-Dtest=" class-name "#" method-name " test")))
    (eclim-maven-run mvn-command)))

(add-hook 'java-mode-hook
          (lambda ()
            (define-key java-mode-map (kbd "C-M-o") 'eclim-java-import-organize)
            (define-key java-mode-map (kbd "C-M-3") 'eclim-java-find-references)
            (define-key java-mode-map (kbd "M-.") 'eclim-java-find-declaration)
            (define-key java-mode-map (kbd "C-c C-e t") 'jpmonettas/run-test-at-point) 
            (setq c-basic-offset 4)
            (setq indent-tabs-mode t)
            (setq tab-width 4)))
 
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))

(require 'java-file-create)

;; (ace-isearch-mode 1)
;; (global-ace-isearch-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/bindings")

