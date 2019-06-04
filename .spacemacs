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
   '(html
     javascript
     php
     csv
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
            c-c++-default-mode-for-headers 'c++-mode)
     colors
     emacs-lisp
     fasd
     git
     (gtags :variables gtags-enable-by-default t)
     (go :variables
         go-use-golangci-lint t
         godoc-at-point-function 'godoc-gogetdoc
         go-tab-width 2
         gofmt-command "goimports"
         gofmt-args (list "-local" "rubrik"))
     lsp
     (org :variables
          org-enable-reveal-js-support t
          org-enable-bootstrap-support t)
     protobuf
     python
     selectric
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
                                      nimbus-theme
                                      epc
                                      json-mode
                                      strace-mode
                                      bazel-mode
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
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         nimbus
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
   dotspacemacs-default-font '("Iosevka Nerd Font"
                               :size 15
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
   dotspacemacs-enable-paste-micro-state nil
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
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  )

(defun dotspacemacs/user-init ()
  (defun fontify-frame (frame)
    (interactive)
    (if window-system
        (progn
          (if (> (x-display-pixel-width) 4000)
              (set-frame-parameter frame 'font "Iosevka Nerd Font 18") ;; Cinema Display
            (set-frame-parameter frame 'font "Iosevka Nerd Font 13")))))

  (defun fontify-current-frame ()
    (interactive)
    (if window-system
        (progn
          (if (> (x-display-pixel-width) 4000)
              (set-frame-parameter nil 'font "Iosevka Nerd Font 18") ;; Cinema Display
            (set-frame-parameter nil 'font "Iosevka Nerd Font 13")))))

  ;; Fontify any future frames
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
      '("/home/ubuntu/sdmain/src/cpp/include"
        "/home/ubuntu/sdmain/bazel-genfiles/src"
        "/home/ubuntu/sdmain/src/cpp/code"))
(setq ccls-initialization-options
      '( :clang (:extraArgs ("-xc++"
                             "-Wall"
                             "-Wno-macro-redefined"
                             "-Wno-unused-local-typedefs"
                             "-Wno-pointer-arith"
                             "-Wtype-limits"
                             "-std=c++11"
                             "-I/home/nis/code/sources/linux/include"
                             "-I/home/ubuntu/sdmain/src/cpp/code"
                             "-I/home/ubuntu/sdmain/bazel-genfiles/src"
                             "-I/home/ubuntu/sdmain/src/cpp/include"))))
(setq flycheck-clang-args '("-Wno-macro-redefined" "-Wall"))
(setq large-file-warning-threshold nil)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-flycheck-live-reporting nil)
(setq lsp-enable-on-type-formatting nil)
(setq lsp-enable-indentation nil)
(setq lsp-eldoc-hook '(lsp-hover))
(setq winum-scope 'frame-local)
(xclip-mode 1)
(transient-mark-mode -1)
(spacemacs/set-leader-keys "pf" 'counsel-projectile-find-file)

(setq-default js2-basic-offset 2
              js-indent-level 2)


;;(setq c-c++-enable-clang-format-on-save nil)

;; Org mode
(setq org-agenda-files '("/home/nis/personal.org" "/home/nis/work.org"))
(setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
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
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet-snippets yapfify yaml-mode xterm-color xresources-theme xclip ws-butler writeroom-mode visual-fill-column winum web-mode web-beautify volatile-highlights visual-regexp-steroids visual-regexp vi-tilde-fringe uuidgen unfill treemacs-projectile treemacs-evil treemacs pfuture toc-org tagedit systemd symon string-inflection strace-mode sql-indent speed-type spaceline-all-the-icons spaceline powerline solarized-theme smeargle slim-mode shell-pop selectric-mode scss-mode sass-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode protobuf-mode prettier-js popwin pippel pipenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode password-generator paradox ox-twbs ox-reveal overseer orgit org-projectile org-category-capture org-present org-mime org-download org-bullets org-brain open-junk-file nameless mwim multi-term move-text monokai-theme mmm-mode markdown-toc magit-svn magit-gitflow magit-popup macrostep lsp-ui markdown-mode lorem-ipsum livid-mode skewer-mode live-py-mode link-hint json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jinja2-mode indent-guide importmagic impatient-mode simple-httpd hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose window-purpose imenu-list helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gitignore request helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate google-c-style golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flycheck-rtags flycheck-golangci-lint flycheck flx-ido flx fill-column-indicator fasd fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit magit transient git-commit with-editor lv evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help epc ctable concurrent deferred emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode doom-themes doom-modeline eldoc-eval shrink-path all-the-icons memoize disaster diff-hl define-word cython-mode csv-mode cquery counsel-projectile counsel swiper ivy company-web web-completion-data company-tern tern company-statistics company-rtags rtags company-php ac-php-core xcscope php-mode company-lsp company-go go-mode company-c-headers company-ansible company-anaconda company column-enforce-mode color-identifiers-mode clean-aindent-mode clang-format centered-cursor-mode ccls projectile lsp-mode spinner ht dash-functional pkg-info epl browse-at-remote bazel-mode badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed ansible-doc ansible anaconda-mode pythonic f dash s aggressive-indent ace-window ace-link ace-jump-mode ace-jump-helm-line helm avy helm-core ac-ispell auto-complete popup which-key use-package pcre2el org-plus-contrib hydra font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((gtags-enable-by-default . t)
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (go-backend . go-mode)
     (go-backend . lsp)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
