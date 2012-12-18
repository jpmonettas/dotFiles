;; -*-lisp-*-
(in-package :stumpwm)

(setq *mode-line-border-color* "black")

(setf *colors* '("black"
"red"
"forestgreen"
"yellow"
"dodgerblue2"
"magenta"
"cyan"
"white"
"brown"
"grey60"))

(update-color-map (current-screen))

(set-win-bg-color "black") ; used for emacs and terminals

;; (set-unfocus-color "grey10")
(set-unfocus-color "grey30")
;; (set-unfocus-color "black")
;; (set-unfocus-color "gray25")

(set-fg-color "grey95")
;; (set-fg-color (make-color-hex "#8d7fb0")); 7e6eac
;; (set-fg-color "grey70")
;; (set-fg-color (random-elt '("cyan" "hotpink" "magenta" "grey70" "grey95" "dodgerblue" "purple")))
;;(set-fg-color "green")

(set-bg-color "grey13")
(set-border-color "grey10")
(set-msg-border-width 3)
(set-normal-gravity :center)

(setf *message-window-gravity* :center
      *timeout-wait* 3
      *input-window-gravity* :center
      *normal-border-width* 2
      *transient-border-width* 2
      *maxsize-border-width* 2
      *window-border-style* :tight ; thick, :thin, :tight
      )

(set-focus-color
 ;; "white"
 ;; "dimgrey"
 ;; "grey"
 ;; "dodgerblue"
 ;; "royalblue2"
 ;; "deep pink"
 ;; "yellow"
 ;; "red"
 ;; "gold"
 ;; "gold3"
 ;; "cyan"
 ;; "gray66"
 "MediumPurple3"
 ;; "magenta"
 
 ;; (make-color-hex "#876cbe")
 ;; (make-color-hex "#ae8451") ;; brown
 )

;; (set-any-color screen-float-focus-color "MediumPurple3")
;; (set-any-color screen-float-unfocus-color "grey10")

;; (setq *mode-line-border-color* "grey10")
(setq *mode-line-border-color* "grey13")

(setf
 ;; *mode-line-foreground-color* "cyan"
 ;; *mode-line-background-color* "darkcyan"
 ;; *mode-line-foreground-color* "magenta"
 ;; *mode-line-background-color* "darkmagenta"
 
 ;; *mode-line-foreground-color* "green"
 ;; *mode-line-background-color* "darkgreen"
 ;; *mode-line-border-color* "darkcyan"
 )

;; (setq *mode-line-border-color* "grey20"
;; *mode-line-foreground-color* "grey53"
;; *mode-line-background-color* "grey13")