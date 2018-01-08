(setq cquery-packages
      '(lsp-mode
        cl-lib
        subr-x
        company-lsp
        ))

(defun cquery/init-lsp-mode ()
  (use-package lsp-mode
    :defer t
    :init
    (progn
      (with-eval-after-load 'lsp-mode
        (require 'lsp-flycheck))
      )
    )

  (use-package cquery
    :load-path
    "/home/rietmann/build/cquery/emacs"
    :init
    (progn
      (require 'cc-mode)
      (require 'lsp-mode)
      (require 'cl-lib)
      (require 'subr-x))
    :config
    ;; config
    (setq cquery-executable "/home/rietmann/.local/stow/cquery/bin/cquery")
    (add-hook 'c-mode-common-hook (lambda ()
                                    (message "enable lsp for c++")
                                    (lsp-cquery-enable)
                                    ))
    )
  )

(defun cquery/init-company-lsp ()
  (message "adding company-lsp to c-mode-common backends")
  (use-package company-lsp
    :defer t
    :init (push 'company-lsp company-backends-c-mode-common))
  )
