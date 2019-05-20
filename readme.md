# dumb-repo-jump

Quickly open the buffer file in GitHub (ideally elsewhere to) using the name of the local branch, current remote url for the repository, and current line you are at.

# Using it

Clone this repo and add something like the following lines to your `.emacs`:

```elisp
(load "~/projects/dumb-repo-jump/dumb-repo-jump.el")
(global-set-key (kbd "C-c j") 'dumb-git-repo-jump-to-line-at-point)
```

Open up a file that is inside a git repository and has a GitHub remote setup and use the keyboard shortcut to open that file right up in your browser.
