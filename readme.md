# dumb-repo-jump

Quickly open the buffer file in GitHub (ideally elsewhere too) using the name of the local branch, current remote url for the repository, and current line you are at.

![dumb-repo-jump-example](https://github.com/sponrad/dumb-repo-jump/blob/master/dumb-repo-jump.gif)

# Using it

Clone this repo and add something like the following lines to your `.emacs`:

```elisp
(load "~/projects/dumb-repo-jump/dumb-repo-jump.el")
(global-set-key (kbd "C-c j") 'dumb-git-repo-jump-to-line-at-point)
```

Open up a file that is inside a git repository and has a GitHub remote setup and use the keyboard shortcut to open that file right up in your browser.

# Caveats

- If the file youre in has changes that are not in the remote the file numbers won't match
- Doesn't work with ssh remotes yet
- Only tested with GitHub repo

# Inspired by!

[Dumb jump](https://github.com/jacktasia/dumb-jump), I love it and it's philosophy.
