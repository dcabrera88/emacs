;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; setup-windows-environment.el
;; Custom -> Setup Windos Environment Variables
;; Windows specific fixes and paths.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-windows-environment)

;; Set the default shell to be gitbash. Should add an if for only windows
(setq explicit-shell-file-name (getenv "GIT_BASH"))
(setq shell-file-name explicit-shell-file-name)
;; Environment variable pointing to the path of GIT_BASH and GNU_GLOBAL
(add-to-list 'exec-path (getenv "GIT_BASH_PATH"))
(add-to-list 'exec-path (getenv "GNU_GLOBAL"))
;; Prevent issues with the Windows null device (NUL)
;; when using git-bash find with rgrep.
(defadvice grep-compute-defaults (around grep-compute-defaults-advice-null-device)
  "Use gitbash /dev/null as the null-device."
  (let ((null-device "/dev/null"))
	ad-do-it))
(ad-activate 'grep-compute-defaults)

;; Have a function to open a cmd.exe shell in a different buffer.
(defun open-shell-cmd (name)
  "Open a shell using the windows cmd.exe"
  (interactive "MName of the cmd shell to create: ")
  (setq explicit-shell-file-name (getenv "ComSpec"))
  (setq sehll-file-name explicit-shell-file-name)
  (pop-to-buffer (get-buffer-create (generate-new-buffer-name name)))
  (shell (current-buffer))
  (setq explicit-shell-file-name (getenv "GIT_BASH"))
  (setq shell-file-name explicit-shell-file-name))

;; If we need to change the shell to cmd.exe let's add a function for that
(defun change-shell-to-cmd ()
  "Changes de emacs shell to cmd.exe"
  (interactive)
  (setq explicit-shell-file-name (getenv "ComSpec"))
  (setq shell-file-name explicit-shell-file-name)
  (message "Shell is now git cmd.exe"))

;; If we need to change the shell to bash.exe let's add a function for that
(defun change-shell-to-gitbash ()
  "Changes de emacs shell to git bash.exe"
  (interactive)
  (setq explicit-shell-file-name (getenv "GIT_BASH"))
  (setq shell-file-name explicit-shell-file-name)
  (message "Shell is now git bash.exe"))

;; What's the current shell name
(defun current-shell-command()
  "Prints the currenth shell in use"
  (interactive)
  (message shell-file-name))
