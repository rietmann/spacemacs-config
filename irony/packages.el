;;; packages.el --- irony-private layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Max Rietmann <rietmann@wyoming>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `irony-private-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `irony-private/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `irony-private/pre-init-PACKAGEalmost certainly doing something wrong. Packages in Spacemacs should be loaded through auto-loading, and not explicitly by you. Calls to require in package init functions will cause a package to be loaded upon startup. Code in an :init block of use-package should not cause anything to be loaded, either. If you need a require in a :config block, that is a sign that some other package is missing appropriate auto-loads.' and/or
;;   `irony-private/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; taken from
;; https://github.com/nikki93/spacemacs-private/blob/master/irony-mode/packages.el


;; (defconst irony-private-packages
;;   '(irony
;;     company-irony
;;     flycheck-irony
;;     (auto-complete-clang :excluded t))
;;   "The list of Lisp packages required by the irony-private layer.

;; Each entry is either:

;; 1. A symbol, which is interpreted as a package to be installed, or

;; 2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
;;     name of the package to be installed or loaded, and KEYS are
;;     any number of keyword-value-pairs.

;;     The following keys are accepted:

;;     - :excluded (t or nil): Prevent the package from being loaded
;; (setq irony-mode-excluded-packages
;;   '(auto-complete-clang))
;;       if value is non-nil

;;     - :location: Specify a custom installation location.
;;       The following values are legal:

;;       - The symbol `elpa' (default) means PACKAGE will be
;;         installed using the Emacs package manager.

;;       - The symbol `local' directs Spacemacs to load the file at
;;         `./local/PACKAGE/PACKAGE.el'

;;       - A list beginning with the symbol `recipe' is a melpa
;;         recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(setq irony-packages
      '(
        company-irony
        company-irony-c-headers
        irony
        irony-eldoc
        flycheck-irony))

(defun irony/init-irony ()
  (use-package irony
    :defer t
    ;; :commands (irony-mode irony-install-server)
    :init
    (progn
      (add-hook 'c-mode-hook 'irony-mode)
      (add-hook 'c++-mode-hook 'irony-mode))
    :config
    (progn
      (defun irony/irony-mode-hook ()
        (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
        (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async))

      (add-hook 'irony-mode-hook 'irony/irony-mode-hook)
      (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
      (spacemacs|diminish irony-mode " Ⓘ" " I"))))


(when (configuration-layer/layer-usedp 'auto-completion)
  (defun irony/init-company-irony ()
    (use-package company-irony
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :commands company-irony
      :init
      (progn
        (push 'company-irony company-backends-c-mode-common)
        (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)))))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun irony/init-company-irony-c-headers ()
    (use-package company-irony-c-headers
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :commands company-irony-c-headers
      :init
      (push 'company-irony-c-headers company-backends-c-mode-common))))

(when (configuration-layer/layer-usedp 'syntax-checking)
  (defun irony/init-flycheck-irony ()
    (use-package flycheck-irony
      :if (configuration-layer/package-usedp 'flycheck)
      :defer t
      :init (add-hook 'irony-mode-hook 'flycheck-irony-setup))))

(defun irony/init-irony-eldoc ()
  (use-package irony-eldoc
    :commands (irony-eldoc)
    :init
    (add-hook 'irony-mode-hook 'irony-eldoc)))

;; (setq irony-mode-packages
;;   '(irony
;;     company-irony
;;     flycheck-irony))

;; (setq irony-mode-excluded-packages
;;   '(auto-complete-clang))

;; (defun irony-private/init-irony ()
;;   (use-package irony
;;     :defer t
;;     :init
;;     (progn
;;       (add-hook 'c++-mode-hook 'irony-mode)
;;       (add-hook 'c++-mode-hook (lambda ()
;;                                  (irony-mode)
;;                                  (push 'company-irony company-backends-c-mode-common)
;;       ;;                            (when (boundp 'company-backends)
;;       ;;                              (make-local-variable 'company-backends)
;;       ;;                              (setq company-backends (delete 'company-dabbrev company-backends))
;;       ;;                              (setq company-backends (delete 'company-dabbrev-code company-backends))
;;       ;;                              )                                 
;;                                  ))
;;       (add-hook 'c-mode-hook 'irony-mode)
;;       (add-hook 'objc-mode-hook 'irony-mode)
;;       (add-hook 'irony-mode-hook
;;                 (lambda ()
;;                   (define-key irony-mode-map [remap completion-at-point]
;;                     'irony-completion-at-point-async)
;;                   (define-key irony-mode-map [remap complete-symbol]
;;                     'irony-completion-at-point-async)))
;;       (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;       (spacemacs|diminish irony-mode " Ⓘ" " I"))))

;; (defun irony-private/init-company-irony ()
;;   (use-package company-irony
;;     :defer t
;;     :init
;;     (progn
;;       (eval-after-load 'company
;;         (lambda ()
;;           (add-to-list 'company-backends 'company-irony)
;;           ;; (setq company-backends (delete 'company-dabbrev company-backends))
;;           ;; (setq company-backends (delete 'company-dabbrev-code company-backends))
;;           (setq company-idle-delay t)
;;           )
;;         )
;;       (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;;       (add-hook 'irony-mode-hook 'company-mode))))

;; (defun irony-private/init-flycheck-irony ()
;;   (use-package flycheck-irony
;;     ;; :defer t                            ; fix this ???
;;     :init
;;     (progn
;;       (eval-after-load 'flycheck
;;         '(add-to-list 'flycheck-checkers 'irony))
;;       (add-hook 'irony-mode-hook 'flycheck-mode))))


;;; packages.el ends here
