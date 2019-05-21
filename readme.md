# dumb-repo-jump

Quickly open the buffer file in GitHub (ideally elsewhere too). Dumb repo jump takes you to the same branch, file, and line as the one in your buffer.

![dumb-repo-jump-example](https://github.com/sponrad/dumb-repo-jump/blob/master/dumb-repo-jump.gif)

## Using it

Clone this repo and add something like the following lines to your `.emacs`:

```elisp
(load "dumb-repo-jump.el")
(global-set-key (kbd "C-c j") 'dumb-git-repo-jump-to-line-at-point)
```

Open up a file that is inside a git repository and has a GitHub remote setup and use the keyboard shortcut to open that file right up in your browser.

## Caveats

- If the file youre in has changes that are not in the remote the file numbers won't match
- Only tested with GitHub repo

## Inspired by!

[Dumb jump](https://github.com/jacktasia/dumb-jump), I love it and it's philosophy.
