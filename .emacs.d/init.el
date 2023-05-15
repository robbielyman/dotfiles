(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(unless (package-installed-p 'usepackage)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package emacs
  :ensure nil
  :preface
  (defvar ryl/indent-width 2)
  (defun ryl/check-darwin (filename)
    (if (equal system-type 'darwin) filename "no"))
  (defun ryl/check-linux (filename)
    (if (equal system-type 'gnu/linux) filename "no"))
  :custom
  (minibuffer-prompt-properties '(read-only t cursor-intangible t))
  (completion-cycle-threshold 3)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (tab-always-indent 'complete)
  (enable-recursive-minibuffers t)
  (scroll-margin 0)
  (scroll-conservatively 101)
  (scroll-preserve-screen-position t)
  (auto-window-vscroll nil)
  (custom-file "~/.config/emacs-customize.el")
  :init
  (load custom-file)
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  (add-hook 'window-setup-hook 'toggle-frame-maximized t)
  (setq-default indent-tabs-mode nil
                tab-width ryl/indent-width)
  (set-fringe-mode 10))

(use-package scroll-bar
:ensure nil
:config (scroll-bar-mode -1))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t
        evil-want-keybinding nil
        evil-shift-width ryl/indent-width)
  :hook (after-init . evil-mode)
  :preface
  (defun ryl/save-and-kill-this-buffer ()
    (interactive)
    (save-buffer)
    (kill-this-buffer))
  :config
  (with-eval-after-load 'evil-maps
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil))
  (evil-ex-define-cmd "q" #'kill-this-buffer)
  (evil-ex-define-cmd "wq" #'ryl/save-and-kill-this-buffer))

(use-package evil-collection
  :after evil-mode
  :custom evil-collection-company-use-tng nil
  :config (evil-collection-init))

(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

(use-package diminish
  :demand t)

(use-package elcord
  :demand t
  :config (elcord-mode))

(defvar ryl/default-font-size 130)
(set-face-attribute 'default nil :font "Iosevka Custom" :height ryl/default-font-size)
(set-face-attribute 'fixed-pitch nil :font "Iosevka Custom" :height ryl/default-font-size)
(set-face-attribute 'variable-pitch nil :font "Avenir Next" :height ryl/default-font-size)
(set-frame-width nil 200)
(set-frame-height nil 50)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode
                          '("<->" "<-->" "<--->" "<---->" "<----->"  "<=>" "<==>" "<===>"
                            "<====>" "<=====>"  "<**>" "<***>" "<****>" "<*****>"
                            "<!--" "<!---"  "<$" "<$>" "$>" "<." "<.>" ".>"
                            "<*" "<*>" "*>" "<\\" "<\\>" "\\>" "</" "</>" "/>" "<\""
                            "<\">" "\">" "<'" "<'>" "'>" "<^" "<^>" "^>" "<&" "<&>"
                            "&>" "<%" "<%>" "%>" "<@" "<@>" "@>" "<#" "<#>" "#>"
                            "<+" "<+>" "+>" "<-" "<->" "->" "<!" "<!>" "!>" "<?"
                            "<?>" "?>" "<|" "<|>" "|>" "<:" "<:>" ":>"
                            "::" ":::" "::::"  "->" "->-" "->--" "->>" "->>-"
                            "->>--" "->>>" "->>>-" "->>>--" "-->" "-->-" "-->--" "-->>"
                            "-->>-" "-->>--" "-->>>" "-->>>-" "-->>>--" ">-" ">--" ">>-"
                            ">>--" ">>>-" ">>>--" "=>" "=>=" "=>==" "=>>" "=>>=" "=>>=="
                            "=>>>" "=>>>=" "=>>>==" "==>" "==>=" "==>==" "==>>" "==>>="
                            "==>>==" "==>>>" "==>>>=" "==>>>==" ">=" ">==" ">>=" ">>=="
                            ">>>=" ">>>==" "<-" "-<-" "--<-" "<<-" "-<<-" "--<<-" "<<<-"
                            "-<<<-" "--<<<-" "<--" "-<--" "--<--" "<<--" "-<<--" "--<<--"
                            "<<<--" "-<<<--" "--<<<--" "-<" "--<" "-<<" "--<<" "-<<<"
                            "--<<<" "<=" "=<=" "==<=" "<<=" "=<<=" "==<<=" "<<<=" "=<<<="
                            "==<<<=" "<==" "=<==" "==<==" "<<==" "=<<==" "==<<==" "<<<=="
                            "=<<<==" "==<<<==" "=<" "==<" "=<<" "==<<" "=<<<" "==<<<"
                            ">=>" ">->" ">-->" ">==>" "<=<" "<-<" "<--<" "<==<"  ">>"
                            ">>>" "<<" "<<<"  ":+" ":-" ":=" "+:" "-:" "=:" "=^"
                            "=+" "=-" "=*" "=/" "=%" "^=" "+=" "-=" "*=" "/=" "%="
                            "/\\" "--" "~~" "---" "~~~" "==" "==="
                            "-----" "~~~~~" "-----------" "~~~~~~~~~~"
                            "\\/"  "<>" "<+" "<+>" "+>"))
  (global-ligature-mode t))

(use-package cc-vars
  :ensure nil
  :custom
  (c-default-style '((awk-mode . "awk")
                     (other . "k&r")))
  :config
  (setq-default c-basic-offset ryl/indent-width))

(use-package lua-mode
  :ensure nil
  :interpreter ("lua" . lua-mode)
  :custom
  (lua-indent-level 2))

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :custom (python-indent-offset ryl/indent-width))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner "~/.emacs.d/alanza.png")
  (dashboard-banner-logo-title "You wake up early in the morning and you work all day; that's the only secret.")
  (dashboard-center-content t)
  (dashboard-items '((recents . 5)
                     (bookmarks . 5)
                     (agenda . 5)
                     (registers . 5)))
  (dashboard-icon-type 'all-the-icons)
  (dashboard-set-file-icons t))

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode))
  :custom
  (org-publish-project-alist
   '(("ryleelyman.github.io"
      :base-directory "~/Site/_org"
      :base-extension "org"
      :publishing-directory "~/Site/_posts"
      :recursive t
      :publishing-function org-html-publish-to-html
      :headline-levels 4
      :html-extension "html"
      :body-only t))))

(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (python . t)
        (lua . t)))

  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(use-package conf-mode)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . tex-mode)
  :config
  (setq-default TeX-master "main")
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  (add-to-list 'TeX-expand-list
               '("%sn" (lambda () server-name)))
  (add-to-list 'TeX-view-program-list
               '(("Zathura"
                 ("zathura "
                  (mode-io-correlate "--synctex-forward %n:0:\"%b\" -x \"emacsclient --socket-name=%sn +%{line} %{input}\" ")
                  "%o")
                 "zathura"))
               ("Sioyek"
                ("sioyek "
                 (mode-io-correlate "--inverse-search \"emacsclient --socket-name=%sn +%2 %1\" --forward-search-file \"%b\" --forward-search-line %n ")
                 "%o")
                "sioyek"))
  (add-to-list 'TeX-view-program-selection
               '(output-pdf "Sioyek"))
  :custom
  (TeX-PDF-mode t)
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-start-server t)
  (preview-image-type 'dvisvgm))

(use-package auctex-latexmk
  :after tex
  :config (auctex-latexmk-setup))

(use-package preview-dvisvgm
  :after tex)

(use-package paren
  :ensure nil
  :custom (show-paren-delay 0)
  :config (show-paren-mode +1))

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

(use-package highlight-escape-sequences
  :hook (prog-mode . hes-mode))

(use-package flycheck
  :config (global-flycheck-mode +1))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config (add-hook 'with-editor-mode-hook #'evil-insert-state))

(use-package tramp
  :config
  (add-to-list 'tramp-methods
               '("yadm"
                 (tramp-login-program "yadm")
                 (tramp-login-args (("enter")))
                 (tramp-login-env (("SHELL") ("/bin/sh")))
                 (tramp-remote-shell "/bin/sh")
                 (tramp-remote-shell-args ("-c")))))

(defun yadm ()
  (interactive)
  (magit-status "/yadm::"))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  :custom
  (corfu-cycle t)
  :config
  (global-corfu-mode 1))

(use-package kind-icon
  :after corfu
  :custom (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package vertico
  :custom (vertico-resize t)
  (vertico-cycle t)
  :init (vertico-mode))

(use-package tempel
  :init
  (defun tempel-setup-capf ()
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf))

(use-package lsp-snippet-tempel
  :straight (lsp-snippet-tempel :type git
                                :host github
                                :repo "svaante/lsp-snippet")
  :config
  (when (featurep 'eglot)
    (lsp-snippet-tempel-eglot-init)))

(use-package eglot
  :ensure nil)

(use-package which-key
  :custom
  (which-key-show-early-on-C-h t)
  (which-key-idle-delay 2000)
  (which-key-idle-secondary-delay 0.05)
  :config (which-key-mode))

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-bubblegum t)
  (kaolin-treemacs-theme))
