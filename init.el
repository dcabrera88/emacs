;; Add and enable MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Add the modules path
;; This is the location where we will put all of our actual configuration files
(add-to-list 'load-path "~/.emacs.d/custom/")

(defconst *is-windows* (eq system-type 'windows-nt))

;; load the modules
(require 'setup-appearance)
(require 'setup-general)
(require 'setup-ggtags)
(require 'setup-editing)

(when *is-windows*
  (require 'setup-windows-environment))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (counsel counsel-gtags ivy markdown-mode markdown-mode+ markdown-toc anzu dtrt-indent ggtags rainbow-delimiters yaml-mode magit nyan-mode volatile-highlights yasnippet)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
