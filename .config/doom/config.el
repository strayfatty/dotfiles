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

(setq display-line-numbers-type 'relative)

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

(tm:load-config "config_private.el")
