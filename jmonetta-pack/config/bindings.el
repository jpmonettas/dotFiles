(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-S-l") 'helm-locate)
(global-set-key (kbd "C-S-g") 'projectile-grep)
(global-set-key (kbd "C-S-n") 'helm-projectile)

(global-set-key (kbd "<f2>") 'minimap-create)
(global-set-key (kbd "<f3>") 'minimap-kill)

(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

(define-key java-mode-map (kbd "M-,") 'pop-tag-mark)
(define-key java-mode-map (kbd "M-.") 'helm-etags-select)

(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "C-q") 'helm-swoop)

(define-key notmuch-search-mode-map (kbd "g") 'notmuch-refresh-this-buffer)
(define-key notmuch-hello-mode-map (kbd "g") 'notmuch-refresh-this-buffer)
(define-key notmuch-search-mode-map "d" 'toggle-message-delete)
(define-key notmuch-search-mode-map "u" 'toggle-message-unread)

(define-key notmuch-search-mode-map "r" 'reply-to-thread-sender-search)
(define-key notmuch-search-mode-map "R" 'reply-to-thread-search)

(define-key notmuch-show-mode-map "r" 'reply-to-thread-sender-show)
(define-key notmuch-show-mode-map "R" 'reply-to-thread-show)
