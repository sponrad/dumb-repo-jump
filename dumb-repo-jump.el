(defun parse-remote (git-origin-url)
  "return https remote url or turn ssh remote into https url eg
git@github.com:user/repo.git into https://github.com/user/repo"
  (if (string-match "\\(\\w+\\.com\\)\\:\\(\\w+\\/\\w+\\)\\.git" git-origin-url)
      (let* ((site-url (match-string 1 git-origin-url))
             (owner-repo (match-string 2 git-origin-url)))
        (message "we are in the git side of things...")
        (format "https://%s/%s" site-url owner-repo))
    (replace-regexp-in-string "\\.git$" "" git-origin-url)))

(defun dumb-git-repo-jump-to-line-at-point ()
  "Dumbly open the remote vc version of the file in the buffer"
  (interactive)
  (let* ((remote-url (parse-remote (shell-command-to-string
                                    "git config --get remote.origin.url")))
         (branch (shell-command-to-string "git rev-parse --abbrev-ref HEAD"))
         (repo-file-path (shell-command-to-string
                          (format "git ls-files --full-name %s"
                                  buffer-file-name)))
         (line-number (replace-regexp-in-string "^Line " "" (what-line)))
         (url (format "%s/blob/%s/%s#L%s"
                      remote-url
                      branch
                      repo-file-path
                      line-number)))
    (message "Opening url: %s" url)
    (browse-url url)))
