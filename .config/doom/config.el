;; The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 500 1024 1024)) ;; 500mb

;;Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 5 1024 1024)) ;; 5mb

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections"
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(setq completion-ignore-case t)

(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-shades-of-purple)
;; (setq doom-theme 'doom-solarized-dark)

(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 14))

(setq display-line-numbers-type 'visual)

(when-let (dims (doom-store-get 'last-frame-size))
  (cl-destructuring-bind ((left . top) width height fullscreen) dims
    (setq initial-frame-alist
          (append initial-frame-alist
                  `((left . ,left)
                    (top . ,top)
                    (width . ,width)
                    (height . ,height)
                    (fullscreen . ,fullscreen))))))

(defun save-frame-dimensions ()
  (doom-store-put 'last-frame-size
                  (list (frame-position)
                        (frame-width)
                        (frame-height)
                        (frame-parameter nil 'fullscreen))))

(add-hook 'kill-emacs-hook #'save-frame-dimensions)

(setq prescient-history-length 0)
(setq prescient-filter-method '(anchored))
(setq ivy-prescient-enable-filtering t)
(setq ivy-prescient-enable-sorting t)

(setq org-directory "~/org/")
(setq org-archive-location "~/org/archive")

(after! org (setq org-capture-templates
      `(("t" "TODO" entry
         (file+headline "~/org/Refile.org" "Inbox")
         "* TODO %^{Brief description} %^g      \nAdded: %U  %i\n  %?\n"
         :clock-in t :clock-resume t))))

(setq org-log-done 'note)

(setq org-duration-format (quote h:mm))

(map! :leader
      (:prefix ("r" . "ripgrep")
       :desc "Project" "r" #'rg-project))

(setq lsp-auto-execute-action nil)

(setq lsp-javascript-preferences-import-module-specifier "non-relative")
(setq lsp-typescript-preferences-import-module-specifier "non-relative")

(vertico-posframe-mode 1)

(defun tm:open-eshell-at (path &optional name)
  "Open eshell at specified path"
  (interactive)
  (eshell '(4))
  (eshell-return-to-prompt)
  (insert (concat "cd " path))
  (eshell-send-input)
  (if name (rename-buffer name)))

(defun tm:load-config (file)
  "Load config file"
  (interactive)
  (setq path (expand-file-name file "~/.config/doom/"))
  (cond
   ((file-exists-p path)
    (load-file path))
   (t (message "Loading %s... not found" path))))

(defun tm:org-copy-cell-content ()
  "Copy cell content from org table"
  (interactive)
  (when (org-at-table-p)
    (kill-new
     (string-trim
      (substring-no-properties(org-table-get-field))))))

(after! company
  ;;; Prevent suggestions from being triggered automatically. In particular,
  ;;; this makes it so that:
  ;;; - TAB will always complete the current selection.
  ;;; - RET will only complete the current selection if the user has explicitly
  ;;;   interacted with Company.
  ;;; - SPC will never complete the current selection.
  ;;;
  ;;; Based on:
  ;;; - https://github.com/company-mode/company-mode/issues/530#issuecomment-226566961
  ;;; - https://emacs.stackexchange.com/a/13290/12534
  ;;; - http://stackoverflow.com/a/22863701/3538165
  ;;;
  ;;; See also:
  ;;; - https://emacs.stackexchange.com/a/24800/12534
  ;;; - https://emacs.stackexchange.com/q/27459/12534

  ;; <return> is for windowed Emacs; RET is for terminal Emacs
  (dolist (key '("<return>" "RET"))
    ;; Here we are using an advanced feature of define-key that lets
    ;; us pass an "extended menu item" instead of an interactive
    ;; function. Doing this allows RET to regain its usual
    ;; functionality when the user has not explicitly interacted with
    ;; Company.
    (define-key company-active-map (kbd key)
      `(menu-item nil company-complete
                  :filter ,(lambda (cmd)
                             (when (company-explicit-action-p)
                              cmd)))))
  ;; (define-key company-active-map (kbd "TAB") #'company-complete-selection)
  (map! :map company-active-map "TAB" #'company-complete-selection)
  (map! :map company-active-map "<tab>" #'company-complete-selection)
  (define-key company-active-map (kbd "SPC") nil)

  ;; Company appears to override the above keymap based on company-auto-complete-chars.
  ;; Turning it off ensures we have full control.
  (setq company-auto-commit-chars nil)
  )

(tm:load-config "config_private.el")
