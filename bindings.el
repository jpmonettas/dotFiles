;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))
(define-key cider-mode-map (kbd "C-c C-s") 'slamhound)
(define-key global-map (kbd "M-n") 'forward-sexp)
(define-key global-map (kbd "M-p") 'backward-sexp)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(define-key global-map (kbd "C-x C-m") 'switch-to-mail-persp)
(define-key global-map (kbd "C-x m") 'switch-to-mail-persp)

(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)

;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-S-l") 'helm-locate)
(global-set-key (kbd "C-S-g") 'projectile-ack)
(global-set-key (kbd "C-S-n") 'helm-projectile)

(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-q") 'helm-swoop)
(global-set-key (kbd "C-o") 'ace-jump-word-mode)

(define-key isearch-mode-map (kbd "C-q") 'helm-swoop-from-isearch)

(define-key notmuch-search-mode-map (kbd "g") 'notmuch-refresh-this-buffer)
(define-key notmuch-hello-mode-map (kbd "g") 'notmuch-refresh-this-buffer)
(define-key notmuch-search-mode-map "d" 'search-toggle-message-delete)
(define-key notmuch-search-mode-map "u" 'search-toggle-message-unread)
(define-key notmuch-show-mode-map "d" 'show-toggle-message-delete)
(define-key notmuch-show-mode-map "u" 'show-toggle-message-unread)
(define-key notmuch-show-mode-map "h" 'show-email-externally)
(define-key notmuch-show-mode-map "H" 'show-email-externally-full-thread)

(define-key notmuch-search-mode-map "r" 'reply-to-thread-sender-search)
(define-key notmuch-search-mode-map "R" 'reply-to-thread-search)

(define-key notmuch-show-mode-map "r" 'reply-to-thread-sender-show)
(define-key notmuch-show-mode-map "R" 'reply-to-thread-show)

(define-key notmuch-search-mode-map "T" 'notmuch-jump-to-tag)


(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-.") 'cofi/helm-flyspell-correct)

(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)

(global-set-key (kbd "M-c") 'calendar)
(global-set-key (kbd "C-<backspace>") 'kill-whole-line)
(global-set-key (kbd "C-|") 'mc/mark-next-like-this)

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "h") 'dired-dotfiles-toggle)

(global-set-key (kbd "C-x C-0") 'kill-buffer-and-window)

(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

(define-key clojure-mode-map (kbd "M-n") 'sp-next-sexp)
(define-key clojure-mode-map (kbd "M-p") 'sp-backward-sexp)
(define-key clojure-mode-map (kbd "M-u") 'sp-backward-up-sexp)

(define-key emacs-lisp-mode-map (kbd "M-n") 'sp-next-sexp)
(define-key emacs-lisp-mode-map (kbd "M-p") 'sp-backward-sexp)
(define-key emacs-lisp-mode-map (kbd "M-u") 'sp-backward-up-sexp)

(global-set-key (kbd "C-<tab>") 'company-complete)
