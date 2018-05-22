;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm-files)

(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-Z") 'undo-tree-redo)

(global-set-key (kbd "C-*") 'isearch-forward-symbol-at-point)

;; Increase number at point (or other change based on prefix arg)
(global-set-key (kbd "C-+") 'change-number-at-point)
(global-set-key (kbd "C-=") 'change-number-at-point)
(global-set-key (kbd "C--") 'subtract-number-at-point)

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

(global-set-key (kbd "C-M-g") 'helm-google-suggest)

(global-set-key (kbd "M-k") 'kill-whole-line)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t w") 'transpose-words)

(global-set-key (kbd "M-c") 'hippie-expand)


(define-key clojure-mode-map (kbd "C->") 'cljr-thread)
(define-key clojure-mode-map (kbd "C-<") 'cljr-unwind)

(global-set-key (kbd "C-2") 'duplicate-current-line-or-region)

(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))
(define-key cider-mode-map (kbd "C-c C-s") 'slamhound)
(define-key cider-mode-map (kbd "C-c C-<return>") 'cider-macroexpand-1)

(define-key global-map (kbd "C-S-n") (lambda () (interactive) (next-line 5)))
(define-key global-map (kbd "C-S-p") (lambda () (interactive) (previous-line 5)))

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(define-key global-map (kbd "<f12>") 'magit-status)

(define-key global-map (kbd "C-x m") 'switch-to-mail-persp)

(define-key global-map (kbd "C-x RET") 'eshell)

(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
;;(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'smex)

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-x C-i") 'helm-semantic-or-imenu)


;; toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "M-o") 'quick-switch-buffer)
(global-set-key (kbd "M-O") 'switch-to-last-persp)

(global-set-key (kbd "C-S-l") 'helm-locate)
(global-set-key (kbd "C-S-g") 'helm-projectile-grep)
(global-set-key (kbd "C-S-m") 'helm-projectile)
(global-set-key (kbd "C-S-h") 'projectile-find-file)

(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-o") 'avy-goto-word-1)

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
(define-key notmuch-show-mode-map "j" 'notmuch-show-next-button)
(define-key notmuch-show-mode-map "k" 'notmuch-show-previous-button)

(define-key notmuch-search-mode-map "T" 'notmuch-jump-to-tag)


(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-.") 'cofi/helm-flyspell-correct)

(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)

;; (global-set-key (kbd "M-c") 'calendar)
(global-set-key (kbd "C-<backspace>") 'kill-whole-line)
(global-set-key (kbd "C-|") 'mc/mark-next-like-this)

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "h") 'dired-dotfiles-toggle)
(define-key dired-mode-map (kbd "f") 'find-name-dired)
(define-key dired-mode-map (kbd "<C-return>") 'dired-open-externally)

(global-set-key (kbd "C-x C-0") 'winner-undo)

(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

(define-key clojure-mode-map (kbd "M-n") 'sp-next-sexp)
(define-key clojure-mode-map (kbd "M-p") 'sp-backward-sexp)
(define-key clojure-mode-map (kbd "M-u") 'sp-backward-up-sexp)



(define-key emacs-lisp-mode-map (kbd "M-n") 'sp-next-sexp)
(define-key emacs-lisp-mode-map (kbd "M-p") 'sp-backward-sexp)
(define-key emacs-lisp-mode-map (kbd "M-u") 'sp-backward-up-sexp)

(global-set-key (kbd "C-<tab>") 'company-complete)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-n") 'company-select-next)


;; (cljr-add-keybindings-with-prefix "C-c C-r")

(define-key emacs-lisp-mode-map (kbd "C-M-2")  'paredit-duplicate-closest-sexp)
(define-key clojure-mode-map (kbd "C-M-2") 'paredit-duplicate-closest-sexp)

(global-set-key (kbd "M-(") 'paredit-wrap-sexp)
(global-set-key (kbd "M-U") 'paredit-splice-sexp-killing-backward)

(define-key helm-find-files-map (kbd "<C-return>") 'helm-ff-run-open-file-externally)


(define-key isearch-mode-map (kbd "<backspace>") 
  #'isearch-delete-something)


;; (global-set-key "\C-s" 'swiper)
;; (global-set-key "\C-r" 'swiper)
(global-set-key [f6] 'ivy-resume)
(global-set-key [f11] 'helm-bookmarks)
(define-key ivy-minibuffer-map (kbd "C-w") 'ivy-yank-word)
(global-set-key (kbd "C-<escape>") 'hotspots)
(global-set-key (kbd "C-M-h") 'highlight-lines-matching-regexp)
(global-set-key (kbd "C-M-S-H") 'unhighlight-regexp)

(define-key org-mode-map (kbd "M-+") 'jpmonettas/add-int-at-point)

(define-key cider-repl-mode-map (kbd "C-`") 'cider-repl-previous-matching-input)
