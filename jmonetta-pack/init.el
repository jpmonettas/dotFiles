;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(setq custom-file "/home/jmonetta/.live-packs/jmonetta-pack/customizations.el")

(load "/home/jmonetta/.elisp/ox-confluence.el")

(load (expand-file-name "/home/jmonetta/NonRepSoftware/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;;(live-set-default-font "Inconsolata-10")
(live-set-default-font "DejaVu Sans Mono-9")

(popwin-mode 1)

(push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)
(push '("*Helm Find Files*" :height 0.5) popwin:special-display-config)
(push '("*helm mini*" :height 0.5) popwin:special-display-config)
(push '("*helm grep*" :height 0.5) popwin:special-display-config)
(push '("*helm locate*" :height 0.5) popwin:special-display-config)


(defun popup-todos () (interactive)
       (popwin:popup-buffer "TODOS.org" :width 0.5 :position 'left))


(server-start)



(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(defun ib-helm-grep () (interactive)
       (helm-do-grep-1 '("/home/jmonetta/IBProjects/") t nil '("*.java" "*.xml" "*.properties")))

(defun ib-rgrep (pattern) (interactive "sPattern:")
       (rgrep pattern "*.java *.xml *.properties" "/home/jmonetta/IBProjects/"))

(setq live-disable-zone t)


(defun ib-locate () (interactive)
  (helm-locate-with-db "/home/jmonetta/temp/ib-locatedb.db"))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))
