;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; setup-general.el
;; Custom -> Setup General
;; Miscelaneous things that don't really fit anywhere else
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-general)

;; Auto load files whenever they have been modified outside emacs
(global-auto-revert-mode 1)

;; Required for using emacs as an editor for git
(server-start)

;; We don't need to see the startup every time.
(setq inhibit-startup-screen t)
