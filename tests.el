(load-file "dumb-repo-jump.el")

(declare-function parse-remote "dumb-repo-jump.el")

(ert-deftest https-remote ()
  (should (string= "https://github.com/fakeuser/fakerepo"
                   (parse-remote "https://github.com/fakeuser/fakerepo"))))

(ert-deftest ssh-remote ()
  (should (string= "https://github.com/fakeuser/fakerepo"
                   (parse-remote "git@github.com:fakeuser/fakerepo.git"))))

(ert-deftest https-remote-trailing-git ()
  (should (string= "https://github.com/fakeuser/fakerepo"
                   (parse-remote "https://github.com/fakeuser/fakerepo"))))
