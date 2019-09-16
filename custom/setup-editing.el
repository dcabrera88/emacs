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
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap-query-replace-regexp] 'anzu-query-replace-regexp)


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

(require 'ido)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer ' always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method ' selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)


(ido-everywhere +1)
(flx-ido-mode +1)
(setq ido-use-faces nil)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-x") ' smex-major-mode-commands)

(require 're-builder)
(setq reb-re-syntax 'string)
