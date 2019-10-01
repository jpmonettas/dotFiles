;;;;;;;;;;;;;;;;
;; District0x ;;
;;;;;;;;;;;;;;;;

(defun memefactory-print-status () (interactive) (cider-interactive-eval "(memefactory.server.dev/print-statuses)"))
(defun memefactory-print-balances () (interactive) (cider-interactive-eval "(memefactory.server.dev/print-balances)"))
(defun memefactory-print-params () (interactive) (cider-interactive-eval "(memefactory.server.dev/print-params)"))
(defun memefactory-print-database () (interactive) (cider-interactive-eval "(memefactory.server.dev/print-db)"))

(defhydra hydra-memefactory-prints (:color blue)
  ("s" memefactory-print-status "Print Statuses")
  ("b" memefactory-print-balances "Print Balances")
  ("p" memefactory-print-params "Print Params")
  ("d" memefactory-print-database "Print Database"))

(defun memefactory-repl-start-ui ()
  (interactive)
  (rename-buffer "UI REPL")
  (cider-interactive-eval "(user/start-ui!)"))

(defun memefactory-repl-start-server ()
  (interactive)
  (rename-buffer "SERVER REPL")
  (cider-interactive-eval "(user/start-server!)"))

(defhydra hydra-memefactory-repl (:color blue)
  ("u" memefactory-repl-start-ui "Start UI repl")
  ("s" memefactory-repl-start-server "Start Server repl"))

(defun memefactory-redeploy () (interactive) (cider-interactive-eval "(memefactory.server.dev/redeploy)"))

(defhydra hydra-memefactory (:color blue)
  ("d" memefactory-redeploy "reDeploy")
  ("r" hydra-memefactory-repl/body "Repl")
  ("p" hydra-memefactory-prints/body "Print"))

(define-key cider-repl-mode-map (kbd "C-<return>") 'hydra-memefactory/body)
