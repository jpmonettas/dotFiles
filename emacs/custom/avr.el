;;;;;;;;;
;; AVR ;;
;;;;;;;;;

(defun avr-build () (interactive) (shell-command "make build"))
(defun avr-flash () (interactive) (shell-command "make flash"))
(defun avr-run-avarice () (interactive) (async-shell-command "make debug"))
(defun avr-all () (interactive) (shell-command "make all"))

(defun avr-datasheets ()
  (interactive)
  (let* ((helm-find-files-actions (helm-make-actions
                                 "Open file externally `C-c C-x, C-u to choose'" 'helm-open-file-externally)))
  (helm-find-files-1 "/home/jmonetta/datasheets/" )))

(defhydra hydra-avr (:color blue)
  ("a" avr-all "Build and flash")
  ("b" avr-build "Build")
  ("f" avr-flash "Flash into device")
  ("r" avr-run-avarice "Run avarice server")
  ("d" avr-datasheets "Datasheets"))

(require 'cc-mode)
(define-key c-mode-map (kbd "C-<return>") 'hydra-avr/body)
(define-key c++-mode-map (kbd "C-<return>") 'hydra-avr/body)

(require 'company-clang)
