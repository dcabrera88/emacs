;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; setup-editing.el
;; Custom -> Setup Editing
;; Auto complete, modes, regex etc.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-editing)

;; Delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Never use tabs
(setq-default indent-tabs-mode nil)

(require 'anzu)
(global-anzu-mode 1)
;; Make it our default
(global-set-key [remap iquery-replace] 'anzu-query-replace)
(global-set-key [remap iquery-replace-regexp] 'anzu-query-replace-regexp)


;; Require yasnippet. Useful for inserting commonly used snippets of code
(require 'yasnippet)
(yas-global-mode 1)

;; drdt indent.
;; Smart indenting mode that tries to guess what's the corect indentation for given buffer
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; yaml mode
;; Load yaml mode for yaml files automatically
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; Some modifications for our breed of assembly code
(require 'asm-mode)
(add-hook 'asm-mode-hook (lambda()
			   (setq indent-tabs-mode nil) ; Use spaces to indent
			   (electric-indent-mode -1)
			   (setq tab-stop-list (number-sequence 4 10 4))))

;; Ivy as a better completion tool
(require 'ivy)

;; From oremacs.com/swiper/
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(require 're-builder)
(setq reb-re-syntax 'string)
