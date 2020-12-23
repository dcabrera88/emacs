;; Add and enable MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Add the modules path
;; This is the location where we will put all of our actual configuration files
(add-to-list 'load-path "~/.emacs.d/custom/")

;; This is the location where we will put all of our computer dependent settings
;; i.e. work computer might have some folders that I don't want to publish
;; to github.
(add-to-list 'load-path "~/emacs-local/")

(defconst *is-windows* (eq system-type 'windows-nt))

;; Computer specific setup
(require 'setup-local)

;; Common setup
(require 'setup-appearance)
(require 'setup-general)
(require 'setup-ggtags)
(require 'setup-editing)
(require 'setup-org)

;; OS specific setup
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
    (org-jira tramp flycheck py-autopep8 elpy groovy-mode unfill company csharp-mode counsel counsel-gtags ivy markdown-mode markdown-mode+ markdown-toc anzu dtrt-indent ggtags rainbow-delimiters yaml-mode magit nyan-mode volatile-highlights yasnippet)))
 '(show-paren-mode t))
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "magenta"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "HotPink1"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep sky blue"))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit rainbow-delimiters-base-face :foreground "firebrick1")))))
(put 'upcase-region 'disabled nil)
