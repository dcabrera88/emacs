;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; setup-org.el
;; Custom -> Setup Org
;; Everything org etc.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-org)

;; Recommended keybindings by the org manual
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)

;; Simple default note file
(setq org-directory "~/Org/")
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq org-agenda-files (directory-files-recursively org-directory ".org$"))

(defun org-add-refin ()
  (interactive)
  (let (refin)
    (setq refin (read-string "Enter value to append to REFIN property: "))
    (org-entry-add-to-multivalued-property (point) "REFIN" refin)))

(defun org-add-refout ()
  (interactive)
  (let (refout)
    (setq refout (read-string "Enter value to append to REFOUT property: "))
    (org-entry-add-to-multivalued-property (point) "REFOUT" refout)))

(defun org-add-date-update ()
  (interactive)
  (let (temptime)
    (with-temp-buffer
      (setq temptime (replace-regexp-in-string "[a-zA-Z ]+" "" (org-time-stamp-inactive)))
      )
    (org-entry-add-to-multivalued-property (point) "MODIFIED-DATE" temptime)
    )
  )

;; Add any org agenda file as a possible refile target
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))
