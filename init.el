(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

(set-face-attribute 'default nil :font "peep")
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono-12")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
             '("SC" . "http://joseito.republika.pl/sunrise-commander/"))

(package-initialize)

(defvar required-packages
  '(smartparens
    ace-jump-mode
    ack
    ack-and-a-half
    expand-region
    popwin
    undo-tree
    multiple-cursors
    easy-kill
    easy-kill-extras
    solarized-theme
    web-mode
    smart-mode-line
    browse-kill-ring
    flycheck
    rainbow-delimiters
    window-numbers
    json-mode

    magit
    notmuch
    projectile
    perspective
    persp-projectile
    emmet-mode

    helm
    helm-swoop
    helm-projectile

    clojure-mode
    clojure-snippets
    clojurescript-mode
    cider
    ac-cider
    ac-cider-compliment
    cider-browse-ns
    cider-decompile
    cider-spy))

;; (dolist (p required-packages)
;;     (when (not (package-installed-p p))
;;       (package-install p)))

(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(require 'popwin)
(popwin-mode 1)
(push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)
(push '("*Helm Find Files*" :height 0.5) popwin:special-display-config)
(push '("*helm mini*" :height 0.5) popwin:special-display-config)
(push '("*helm grep*" :height 0.5) popwin:special-display-config)
(push '("*helm locate*" :height 0.5) popwin:special-display-config)
(push '("*helm projectile*" :height 0.5) popwin:special-display-config)
(push '("*helm projectile all*" :height 0.5) popwin:special-display-config)
(push '("*helm etags*" :height 0.5) popwin:special-display-config)
(push '("*helm M-x*" :height 0.5) popwin:special-display-config)
;; (defun popup-todos () (interactive)
;;        (popwin:popup-buffer "TODOS.org" :width 0.5 :position 'left))


(load-theme 'solarized-dark t)



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Java
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'misc)

(add-hook 'java-mode-hook
 (lambda ()
   (setq c-basic-offset 4)
   (setq indent-tabs-mode t)
   (setq tab-width 4)))

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
  (persp-switch "mail"))

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Projectile
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-file-exists-remote-cache-expire nil)

(add-hook 'message-mode-hook (lambda () (flyspell-mode 1)))

(setq helm-swoop-split-direction 'split-window-horizontally)
(setq helm-swoop-speed-or-color nil)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'css-mode-hook 'flymake-css-load)


(require 'ac-cider-compliment)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-compliment-setup)
;;(add-hook 'cider-repl-mode-hook 'ac-cider-compliment-repl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes cider-mode))

(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))
(require 'cider)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Utils
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ;; (add-hook 'org-mode-hook (lambda ()
;; ;;                            (setq buffer-face-mode-face '(:family "DejaVu Sans" :height 100 :widthtype semi-condensed))
;; ;;                            (buffer-face-mode)))

;; ;; (set-face-attribute 'org-table nil :inherit 'fixed-pitch)

;; (require 'multi-term)
;; (setq multi-term-program "/usr/bin/zsh")

;; (defun term-send-tab ()
;;   "Send tab in term mode."
;;   (interactive)
;;   (term-send-raw-string "\t"))

;; (add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))
;; (add-to-list 'term-bind-key-alist '("C-c C-k" . term-char-mode))
;; (add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))


;; (defadvice term-send-input (before dirty-hack activate)
;;   (end-of-line)
;;   (set-marker (process-mark (get-buffer-process (current-buffer)))
;;               (point)))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Org
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-agenda-files (list "~/notes/projects.org"
                             "~/notes/pricing-insider-email-campaign.org"))


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

;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                   global-semanticdb-minor-mode
;;                                   global-semantic-idle-summary-mode
;;                                   global-semantic-mru-bookmark-mode))


;; (semantic-mode 1)
;; (require 'malabar-mode)
;; (setq malabar-groovy-lib-dir "/home/jmonetta/non-rep-software/malabar-mode-jar/target/")
;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; (add-hook 'malabar-mode-hook
;;      (lambda ()
;;        (add-hook 'after-save-hook 'malabar-compile-file-silently
;;                   nil t)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Perspective
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'perspective)
(persp-mode)
(require 'persp-projectile)

(projectile-persp-bridge helm-projectile)

(require 'smart-mode-line)
(sml/setup)

(sml/apply-theme 'dark nil t)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; JSX
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(define-key global-map (kbd "C-x C-m") 'switch-to-mail-persp)
(define-key global-map (kbd "C-x m") 'switch-to-mail-persp)

(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-S-l") 'helm-locate)
(global-set-key (kbd "C-S-g") 'projectile-ack)
(global-set-key (kbd "C-S-n") 'helm-projectile)

(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

;; (define-key java-mode-map (kbd "M-,") 'pop-tag-mark)
;; (define-key java-mode-map (kbd "M-.") 'helm-etags-select)

(global-set-key (kbd "C-q") 'helm-swoop)
(define-key isearch-mode-map (kbd "C-q") 'helm-swoop-from-isearch)

(define-key notmuch-search-mode-map (kbd "g") 'notmuch-refresh-this-buffer)
(define-key notmuch-hello-mode-map (kbd "g") 'notmuch-refresh-this-buffer)
(define-key notmuch-search-mode-map "d" 'search-toggle-message-delete)
(define-key notmuch-search-mode-map "u" 'search-toggle-message-unread)
(define-key notmuch-show-mode-map "d" 'show-toggle-message-delete)
(define-key notmuch-show-mode-map "u" 'show-toggle-message-unread)

(define-key notmuch-search-mode-map "r" 'reply-to-thread-sender-search)
(define-key notmuch-search-mode-map "R" 'reply-to-thread-search)

(define-key notmuch-show-mode-map "r" 'reply-to-thread-sender-show)
(define-key notmuch-show-mode-map "R" 'reply-to-thread-show)

(define-key notmuch-search-mode-map "T" 'notmuch-jump-to-tag)

(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-.") 'cofi/helm-flyspell-correct)

(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)

;; (defun create-ace-jump-word-mode-command (key)
;;   (lexical-let ((k key))
;;     (lambda ()
;;       (interactive)
;;       (ace-jump-word-mode k))))

;; (let ((keys '(?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?k ?l ?m ?n ?o
;;                  ?p ?q ?r ?s ?t ?u ?v ?w ?x ?y ?z ?1 ?2 ?3
;;                  ?4 ?5 ?6 ?7 ?8 ?9 ?0)))
;;   (loop for k in keys do
;;         (key-chord-define-global (string k k) (create-ace-jump-word-mode-command k))))

(global-set-key (kbd "M-c") 'calendar)
(global-set-key (kbd "C-<backspace>") 'kill-whole-line)
(global-set-key (kbd "C-|") 'mc/mark-next-like-this)

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "h") 'dired-dotfiles-toggle)

(global-set-key (kbd "C-x C-0") 'kill-buffer-and-window)

(global-set-key (kbd "C-/") 'comment-or-uncomment-region)


(defun enable-lisp-minors ()
  (rainbow-delimiters-mode)
  (smartparens-mode))

(add-hook 'clojure-mode-hook 'enable-lisp-minors)


;;window-number mode
(require 'window-number)
(window-number-mode 1)
(window-number-meta-mode 1)

(yas-global-mode)
