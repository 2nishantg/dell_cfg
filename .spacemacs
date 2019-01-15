;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.


(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.d/private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(csv
     systemd
     markdown
     ansible
     sql
     yaml
     auto-completion
     better-defaults
     (c-c++ :variables
            c-c++-enable-clang-format-on-save t
            c-c++-enable-google-style t
            c-c++-enable-google-newline t
            c-c++-backend 'lsp-ccls
            c-c++-lsp-sem-highlight-method 'font-lock
            c-c++-default-mode-for-headers 'c++-mode)
     colors
     emacs-lisp
     fasd
     git
     (go :variables
         go-use-golangci-lint t
         godoc-at-point-function 'godoc-gogetdoc
         go-tab-width 2
         go-backend 'lsp
         gofmt-command "goimports"
         gofmt-args (list "-local" "rubrik"))
     lsp
     protobuf
     python
     (shell :variables
            shell-default-term-shell "/bin/zsh")
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      json-mode
                                      strace-mode
                                      xclip
                                      badwolf-theme
                                      doom-themes
                                      multiple-cursors
                                      visual-regexp-steroids
                                      visual-regexp
                                      ace-jump-mode
                                      solarized-theme
                                      speed-type
                                      xresources-theme
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(org-pomodoro flycheck-pos-tip)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-tomorrow-night
                         zenburn
                         xresources
                         spacemacs-dark
                         solarized-dark
                         spacemacs-light
                         solarized-light
                         monokai)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;;dotspacemacs-default-font '("Iosevka Nerd Font"
   dotspacemacs-default-font '("Iosevka"
                               :size 16
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.3
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  )

(defun dotspacemacs/user-init ()

 )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
(rainbow-identifiers-mode)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")
(setq-default cursor-type 'line)
(setq save-interprogram-paste-before-kill t)
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))
(global-set-key "\C-x\C-k" 'kill-region)
(defadvice kill-region (before unix-werase activate compile)
  "When called interactively with no active region, delete a single word
    backwards instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (save-excursion (backward-word 1) (point)) (point)))))
(global-set-key (kbd "C-l") 'ace-jump-line-mode)
(define-key global-map (kbd "C-x C-c") 'ido-kill-buffer)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-d") 'delete-forward-char)
(global-set-key (kbd "C-h")  'delete-backward-char)
(global-set-key (kbd "M-y")  'helm-show-kill-ring)
(global-set-key (kbd "M-h")  'company-c-headers)
(delete-selection-mode)
(setq powerline-default-separator 'nil)
(spaceline-compile)
(fringe-mode -1)
(spaceline-toggle-hud-off)
;; Activate column indicator in prog-mode and text-mode
(add-hook 'go-mode-hook 'turn-on-fci-mode)
(setq go-format-before-save t)
(setq company-c-headers-path-user
 (quote
  ("/home/ubuntu/sdmain/src/cpp/include" "/home/ubuntu/sdmain/bazel-genfiles/src" "/home/ubuntu/sdmain/src/cpp/code")))
(setq cquery-extra-init-params '( :extraClangArguments ("-std=c++11" "-I/home/ubuntu/sdmain/src/cpp/code" "-I/home/ubuntu/sdmain/bazel-genfiles/src" "-I/home/ubuntu/sdmain/src/cpp/include")))
(setq ccls-initialization-options '( :clang (:extraArgs ("-std=c++11" "-I/home/ubuntu/sdmain/src/cpp/code" "-I/home/ubuntu/sdmain/bazel-genfiles/src" "-I/home/ubuntu/sdmain/src/cpp/include"))))
(setq company-clang-arguments
  (quote
   ("-I/home/ubuntu/sdmain/src/cpp/code" "-I/home/ubuntu/sdmain/bazel-genfiles/src" "-I/home/ubuntu/sdmain/src/cpp/include")))
(setq large-file-warning-threshold nil)
(setq flycheck-clang-include-path
  (quote
   ("/home/ubuntu/sdmain/src/cpp/code" "/home/ubuntu/sdmain/bazel-genfiles/src" "/home/ubuntu/sdmain/src/cpp/include")))
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq lsp-ui-flycheck-live-reporting nil)
(xclip-mode 1)
)

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
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-sideline-enable nil)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (json-mode bazel-mode strace-mode 0blayout xresources-theme pyvenv live-py-mode eyebrowse evil-surround evil-nerd-commenter evil-matchit evil-magit eval-sexp-fu eshell-prompt-extras editorconfig dumb-jump doom-themes doom-modeline eldoc-eval diff-hl cython-mode counsel-projectile counsel ivy auto-compile apropospriate-theme aggressive-indent ace-window anaconda-mode smartparens flycheck company projectile helm helm-core magit git-commit markdown-mode f spaceline powerline org-plus-contrib evil goto-chg async zenburn-theme yasnippet-snippets yapfify yaml-mode xterm-color xclip ws-butler writeroom-mode with-editor winum which-key volatile-highlights visual-regexp-steroids vi-tilde-fringe uuidgen use-package unfill undo-tree treepy toc-org systemd symon swiper string-inflection sql-indent speed-type spaceline-all-the-icons solarized-theme smeargle shrink-path shell-pop restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pytest pyenv-mode py-isort protobuf-mode popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox packed overseer org-bullets open-junk-file neotree nameless mwim multiple-cursors multi-term move-text monokai-theme mmm-mode markdown-toc magit-svn magit-gitflow macrostep lsp-ui lsp-go lorem-ipsum link-hint jinja2-mode indent-guide importmagic hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation highlight helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag graphql google-translate google-c-style golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy font-lock+ flycheck-rtags flycheck-golangci-lint flx-ido fill-column-indicator fasd fancy-battery expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-numbers evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z esh-help elisp-slime-nav dotenv-mode disaster diminish define-word csv-mode cquery company-statistics company-rtags company-lsp company-go company-c-headers company-ansible company-anaconda column-enforce-mode color-identifiers-mode clean-aindent-mode clang-format centered-cursor-mode ccls browse-at-remote badwolf-theme auto-yasnippet auto-highlight-symbol ansible-doc ansible ace-link ace-jump-mode ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
