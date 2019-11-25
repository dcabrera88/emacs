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

;; Save bookmarks every time we modify them
(setq bookmark-save-flag 1)

;; Allow moving across windows
(global-set-key (kbd "<f8> a")  'windmove-left)
(global-set-key (kbd "<f8> d") 'windmove-right)
(global-set-key (kbd "<f8> w")    'windmove-up)
(global-set-key (kbd "<f8> s")  'windmove-down)
