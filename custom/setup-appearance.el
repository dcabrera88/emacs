
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; setup-appearance.el
;; Custom -> Appearance
;; Modify the appearance of Emacs
;; Toolbars, line numbers, nyan cats, theme, highlights etc
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-appearance)

;; Remove superfluous thins in the editor
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show colum number and line numbers.
(column-number-mode 1)
(global-display-line-numbers-mode t)

;; Have lines truncated by default
(set-default 'truncate-lines t)

;; No need to blink the cursor it's mostly a distraction.
(blink-cursor-mode -1)

;; Nyan cat for Nyan-ness
(nyan-mode t)
(setq-default nyan-animate-nyancat t)
(setq-default nyan-wavy-trail t)
(nyan-start-animation)

;; Deeper blue theme
(load-theme 'deeper-blue)

;; Highlight the current line. Can be disabled by calling `M-x
;; hl-line-mode` in a particular buffer or globally by calling `M-x
;; global-hl-line-mode`
(global-hl-line-mode 1)

;;Highlight the matching parenthesis
(show-paren-mode 1)

;; Show matching parenthesis or delimiters in different colors
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlights the changes to the buffer caused by undo/yank and other
;; commands.  Provides nice visual feedback.
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; I like this font. Works well on a 32in 4k monitor.
(set-face-attribute 'default nil :height 115)
