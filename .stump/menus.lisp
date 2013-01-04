(defparameter *start-menu*
  '(("Gimp" "gimp")
    ("Volume ALSA" "gnome-terminal -e alsamixer")
    ("Volume Pulseaudio" "pavucontrol")
    ("Chrome" "google-chrome")
    ("Iceweasel" "iceweasel")
    ("K3b Burner" "k3b")
    ("Brasero Burner" "brasero")
    ("Wicd Client" "wicd-client")
    ("Calculator" "xcalc")
    ("File Manager" "nautilus")
    ("Nvidia Settings" "nvidia-settings")
    ("Terminal Server" "tsclient")))


(defcommand menu () ()
	    "docstring"
	    (labels ((pick (options)
		       (let ((selection (stumpwm::select-from-menu
					 (current-screen) options "")))
			 (cond
			   ((null selection)
			    (throw 'stumpwm::error "Abort."))
			   ((stringp (second selection))
			    (second selection))
			   (t
			    (pick (cdr selection)))))))
	      (let ((choice (pick *start-menu*)))
		       (run-shell-command choice))))


(defparameter *terminals-menu*
  '(
    ("gargola" "infuy-server" "ssh -l dolphin 192.168.1.4")

    ("mavenbox" "ib-staging" "ssh -l jmonetta maven.internetbrands.com")

     ("myVM" "ib-dev" "ssh -l jmonetta 172.16.132.89")

     ("dev 1" "ib-staging" "ssh -l jmonetta devapp1.internetbrands.com")
     ("dev 2" "ib-staging" "ssh -l jmonetta devapp2.internetbrands.com")
     ("dev 3" "ib-staging" "ssh -l jmonetta devapp3.internetbrands.com")
     ("dev 4" "ib-staging" "ssh -l jmonetta devapp4.internetbrands.com")
     ("dev 5" "ib-staging" "ssh -l jmonetta devapp5.internetbrands.com")
     ("dev 6" "ib-staging" "ssh -l jmonetta devapp6.internetbrands.com")

     ("bauxite1(1-1)" "ib-production" "ssh -l qa bauxite1-1.internetbrands.com")
     ("bauxite1(1-2)" "ib-production" "ssh -l qa bauxite1-2.internetbrands.com")
     ("bauxite1(2-1)" "ib-production" "ssh -l qa bauxite2-1.internetbrands.com")
     ("bauxite1(2-2)" "ib-production" "ssh -l qa bauxite2-2.internetbrands.com")

     ("eqsoa1-1(savant)" "ib-production" "ssh -l jmonetta eqsoa1-1.internetbrands.com")
     ("eqsoa2-1(savant)" "ib-production" "ssh -l jmonetta eqsoa2-1.internetbrands.com")
     ("eqsoa3-1(savant)" "ib-production" "ssh -l jmonetta eqsoa3-1.internetbrands.com")
     ("eqsoa4-1(savant)" "ib-production" "ssh -l jmonetta eqsoa4-1.internetbrands.com")
     ("eqsoa5-1(savant)" "ib-production" "ssh -l jmonetta eqsoa5-1.internetbrands.com")
     ("eqsoa6-1(savant)" "ib-production" "ssh -l jmonetta eqsoa6-1.internetbrands.com")
     ("eqsoa7-1(savant)" "ib-production" "ssh -l jmonetta eqsoa7-1.internetbrands.com")

     ("stg-soa1(savant)" "ib-staging" "ssh -l qa stg-soa1.internetbrands.com")

     ("new-car-services1" "ib-production" "ssh -l jmonetta new-car-services1.internetbrands.com")
     ("new-car-services2" "ib-production" "ssh -l jmonetta new-car-services2.internetbrands.com")
     ("new-car-services3" "ib-production" "ssh -l jmonetta new-car-services3.internetbrands.com")
     ("stg-new-car-services1" "ib-staging" "ssh -l jmonetta stg-new-car-services1.internetbrands.com")
     ("stg-new-car-services2" "ib-staging" "ssh -l jmonetta stg-new-car-services2.internetbrands.com")

     ("used-car-services1" "ib-production" "ssh -l jmonetta used-car-services1.internetbrands.com")
     ("used-car-services2" "ib-production" "ssh -l jmonetta used-car-services2.internetbrands.com")
     ("stg-used-car-services1" "ib-staging" "ssh -l jmonetta used-car-services1.internetbrands.com")
     ("stg-used-car-services2" "ib-staging" "ssh -l jmonetta used-car-services2.internetbrands.com")

     ("eqtools" "ib-production" "ssh -l qa eqtools.internetbrands.com")

     ("eqapp6-1(autos)" "ib-production" "ssh -l qa eqapp6-1.internetbrands.com")
     ("eqapp6-2(autos)" "ib-production" "ssh -l qa eqapp6-2.internetbrands.com")
     ("stg-app11-1(autos)" "ib-staging" "ssh -l qa stg-app11-1.internetbrands.com")
     ("stg-app-11-2(autos)" "ib-staging" "ssh -l qa stg-app11-2.internetbrands.com")

     ("eqapp7-1(pricing)" "ib-production" "ssh -l qa eqapp7-1.internetbrands.com")
     ("stg-app10-1(pricing)" "ib-staging" "ssh -l qa stg-app10-1.internetbrands.com")

     ("eqapp7-2(bo-configurator)" "ib-production" "ssh -l qa eqapp7-2.internetbrands.com")
     ("stg-app11-3(bo-configurator)" "ib-staging" "ssh -l qa stg-app11-3.internetbrands.com")))


(defcommand terminals-menu () ()
	    "docstring"
	    (labels ((pick (options)
		       (let ((selection (stumpwm::select-from-menu
					 (current-screen) options "")))
			 (cond
			   ((null selection)
			    (throw 'stumpwm::error "Abort."))
			   ((stringp (second selection))
			    (rest selection))))))
	      (let ((choice (pick *terminals-menu*)))
		       (create-terminal (first choice) (second choice)))))

(defparameter *sync-menu*
  '(("Automotive Services" "automotive-services" "/home/jmonetta/proyectos")
    ("Usedcar Services" "usedcar-services" "/home/jmonetta/proyectos/")
    ("Model" "model" "/home/jmonetta/proyectos/")
    ("Dao" "dao" "/home/jmonetta/proyectos/")
    ("Util" "util" "/home/jmonetta/proyectos/")))

(defcommand sync-menu () ()
  "docstring"
  (labels ((pick (options)
	     (let ((selection (stumpwm::select-from-menu
			       (current-screen) options "")))
	       (cond
		 ((null selection)
		  (throw 'stumpwm::error "Abort."))
		 ((stringp (second selection))
		  (rest selection))))))
    (let ((choice (pick *sync-menu*)))
      (let ((command (concatenate 'string
				  "/home/jmonetta/bin/stump-syn.sh "
				  (first choice)
				  " "
				  (second choice))))
	(sb-thread:make-thread 
	 (lambda () 
	   (message-no-timeout
	    (run-shell-command command t))))))))
