;; -*- mode: emacs-lisp; lexical-binding: t -*-
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
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers")

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     php
     yaml
     epub
     (sql :variables
          sql-capitalize-keywords t)
     html
     gtags
     (go :variables go-backend 'lsp)
     ;; dap
     nginx
     (lua :variables
          lua-backend 'lsp-emmy
          lua-lsp-emmy-java-path "java"                         ; default path
          lua-lsp-emmy-enable-file-watchers t)                  ; enabled default
     dash
     json
     cmake
     osx
     pandoc
     (org
      :variables
      org-src-tab-acts-natively t
      org-enable-org-journal-support t
      org-journal-dir "/Users/zhoush/Documents/Notes/org/journal"
      org-journal-file-format "%Y%m%d.org"
      org-journal-date-prefix "#+OPTIONS: num:nil\n"
      org-journal-date-format "* <%Y-%m-%d %H:%M> 复盘"
      ;; org-journal-time-prefix "* "
      org-journal-time-format ""
      org-projectile-file "org/TODOs.org"
      org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/Notes/TODOs.org" "Tasks")
         "* TODO %?\n %i\n  %a")
        ("n" "Note" entry (file+headline "~/Documents/Notes/NOTEs.org" "NOTEs")
         "* %?\n  %i\n") ))
     plantuml
     (c-c++ :variables
            c-c++-adopt-subprojects t
            c-c++-default-mode-for-headers 'c-mode
            c-c++-backend 'company-ccls
            lsp-ui-doc-enable t
            lsp-ui-doc-include-signature t
            lsp-enable-file-watchers t
            lsp-file-watch-threshold 4096
            lsp-auto-guess-root t
            )
     (python :variables
             python-backend 'lsp
             python-formatter 'yapf)
     docker
     cnfonts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-minimum-prefix-length 3
                      auto-completion-idle-delay 0.2
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      ;; auto-completion-use-company-box t
                      auto-completion-enable-sort-by-usage t)
     better-defaults
     emacs-lisp
     git
     helm
     ;; markdown
     multiple-cursors
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     treemacs
     ;; version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(load-dir)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

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
   dotspacemacs-editing-style 'vim

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

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 16
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
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
   dotspacemacs-max-rollback-slots 16

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
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

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
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
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

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
   dotspacemacs-frame-title-format "%I@%b"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ;;         ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
  ;;         ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (load-dir-one (concat dotspacemacs-directory "load.d/"))

  ;; orgmode pdf
  (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                "xelatex -interaction nonstopmode %f"))
  (require 'org-tempo)

  ;; (when (not (display-graphic-p))
  ;;   (setq flycheck-indication-mode nil))
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
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(c-basic-offset 4)
 '(c-default-style
   '((c-mode . "linux")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(c-doc-comment-style
   '((c-mode . doxygen)
     (c++-mode . gtkdoc)
     (java-mode . javadoc)
     (pike-mode . autodoc)))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(dap-python-executable "python3")
 '(default-input-method nil)
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(helm-completion-style 'emacs)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("XT" . "#dc752f")
     ("THEM" . "#2aa198")
     ("PROG" . "#268bd2")
     ("OKAY" . "#268bd2")
     ("DONT" . "#d70008")
     ("FAIL" . "#d70008")
     ("DONE" . "#00af00")
     ("NOTE" . "#875f00")
     ("KLUDGE" . "#875f00")
     ("HACK" . "#875f00")
     ("TEMP" . "#875f00")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(lsp-enable-file-watchers t)
 '(org-agenda-files
   '("~/Documents/Notes/TODOs.org" "/Users/zhoush/Documents/Notes/org/journal/20190118.org" "/Users/zhoush/Documents/Notes/org/journal/20190120.org" "/Users/zhoush/Documents/Notes/org/journal/20190121.org" "/Users/zhoush/Documents/Notes/org/journal/20190122.org" "/Users/zhoush/Documents/Notes/org/journal/20190226.org" "/Users/zhoush/Documents/Notes/org/journal/20190311.org" "/Users/zhoush/Documents/Notes/org/journal/20190403.org" "/Users/zhoush/Documents/Notes/org/journal/20190404.org" "/Users/zhoush/Documents/Notes/org/journal/20190408.org" "/Users/zhoush/Documents/Notes/org/journal/20190415.org" "/Users/zhoush/Documents/Notes/org/journal/20190510.org" "/Users/zhoush/Documents/Notes/org/journal/20190513.org" "/Users/zhoush/Documents/Notes/org/journal/20190514.org" "/Users/zhoush/Documents/Notes/org/journal/20190516.org" "/Users/zhoush/Documents/Notes/org/journal/20190520.org" "/Users/zhoush/Documents/Notes/org/journal/20190523.org" "/Users/zhoush/Documents/Notes/org/journal/20190526.org" "/Users/zhoush/Documents/Notes/org/journal/20190529.org" "/Users/zhoush/Documents/Notes/org/journal/20190611.org" "/Users/zhoush/Documents/Notes/org/journal/20190704.org" "/Users/zhoush/Documents/Notes/org/journal/20190909.org" "/Users/zhoush/Documents/Notes/org/journal/20190910.org" "/Users/zhoush/Documents/Notes/org/journal/20190916.org" "/Users/zhoush/Documents/Notes/org/journal/20190918.org" "/Users/zhoush/Documents/Notes/org/journal/20190923.org" "/Users/zhoush/Documents/Notes/org/journal/20190925.org" "/Users/zhoush/Documents/Notes/org/journal/20190929.org" "/Users/zhoush/Documents/Notes/org/journal/20190930.org" "/Users/zhoush/Documents/Notes/org/journal/20191008.org" "/Users/zhoush/Documents/Notes/org/journal/20200211.org" "/Users/zhoush/Documents/Notes/org/journal/20200212.org" "/Users/zhoush/Documents/Notes/org/journal/20200418.org" "/Users/zhoush/Documents/Notes/org/journal/20200419.org" "/Users/zhoush/Documents/Notes/org/journal/20200422.org" "/Users/zhoush/Documents/Notes/org/journal/20200429.org" "/Users/zhoush/Documents/Notes/org/journal/20200430.org" "/Users/zhoush/Documents/Notes/org/journal/20200506.org" "/Users/zhoush/Documents/Notes/org/journal/20200507.org" "/Users/zhoush/Documents/Notes/org/journal/20200508.org" "/Users/zhoush/Documents/Notes/org/journal/20200511.org" "/Users/zhoush/Documents/Notes/org/journal/20200512.org" "/Users/zhoush/Documents/Notes/org/journal/20200513.org" "/Users/zhoush/Documents/Notes/org/journal/20200514.org" "/Users/zhoush/Documents/Notes/org/journal/20200515.org" "/Users/zhoush/Documents/Notes/org/journal/20200518.org" "/Users/zhoush/Documents/Notes/org/journal/20200519.org" "/Users/zhoush/Documents/Notes/org/journal/20200520.org" "/Users/zhoush/Documents/Notes/org/journal/20200521.org" "/Users/zhoush/Documents/Notes/org/journal/20200523.org" "/Users/zhoush/Documents/Notes/org/journal/20200525.org" "/Users/zhoush/Documents/Notes/org/journal/20200526.org" "/Users/zhoush/Documents/Notes/org/journal/20200527.org" "/Users/zhoush/Documents/Notes/org/journal/20200528.org" "/Users/zhoush/Documents/Notes/org/journal/20200531.org" "/Users/zhoush/Documents/Notes/org/journal/20200601.org" "/Users/zhoush/Documents/Notes/org/journal/20200602.org" "/Users/zhoush/Documents/Notes/org/journal/20200603.org" "/Users/zhoush/Documents/Notes/org/journal/20200604.org" "/Users/zhoush/Documents/Notes/org/journal/20200607.org" "/Users/zhoush/Documents/Notes/org/journal/20200608.org" "/Users/zhoush/Documents/Notes/org/journal/20200609.org" "/Users/zhoush/Documents/Notes/org/journal/20200610.org" "/Users/zhoush/Documents/Notes/org/journal/20200611.org" "/Users/zhoush/Documents/Notes/org/journal/20200612.org" "/Users/zhoush/Documents/Notes/org/journal/20200615.org" "/Users/zhoush/Documents/Notes/org/journal/20200616.org" "/Users/zhoush/Documents/Notes/org/journal/20200617.org" "/Users/zhoush/Documents/Notes/org/journal/20200618.org" "/Users/zhoush/Documents/Notes/org/journal/20200620.org" "/Users/zhoush/Documents/Notes/org/journal/20200622.org" "/Users/zhoush/Documents/Notes/org/journal/20200623.org" "/Users/zhoush/Documents/Notes/org/journal/20200624.org" "/Users/zhoush/Documents/Notes/org/journal/20200629.org" "/Users/zhoush/Documents/Notes/org/journal/20200630.org" "/Users/zhoush/Documents/Notes/org/journal/20200701.org" "/Users/zhoush/Documents/Notes/org/journal/20200702.org" "/Users/zhoush/Documents/Notes/org/journal/20200703.org" "/Users/zhoush/Documents/Notes/org/journal/20200706.org" "/Users/zhoush/Documents/Notes/org/journal/20200707.org" "/Users/zhoush/Documents/Notes/org/journal/20200708.org" "/Users/zhoush/Documents/Notes/org/journal/20200709.org" "/Users/zhoush/Documents/Notes/org/journal/20200711.org" "/Users/zhoush/Documents/Notes/org/journal/20200713.org" "/Users/zhoush/Documents/Notes/org/journal/20200714.org" "/Users/zhoush/Documents/Notes/org/journal/20200715.org" "/Users/zhoush/Documents/Notes/org/journal/20200716.org" "/Users/zhoush/Documents/Notes/org/journal/20200717.org" "/Users/zhoush/Documents/Notes/org/journal/20200720.org" "/Users/zhoush/Documents/Notes/org/journal/20200721.org" "/Users/zhoush/Documents/Notes/org/journal/20200722.org" "/Users/zhoush/Documents/Notes/org/journal/20200723.org" "/Users/zhoush/Documents/Notes/org/journal/20200724.org" "/Users/zhoush/Documents/Notes/org/journal/20200727.org" "/Users/zhoush/Documents/Notes/org/journal/20200728.org" "/Users/zhoush/Documents/Notes/org/journal/20200729.org" "/Users/zhoush/Documents/Notes/org/journal/20200730.org" "/Users/zhoush/Documents/Notes/org/journal/20200731.org" "/Users/zhoush/Documents/Notes/org/journal/20200803.org" "/Users/zhoush/Documents/Notes/org/journal/20200804.org" "/Users/zhoush/Documents/Notes/org/journal/20200805.org" "/Users/zhoush/Documents/Notes/org/journal/20200806.org" "/Users/zhoush/Documents/Notes/org/journal/20200807.org" "/Users/zhoush/Documents/Notes/org/journal/20200810.org" "/Users/zhoush/Documents/Notes/org/journal/20200811.org" "/Users/zhoush/Documents/Notes/org/journal/20200812.org" "/Users/zhoush/Documents/Notes/org/journal/20200813.org" "/Users/zhoush/Documents/Notes/org/journal/20200814.org"))
 '(org-babel-load-languages
   '((shell . t)
     (python . t)
     (C . t)
     (plantuml . t)
     (sql . t)
     (emacs-lisp . t)))
 '(org-format-latex-options
   '(:foreground auto :background default :scale 1.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(company-box frame-local orgit org-rich-yank org-journal org-cliplink org-brain helm-org-rifle evil-org company-lsp utop tuareg caml tide typescript-mode seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake ocp-indent ob-elixir nodejs-repl mvn minitest meghanada maven-test-mode lsp-java livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc groovy-mode groovy-imports pcache gradle-mode git-gutter-fringe+ fringe-helper git-gutter+ flycheck-ocaml merlin flycheck-credo emojify emoji-cheat-sheet-plus dune company-emoji chruby bundler inf-ruby browse-at-remote alchemist elixir-mode smart-input-source names pyim-basedict xr pangu-spacing find-by-pinyin-dired chinese-conv ace-pinyin pinyinlib treemacs-persp molokai-theme dracula-theme flycheck-elsa ansi package-build shut-up git commander geben company-phpactor phpactor composer php-runtime phpunit phpcbf php-extras php-auto-yasnippets drupal-mode counsel-gtags counsel swiper company-php xcscope php-mode osx-clipboard flycheck-ycmd company-ycmd ycmd request-deferred treemacs-evil ox-pandoc helm-dictionary dockerfile-mode docker tablist docker-tramp sqlup-mode yaml-mode nov esxml pyim helm-gtags ggtags ivy bui tree-mode yapfify ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit spaceline powerline smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin plantuml-mode pip-requirements persp-mode pcre2el pbcopy paradox spinner osx-trash osx-dictionary org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-bullets open-junk-file nginx-mode neotree mwim move-text magit-gitflow magit-popup macrostep lua-mode lorem-ipsum load-dir live-py-mode linum-relative link-hint launchctl indent-guide hydra lv hy-mode dash-functional hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-gitignore request helm-flx helm-descbinds helm-dash dash-docs helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy flx-ido flx fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu goto-chg undo-tree eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump disaster diminish dash-at-point cython-mode company-web web-completion-data company-c-headers company-anaconda column-enforce-mode cnfonts cmake-mode clean-aindent-mode clang-format bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed anaconda-mode pythonic f dash s ace-link ace-jump-helm-line helm-core ac-ispell auto-complete popup company-statistics async aggressive-indent adaptive-wrap ace-window))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors '("#5f5f87" . "#ffffff"))
 '(python-shell-exec-path '("python3"))
 '(python-shell-interpreter "python3")
 '(yas-snippet-dirs
   '("/Users/zhoush/.spacemacs.d/snippets" "/Users/zhoush/.emacs.d/private/snippets/" "/Users/zhoush/.emacs.d/layers/+completion/auto-completion/local/snippets" yasnippet-snippets-dir)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
