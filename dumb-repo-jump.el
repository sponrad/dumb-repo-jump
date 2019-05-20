(defun determine-remote ()
  "Dumbly determine the remote address to use, needs to work across
different common repository sites eventually, and needs to support
both http and ssh remote formats"
  ;; ssh: git@github.com:sponrad/sendrecurring.git
  ;; https: https://github.com/sponrad/sendrecurring
  (shell-command-to-string "git config --get remote.origin.url"))

(defun dumb-git-repo-jump-to-line-at-point ()
  "Dumbly open the remote vc version of the file in the buffer"
  (interactive)
  (let* ((branch (shell-command-to-string "git rev-parse --abbrev-ref HEAD"))
         (repo-file-path
          (shell-command-to-string
           (format "git ls-files --full-name %s" buffer-file-name)))
         (line-number (s-chop-prefix "Line " (what-line)))
         (url (format "%s/blob/%s/%s#L%s"
                      (determine-remote)
                      branch
                      repo-file-path
                      line-number
                      )))
    (message "Opening url: %s" url)
    (browse-url url)))
