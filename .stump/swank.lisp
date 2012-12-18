;;; Load swank first in case something doesn't work.
(load "/home/jmonetta/NonRepSoftware/quicklisp/dists/quicklisp/software/slime-20120909-cvs/swank-loader.lisp")
(swank-loader:init)

(defcommand swank (&optional port) ()
  (setf stumpwm:*top-level-error-action* :break)
  (swank:create-server :port (or port 4005)
                       :style swank:*communication-style*
                       :dont-close t)
  (message "Starting swank."))


