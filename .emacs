
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(global-linum-mode t)
 '(inhibit-startup-screen nil)
 '(nyan-animate-nyancat t)
 '(nyan-mode t)
 '(nyan-wavy-trail t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages
   (quote
    (groovy-mode magit company-irony-c-headers s pyvenv find-file-in-project rainbow-delimiters json-mode jinja2-mode yasnippet-snippets dtrt-indent elpy yasnippet sr-speedbar nyan-mode ggtags company-c-headers cedit anzu)))
 '(require-final-newline nil)
 '(scroll-bar-mode nil)
 '(speedbar-query-confirmation-method (quote none-but-delete))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-auto-refresh nil)
 '(sr-speedbar-default-width 30)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil))

;; Auto load files whenever they have been modified outside emacs
(global-auto-revert-mode 1)

;; Delete trailing whitespace before saving
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Require ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'yasnippet)
(yas-global-mode 1)

(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Never use tabs
(setq-default indent-tabs-mode nil)

;; Set the default shell to be gitbash. Should add an if for only windows
(setq explicit-shell-file-name
      "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/Program Files/Git/bin")
(add-to-list 'exec-path "C:/Program Files/GnuGlobal/glo662wb/bin")
;; Prevent issues with the Windows null device (NUL)
;; when using git-bash find with rgrep.
(defadvice grep-compute-defaults (around grep-compute-defaults-advice-null-device)
  "Use gitbash /dev/null as the null-device."
  (let ((null-device "/dev/null"))
	ad-do-it))
(ad-activate 'grep-compute-defaults)

(defun change-shell-to-cmd ()
  "Changes the default shell to cmd.exe"
  (interactive)
  (setq explicit-shell-file-name "C:/Windows/System32/cmd.exe")
  (setq shell-file-name explicit-shell-file-name)
  (message "Shell is now cmd.exe"))

(defun change-shell-to-gitbash ()
  "Changes the default shell to git bash.exe"
  (interactive)
  (setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
  (setq shell-file-name explicit-shell-file-name)
  (message "Shell is now git bash.exe"))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;Set the backup directory somewhere other than the working directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )
(require 'asm-mode)
(add-hook 'asm-mode-hook (lambda()
                           (setq indent-tabs-mode nil) ;use spaces to indent
                           (electric-indent-mode -1)
                           (setq tab-stop-list (number-sequence 4 10 4))))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "firebrick"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "purple")))))
(put 'upcase-region 'disabled nil)
