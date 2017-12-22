;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     windows-scripts
     ruby
     php
     better-defaults
     html
     javascript
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     ivy
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     (markdown
      :variables
      markdown-command "pandoc -c /home/rietmann/.emacs.d/private/markdown_css/github-pandoc.css --from markdown_github -t html5 --mathjax --highlight-style pygments --standalone"
      )
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     
     ;; version-control
     (version-control :variables
                      version-control-diff-tool 'git-gutter+)
     
     docker
     ;; themes-megapack
     ;; -- language support
     ;; gtags ;; tags for c/c++ and other langs
     ;; irony

     ;; (ycmd :variables
     ;;       ycmd-server-command (list "/usr/bin/python" (file-truename "~/build/ycmd-git/ycmd"))
     ;;       ycmd-force-semantic-completion t)

     rtags


     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            ;; c-c++-enable-clang-support t
            )     
     latex
     (python
      )
     (rust :variables
           rust-enable-format-on-save t)
     markdown
     ess
     (haskell :variables
              haskell-completion-backend 'intero
     ;;          ;; haskell-enable-ghc-mod-support nil
     ;;          ;; haskell-enable-ghci-ng-support t
     ;;          ;; haskell-process-type 'stack-ghci
     ;;          ;; haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--with-ghc=intero")
              )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      flycheck-mypy
                                      flycheck-clang-tidy
                                      flycheck-clang-analyzer
                                      dracula-theme
                                      groovy-mode
                                      lsp-mode
                                      company-lsp
                                      ;; focus-autosave-mode
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         dracula
                         sanityinc-solarized-dark
                         sanityinc-solarized-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.45)
   ;; dotspacemacs-default-font '("Inconsolata"
   ;;                             :size 16
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.45)
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (push "/usr/local/share/emacs/site-lisp/rtags/" load-path)
  ;; Bind clang-format-region to C-M-tab in all modes:
  (global-set-key [C-M-tab] 'clang-format-region)
  ;; Bind clang-format-buffer to tab on the c++-mode only:
  (add-hook 'c++-mode-hook 'clang-format-bindings)
  (defun clang-format-bindings ()
    (define-key c++-mode-map [C-M-iso-lefttab] 'clang-format-buffer))
  (defvar c++-clang-format-on-save nil
    "Should emacs do clang-format on save?")
  ;; Hook function
  ;; might be interesting... http://www.josephlisee.com/2015/02/21/exploring-clang-format/
  (defun clang-format-before-save ()
    "Add this to .emacs to clang-format on save (add-hook 'before-save-hook 'clang-format-before-save)."
    
    (interactive)
    (when (and c++-clang-format-on-save (not (and (eq major-mode 'c++-mode) (string= (file-name-extension (buffer-file-name)) "in"))))
    ;; (when (and (eq major-mode 'c++-mode) (string= (file-name-extension (buffer-file-name)) "in"))
      (message "Running clang format!")
      (clang-format-buffer)
      ))
  
  ;; ;; Install hook to use clang-format on save
  (add-hook 'before-save-hook 'clang-format-before-save)

  
  

  ;; )
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (windmove-default-keybindings)
  (require 'flycheck-mypy)
  
  ;; (setq shell-file-name "/bin/bash")
  ;; paradox token
  (setq paradox-github-token "069f120e6a174c4fe45de2f9821f2f016c7bda04")
  ;; Scrolling
  ;; (setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
  ;; (setq mouse-wheel-progressive-speed nil)
  (setq mac-option-modifier 'meta) ; set alt-key to meta
  (setq mac-escape-modifier nil) ; set esc-key to nil
  (setq-default spacemacs-show-trailing-whitespace nil)
  (global-hl-line-mode -1)
  (setq-default evil-emacs-state-cursor 'bar)
  (setq-default cursor-type 'bar)
  (setq powerline-default-separator 'slant)
  (setq diff-hl-side 'right)
  ;; ivy settings
  ;; Use Enter on a directory to navigate into the directory, not open it with dired.
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)

  (define-key prog-mode-map (kbd "C-;") 'comment-line)
  ;; saves on window leave or buffer switch
  ;; https://github.com/syl20bnr/spacemacs/issues/2376
  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
  (defadvice switch-to-buffer (before save-buffer-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice other-window (before other-window-now activate)
    (when buffer-file-name (save-buffer)))

  (add-hook 'flyspell-mode-hook
            (lambda () 
              (local-unset-key (kbd "C-;"))
              (define-key flyspell-mode-map (kbd "C-;") 'comment-line)
              ))
  ;; mypy and flake8 with pyenv
  (add-hook 'anaconda-mode-hook
            (lambda ()
              (message "Updating local flake8 and mypy executables")
              (setq flycheck-python-flake8-executable (replace-regexp-in-string "\n\\'" "" (shell-command-to-string "pyenv which flake8")))
              (setq flycheck-python-mypy-executable (replace-regexp-in-string "\n\\'" "" (shell-command-to-string "pyenv which mypy")))
              ;; flake8 is exclusive, so we have to force the mypy checker to run
              (flycheck-add-next-checker 'python-flake8 'python-mypy)
              ;; (add-to-list 'python-shell-extra-pythonpaths "/opt/ros/kinetic/lib/python2.7/dist-packages")
              ))

  ;; cquery
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
    )
  (add-hook 'c-mode-common-hook (lambda ()
                                  ;; (message "setting f5 to compile")
                                  (lsp-cquery-enable)
                                  ))

  (with-eval-after-load 'company
    (push 'company-lsp company-backends)
    )

  (with-eval-after-load 'lsp-mode
    (require 'lsp-flycheck))

  ;; toggle line numbers when emacs is in focus or not
  ;; (add-hook 'focus-out-hook
  ;;           (lambda ()
  ;;             (spacemacs/toggle-line-numbers-on)))
  ;; (add-hook 'focus-in-hook
  ;;           (lambda ()
  ;;             (spacemacs/toggle-line-numbers-off)))
  
  ;; fancier flycheck setup for C++
  ;; (with-eval-after-load 'flycheck
  ;;   (require 'flycheck-clang-tidy)
  ;;   (add-hook 'flyspell-mode-hook #'flycheck-clang-tidy-setup)
  ;;   (setq flycheck-clang-tidy-executable "/usr/bin/clang-tidy-5.0")
  ;;   )

  ;; (use-package flycheck-clang-tidy
  ;;   :ensure t
  ;;   :after flycheck
  ;;   :config (lambda()
  ;;             (setq flycheck-clang-tidy-executable "/usr/bin/clang-tidy-5.0")
  ;;             (flycheck-clang-tidy-setup)
  ;;             )
  ;;   )

  

  ;; (use-package flycheck-clang-analyzer
  ;;   :ensure t
  ;;   :after flycheck
  ;;   :config (lambda()
  ;;             (setq flycheck-clang-analyzer-executable "/usr/bin/clang-5.0")
  ;;             (flycheck-clang-analyzer-setup)
  ;;             ))

  ;; (with-eval-after-load 'flycheck
  ;;   (require 'flycheck-clang-analyzer)
  ;;   (require 'flycheck-clang-tidy)
  ;;   (flycheck-add-next-checker 'rtags 'clang-analyzer)
  ;;   (flycheck-add-next-checker 'rtags 'clang-tidy)
  ;;   )

  ;; (defun my-flycheck-rtags-setup ()
  ;;   (flycheck-select-checker 'rtags)
  ;;   (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  ;;   (setq-local flycheck-check-syntax-automatically nil))
  ;; (add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
  ;; (add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)

  
  
  (add-hook 'c-mode-common-hook (lambda ()
                                  ;; (message "setting f5 to compile")
                                  (global-set-key (kbd "<f5>") 'compile)
                                  ))
  
  (add-hook 'markdown-mode-hook (lambda ()
                                  (message "changing M-<left> and M-<right>")
                                  (define-key orgtbl-mode-map (kbd "M-<left>") 'left-word)
                                  (define-key orgtbl-mode-map (kbd "M-<right>") 'right-word)
                                  (define-key orgtbl-mode-map (kbd "C-<left>") 'orgtbl-hijacker-command-2)
                                  (define-key orgtbl-mode-map (kbd "C-<right>") 'orgtbl-hijacker-command-3)
                                  (visual-line-mode)
                                  ))

  ;; Haskell customizations ------------  
  ;; fixes hlint to work with intero
  (with-eval-after-load 'intero
    (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))

  ;; gets rid of warning on blank lines
  (defadvice eldoc-intero-maybe-print (around eldoc-intero-maybe-print-around activate)
    "https://github.com/commercialhaskell/intero/issues/277"
    (unless (string-match
             "^ <no location info>: \\(error: \\)?not an expression: \\(\u2018\u2019\\|\xE2\x80\x98\xE2\x80\x99\\|\x91\x92\\)$"
             (ad-get-arg 0))
      ad-do-it))
  
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default)))
 '(package-selected-packages
   (quote
    (company-lsp lsp-mode racer flycheck-rust seq cargo rust-mode flycheck-clang-analyzer flycheck-clang-tidy ivy-rtags org-category-capture iedit groovy-mode powerline flycheck-haskell let-alist undo-tree diminish highlight async f s dracula-theme winum unfill fuzzy auctex-latexmk flycheck-mypy insert-shebang fish-mode company-shell helm helm-core packed smartparens evil avy projectile hydra dash powershell rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby focus-autosave-mode org-projectile org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot dockerfile-mode docker tablist docker-tramp phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode toml-mode flycheck-ycmd company-ycmd ycmd request-deferred deferred helm-pydoc helm-hoogle helm-gitignore helm-css-scss helm-company helm-c-yasnippet flyspell-correct-helm org markdown-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode haml-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flycheck magit magit-popup git-commit with-editor ctable ess julia-mode counsel swiper ivy web-completion-data dash-functional tern irony ghc haskell-mode company yasnippet auctex anaconda-mode pythonic auto-complete helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag ace-jump-helm-line yapfify yaml-mode ws-butler window-numbering which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spacemacs-theme spaceline smex smeargle slim-mode scss-mode sass-mode rtags restart-emacs request rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-plus-contrib org-bullets open-junk-file neotree mwim move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc ivy-hydra irony-eldoc intero info+ indent-guide ido-vertical-mode hy-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-make haskell-snippets google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flyspell-correct-ivy flycheck-pos-tip flycheck-irony flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-object-popup ess-R-data-view emmet-mode elisp-slime-nav dumb-jump disaster diff-hl define-word cython-mode counsel-projectile company-web company-tern company-statistics company-irony-c-headers company-irony company-ghci company-ghc company-cabal company-c-headers company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-solarized coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ac-ispell)))
 '(paradox-automatically-star t)
 '(safe-local-variable-values
   (quote
    ((eval c-set-offset
           (quote access-label)
           -2)
     (eval c-set-offset
           (quote access-label)
           2)
     (eval c-set-offset
           (quote access-label)
           ++)
     (eval c-set-offset
           (quote innamespace)
           0)
     (c-set-offset innamespace .
                   [0])
     (c-set-offset
      (quote innamespace)
      [0])
     (c-set-offset
      (quote innamespace)
      0)
     (c-default-style . "bsd")
     (c++-clang-format-on-save . t)
     (c-default-style . "linux")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
