;; very partially adapted from: https://github.com/ausimian/spacemacs-cmake-ide

(setq rtags-packages
  '(rtags))

(defun rtags/init-rtags ()
  (use-package rtags
    :defer t
    :init
    (progn
      (message "init rtags")
      (require 'rtags)
      ;; (require 'rtags-helm)
      ;; (setq rtags-use-helm t)
      (define-key c++-mode-map (kbd "M-n") 'rtags-next-match)
      (define-key c++-mode-map (kbd "M-p") 'rtags-previous-match)
      ;; (define-key c-mode-map (kbd "M-n") 'rtags-next-match)
      ;; (define-key c-mode-map (kbd "M-p") 'rtags-previous-match)
      ;; find way to change this
      (define-key c++-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
      (define-key c-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
      (define-key c++-mode-map (kbd "M-[") 'rtags-location-stack-back)
      (define-key c++-mode-map (kbd "M-]") 'rtags-location-stack-back)
      (define-key c++-mode-map (kbd "M-,") 'rtags-find-references-at-point)
      (define-key c-mode-map (kbd "M-,") 'rtags-find-references-at-point)
      ;; (add-hook 'c-mode-hook 'rtags-mode)
      ;; (add-hook 'c++-mode-hook 'rtags-mode)
      )
    :config
    (progn
      (message "config rtags")      
      )
    )
  )
