(in-package :stumpwm)

(defvar *caps-swapped* nil)

(defcommand toggle-caps () ()
  "Swaps caps locks key and ctrl key. For switching between HHKB and laptop keyboards"
    (if *caps-swapped*
	(progn 
	  (run-shell-command "/usr/bin/setxkbmap -option")
	  (setq *caps-swapped* nil))
	(progn 
	  (run-shell-command "/usr/bin/setxkbmap -option ctrl:swapcaps")
	  (setq *caps-swapped* t))))

(defvar *lang-swapped* nil)

(defcommand toggle-lang () ()
  "Swaps caps locks key and ctrl key. For switching between HHKB and laptop keyboards"
    (if *lang-swapped*
	(progn 
	  (run-shell-command "setxkbmap -layout us -variant altgr-intl -option nodeadkeys")
	  (setq *caps-swapped* nil))
	(progn 
	  (run-shell-command "setxkbmap -layout es")
	  (setq *caps-swapped* t))))


(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

;; (defmacro program-with-layout (name &key (command (string-downcase (string name)))
;;                                     (props `'(:class ,(string-capitalize command))))
;;   (with-gensyms (s w h files-path layout rules)
;;                 `(defc  3ommand ,name () ()
;;                    (let* ((,s (current-screen))
;;                           (,w (prin1-to-string (screen-width ,s)))
;;                           (,h (prin1-to-string (screen-height ,s)))
;;                           (,files-path "/home/jmonetta/stumpwm_files/")
;;                           (,layout (concat ,files-path ,command "-layout-" ,w "x" ,h))
;;                           (,rules (concat ,files-path ,command "-rules")))
;;                      (gnew ,command)
;;                      (restore-from-file ,layout)
;;                      (restore-window-placement-rules ,rules)
;;                      (run-or-raise ,command ,props)
;;                      (place-existing-windows))))) ; needed if command was already run

(defcommand code-review (revision) 
    ((:string "Revision Number : "))
  "Run meld against some ib carsdirect revision"
  (let ((diff-command (concatenate 'string
				   "svn diff http://svn.internetbrands.com/svn/rep/carsdirect/ --diff-cmd=meld -c "
				   revision
				   " &")))
    (run-shell-command diff-command)))

(defun get-heads-resolutions ()
  "Returns a list of pairs (head-width head-heght) for each monitor device
 connected"
(loop for x in (screen-heads (current-screen))
	      collect (list (head-width x) (head-height x))))

(defun make-monitors-resolutions-string ()
  (let ((monitors-resolutions (get-heads-resolutions))	 
	 (result ""))
    (dolist (monitor monitors-resolutions)
      (setq result (concatenate 'string
					 result
					 "-"
					 (write-to-string (first monitor))
					 "x"
					 (write-to-string (second monitor)))))
    result))
  
(defun load-group-layout (layout-name)
  (let ((layout-filename (concatenate 'string 
				      "/home/jmonetta/.stump/layouts-and-rules/"
				      layout-name
				      (make-monitors-resolutions-string))))
    (handler-case
	(restore-from-file layout-filename)
      (condition () (message (format nil "Couldn't load layout file : ~a" layout-filename))))))

(defun load-desktop-rules (rules-name)
  (let ((rules-filename (concatenate 'string 
				      "/home/jmonetta/.stump/layouts-and-rules/"
				      rules-name
				      (make-monitors-resolutions-string))))
    (handler-case
	(restore-window-placement-rules rules-filename)
      (condition () (message (format nil "Couldn't load placement rules file : ~a" rules-filename))))))


(defun create-terminal (profile command)
  (let ((term-cmd "gnome-terminal"))
    (when profile 
      (setq term-cmd (concatenate 'string term-cmd " --window-with-profile=" profile)))
    (when command
      (setq term-cmd (concatenate 'string term-cmd " -e '" command "'")))
    (gnew "terminals")
   (let* ((frame (slot-value (current-group) 'current-frame))
	 (current-group-frame-window (when frame (frame-window frame))))
      (when (not (null current-group-frame-window))
	(vsplit)
	(focus-last-frame (current-group))
	(balance-frames))
    (run-shell-command term-cmd))))


(ql:quickload "drakma")

(defun get-box-service-status (service-ping-url)
 (multiple-value-bind (body status)
     (handler-case 
	  (drakma:http-request service-ping-url :user-agent :explorer :method :get)
	(condition () nil))
  (equal status 200)))

(defvar *my-mutex* (sb-thread:make-mutex :name "ping mutex"))

(defvar *services-list* '(("N1" "http://new-car-services1.internetbrands.com/version.txt")
				 	    ("N2" "http://new-car-services2.internetbrands.com/version.txt")
				 	    ("N3" "http://new-car-services3.internetbrands.com/version.txt")
				 	    ("SN1" "http://stg-new-car-services1.internetbrands.com:8080/version.txt")
				 	    ("SN2" "http://stg-new-car-services2.internetbrands.com:8080/version.txt")
				 	    ("U1" "http://used-car-services1.internetbrands.com/version.txt")
				 	    ("U2" "http://used-car-services2.internetbrands.com/version.txt")
				 	    ("U3" "http://used-car-services3.internetbrands.com/version.txt")
				 	    ("SU1" "http://stg-used-car-services1.internetbrands.com:8080/version.txt")
				 	    ("SU2" "http://stg-used-car-services2.internetbrands.com:8080/version.txt")))

(defvar *services-status-cache* nil)
(defvar *services-status-cache-last-update* nil)

(defun get-bold-colored-string (string number)
  (concatenate 'string "^" number "*^B" string "^b^n"))
 
(defun get-services-status-string ()
  (when (or (null *services-status-cache*)
	     (> 
	      (get-universal-time) 
	      (+ *services-status-cache-last-update* 30)))
    (sb-thread:make-thread 
     (lambda ()
      (let ((result-string ""))
	(dolist (service *services-list*)
	  (let* ((mode-line-name (first service))
		 (ping-url (second service))
		 (service-status (get-box-service-status ping-url)))
	    (setq 
	     result-string 
	     (concatenate 'string 
			  result-string
			  "("
			  (if service-status
			      (get-bold-colored-string mode-line-name "2")
			      (get-bold-colored-string mode-line-name "1"))
			  ")"))))
	(sb-thread:with-mutex (*my-mutex*) 
	  (when (and result-string (not (string= result-string "")))
	  (setq *services-status-cache* result-string)
	  (setq *services-status-cache-last-update* (get-universal-time))))))))
    *services-status-cache*)
      
      
