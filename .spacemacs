;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
   '(nginx
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
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     (auto-completion
      ;; :variables
      ;; spacemacs-default-company-backends '(company-lsp)
      )
     ;; ocaml
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

     (julia :variables
            julia-mode-enable-ess t
            ;; julia-mode-enable-lsp t
            )

     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-adopt-subprojects t
            c-c++-backend 'lsp-ccls
            c-c++-lsp-executable (file-truename "~/.local/bin/ccls")
            ;; c-c++-enable-clang-support t
            ;; c-c++-enable-rtags-support t
            )     
     ;; rtags

     (lsp :variables
          lsp-ui-remap-xref-keybindings t
          lsp-ui-sideline-enable nil
          )
     ;; myjulia
     ;; cquery
     ;; ccls
     ;; reason

     racket
     
     unicode-fonts
     cmake
     latex
     (python
      :variables
      python-backend 'lsp
      ;; python-backedn 'anaconda
      )

     ipython-notebook
     typescript

     (rust :variables
           rust-enable-format-on-save t)
     markdown
     ess
     treemacs
     ;; spotify
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
                                      super-save
                                      ;; cuda-mode
                                      ;; focus-autosave-mode
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    evil-escape
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one
                         doom-one-light
                         ;; spacemacs-dark
                         ;; spacemacs-light
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
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

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
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

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

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
  )
(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included
in the dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; (use-package cuda-mode
  ;;   :defer t)

  ;; cuda-mode kinda sucks...
  (add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

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

  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t)

  ;; saves on window leave or buffer switch
  ;; https://github.com/syl20bnr/spacemacs/issues/2376
  ;; (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

  ;; (defadvice switch-to-buffer (before save-buffer-now activate)
  ;;   (when buffer-file-name (save-buffer)))
  ;; (defadvice other-window (before other-window-now activate)
  ;;   (when buffer-file-name (save-buffer)))

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
  ;; https://github.com/scturtle/dotfiles/blob/0c0765f7fa331f652a6a4188427ecb78a1540ee0/spacemacs/.spacemacs#L442-L454
  ;; (setq cquery-additional-arguments (list "--log-file" "/home/rietmann/.local/logs/cquery.log"))
  ;; (setq cquery-executable "/home/rietmann/.local/stow/cquery/bin/cquery")
  ;; (setq cquery-project-roots '("~/drz/kinesim" "/home/rietmann/build/kinesim-ci/kinesim"))

  
  ;; (setq ccls-project-roots '("/home/rietmann/drz/kinesim" "/home/rietmann/build/kinesim-ci/kinesim"))
  
  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-top-down-recurring
          (append '("compile_commands.json"
                    ".cquery")
                  projectile-project-root-files-top-down-recurring)))
  ;; not needed by mylsp
  

  ;; fixes bug: https://github.com/syl20bnr/spacemacs/issues/10938
  ;; https://github.com/syl20bnr/spacemacs/issues/9700
  ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=31586
  (setq frame-title-format nil)

  ;; (require 'lsp-ui)
  ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  ;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;; (define-key lsp-ui-mode-map (kbd "C-M-.") #'lsp-ui-peek-find-definitions)

  ;; (define-key lsp-ui-mode-map (kbd "<f8>") #'imenu-list-smart-toggle)
  ;; (lsp-ui-peek-jump-backward)
  ;; (lsp-ui-peek-jump-forward)

  ;; (setq cquery-sem-highlight-method 'overlay)
  ;; (setq lsp-highlight-symbol-at-point nil)
  ;; (face-spec-set 'lsp-face-highlight-textual '((t :background nil :inherit hl-line)))
  
  ;; (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-enable-indentation nil)
  ;; (setq lsp-ui-peek-always-show t)

  ;; (setq company-lsp-cache-candidates nil)
  ;; (setq company-lsp-async t)
  ;; (setq company-transformers nil)

  ;; (use-package cquery
  ;;   :load-path
  ;;   "/home/rietmann/build/cquery/emacs"
  ;;   :init
  ;;   (progn
  ;;     (require 'cc-mode)
  ;;     (require 'lsp-mode)
  ;;     (require 'cl-lib)
  ;;     (require 'subr-x))
  ;;   :config
  ;;   ;; config
  ;;   (setq cquery-executable "/home/rietmann/.local/stow/cquery/bin/cquery")
  ;;   )
  
  ;; (add-hook 'c-mode-common-hook (lambda ()
  ;;                                 (message "enable lsp for c++")
  ;;                                 (lsp-cquery-enable)
  ;;                                 ))


  ;; (push 'company-lsp company-backends)
  ;; (with-eval-after-load 'company
    
  ;;   )

  ;; (with-eval-after-load 'lsp-mode
  ;;   (require 'lsp-flycheck))

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
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lsp-ui intero eyebrowse ein doom-modeline eldoc-eval docker cargo auto-compile ess julia-mode smartparens helm helm-core lsp-mode magit git-commit powerline flycheck treemacs projectile evil goto-chg org-plus-contrib yasnippet-snippets yapfify yaml-mode ws-butler writeroom-mode with-editor winum which-key wgrep websocket web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unicode-fonts unfill undo-tree treemacs-projectile toml-mode toc-org tide tagedit tablist symon super-save string-inflection spaceline-all-the-icons smex smeargle slim-mode shrink-path seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters racket-mode racer pyvenv pytest pyenv-mode py-isort pug-mode prettier-js powershell popwin pippel pipenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pfuture persp-mode password-generator paradox packed overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-ipython nginx-mode nameless mwim move-text mmm-mode minitest markdown-toc magit-svn magit-gitflow macrostep lsp-julia lorem-ipsum livid-mode live-py-mode link-hint julia-repl json-navigator json-mode js2-refactor js-doc ivy-yasnippet ivy-xref ivy-rtags ivy-purpose ivy-hydra insert-shebang indent-guide importmagic impatient-mode hungry-delete ht hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-make haskell-snippets groovy-mode google-translate google-c-style golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy font-lock+ flyspell-correct-ivy flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-mypy flycheck-haskell flycheck-clang-tidy flycheck-clang-analyzer flycheck-bashate flx-ido fish-mode fill-column-indicator fancy-battery expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu ess-R-data-view emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme dotenv-mode doom-themes dockerfile-mode docker-tramp disaster diminish diff-hl define-word cython-mode cquery counsel-projectile counsel-css company-web company-tern company-statistics company-shell company-rtags company-php company-lsp company-cabal company-c-headers company-auctex company-anaconda column-enforce-mode cmm-mode cmake-mode cmake-ide clean-aindent-mode clang-format chruby centered-cursor-mode ccls bundler browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auctex-latexmk aggressive-indent ace-window ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
