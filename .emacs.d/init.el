;;; init.el --- Emacs configuration file -*- lexical-binding: t; -*-

;; Author: Rylee Lyman

;;; Commentary:

;;; Code:

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
;; (when (memq window-system '(mac ns x))
;;  (exec-path-from-shell-initialize))
;; (exec-path-from-shell-copy-env "DBUS_SESSION_BUS_ADDRESS")

(setq catppuccin-flavor 'frappe)
(catppuccin-reload)

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package emacs
  :ensure nil
  :preface
  (defvar ryl/indent-width 2)
  :init
  (setq minibuffer-prompt-properties
	'(read-only t cursor-intangible t face minibuffer-prompt))
  (setq completion-cycle-threshold 3)
  (setq read-extended-command-predicate
	#'command-completion-default-include-p)
  (setq tab-always-indent 'complete)
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  (setq enable-recursive-minibuffers t)
  :config
  (set-frame-font "Iosevka Custom 13" nil t)
  (tab-bar-mode t)
  (setq scroll-margin 0
	scroll-conservatively 101
	scroll-preserve-screen-position t
	auto-window-vscroll nil)
  (setq-default indent-tabs-mode nil
		            tab-width ryl/indent-width))

(use-package ligature
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  (ligature-set-ligatures 'prog-mode '("-<<" "-<" "-<-" "<--" "<---" "<<-" "<-"
                                       "->" "->>" "-->" "--->" "->-" ">-" ">>-"
                                       "=<<" "=<" "=<=" "<==" "<===" "<<=" "<="
                                       "=>" "=>>" "==>" "===>" "=>=" ">=" ">>="
                                       "<->" "<-->" "<--->" "<---->" "<=>" "<==>"
                                       "<===>" "<====>" "::" ":::" "__"
                                       "<~~" "</" "</>" "/>" "~~>" "==" "!=" "<>"
                                       "===" "!==" "!===" "<:" ":=" "*=" "*+"
                                       "<*" "<*>" "*>" "<|" "<|>" "|>" "<." "<.>" ".>"
                                       "+*" "=*" "=:" ":>" "(*" "*)" "/*" "*/"
                                       "[|" "|]" "++" "+++" "\\/" "/\\" "|-" "-|"
                                       "<!--" "<!---" "-*-"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package scroll-bar
  :ensure nil
  :config (scroll-bar-mode -1))

(use-package cc-vars
  :ensure nil
  :config
  (setq-default c-basic-offset ryl/indent-width)
  (setq c-default-style '((awk-mode . "awk")
			  (other . "k&r"))))

(use-package lua-mode
  :ensure nil
  :config
  (setq lua-indent-level 2))

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config (setq python-indent-offset ryl/indent-width))

(use-package paren
  :ensure nil
  :init (setq show-paren-delay 0)
  :config (show-paren-mode +1))

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

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
	(dashboard-set-heading-icons t)
	(dashboard-set-file-icons t))

(use-package highlight-escape-sequences
  :hook (prog-mode . hes-mode))

(use-package evil
  :diminish undo-tree-mode
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
  :after evil
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config (add-hook 'with-editor-mode-hook #'evil-insert-state))

(use-package flycheck
  :config (global-flycheck-mode +1))

(use-package eglot
  :ensure nil)

(use-package lsp-snippet-tempel
  :straight (lsp-snippet-tempel :type git
                                :host github
                                :repo "svaante/lsp-snippet")
  :config
  (when (featurep 'eglot)
    ;; Initialize lsp-snippet -> tempel in eglot
    (lsp-snippet-tempel-eglot-init)))

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . visual-line-mode)
	       (org-mode . org-indent-mode))
  :config
  (setq org-publish-project-alist
      '(("ryleelyman.github.io" ;; my blog project (just a name)
         ;; Path to org files.
         :base-directory "~/Site/_org"
         :base-extension "org"
         ;; Path to Jekyll Posts
         :publishing-directory "~/Site/_posts"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t
         ))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package diminish
  :demand t)

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode +1)
  (setq which-key-idle-delay 0.4
	which-key-idle-secondary-delay 0.4))

(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . tex-mode)
  :config
  (setq-default TeX-master "main")
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  (setq TeX-PDF-mode t
        TeX-source-correlate-mode t
        TeX-source-correlate-start-server t)
  (add-to-list 'TeX-expand-list
               '("%sn" (lambda () server-name)))
  (add-to-list 'TeX-view-program-list
               '("Zathura"
                 ("zathura "
                  (mode-io-correlate " --synctex-forward %n:0:\"%b\" -x \"emacsclient --socket-name=%sn +%{line} %{input}\" ")
                  "%o")
                 "zathura"))
  (add-to-list 'TeX-view-program-list
               '("Sioyek"
                 ("sioyek"
                 (mode-io-correlate " --inverse-search \"emacsclient --socket-name=%sn +%2 %1\" --forward-search-file \"%b\" --forward-search-line %n")
                 " %o")
                 "sioyek"))
  (add-to-list 'TeX-view-program-selection
               '(output-pdf "Sioyek"))
  (setq preview-image-type 'dvisvgm))

(use-package auctex-latexmk
  :after tex
  :config
  (auctex-latexmk-setup))

(use-package elcord
  :demand t
  :config
  (elcord-mode))

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-resize t
	vertico-cycle t))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  :config
  (global-corfu-mode 1))

(use-package tempel
  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))

  :init

  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
)

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package dabbrev
  :ensure nil
  :bind (("M-/" . dabbrev-completion)
	       ("C-M-/" . dabbrev-expand))
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))

(use-package preview-dvisvgm
  :after tex)

(use-package elcord
  :demand t
  :init (elcord-mode))

(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-font-list
   '((1 "" "" "\\mathcal{" "}")
     (2 "\\textbf{" "}" "\\mathbf{" "}")
     (3 "\\textsc{" "}")
     (5 "\\emph{" "}")
     (6 "\\textsf{" "}" "\\mathsf{" "}")
     (9 "\\textit{" "}" "\\mathit{" "}")
     (12 "\\textulc{" "}")
     (13 "\\textmd{" "}")
     (14 "\\textnormal{" "}" "\\mathnormal{" "}")
     (18 "\\textrm{" "}" "\\mathrm{" "}")
     (19 "\\textsl{" "}" "\\mathbb{" "}")
     (20 "\\texttt{" "}" "\\mathtt{" "}")
     (21 "\\textup{" "}")
     (23 "\\textsw{" "}")
     (4 "" "" t)
     (75 "" "" "\\mathfrak{" "}")))
 '(package-selected-packages
   '(tempel-collection ligature lua-mode all-the-icons dap-C dap-mode lsp-treemacs lsp-ui exec-path-from-shell flycheck auctex-latexmk use-package corfu vertico lsp-mode elcord preview-dvisvgm preview-latex auctex evil))
 '(preview-LaTeX-command
   '("%`xelatex --no-pdf \"\\nonstopmode\\nofiles\\PassOptionsToPackage{"
     ("," . preview-required-option-list)
     "}{preview}\\AtBeginDocument{\\ifx\\ifPreview\\undefined" preview-default-preamble "\\fi}\"%' \"\\detokenize{\" %(t-filename-only) \"}\""))
 '(preview-dvisvgm-pdf-command
   "dvisvgm --libgs=/opt/homebrew/opt/ghostscript/lib/libgs.10.01.dylib --no-fonts _region_.xdv --page=- --output=\"%m/prev%%3p.svg\"")
 '(treesit-font-lock-level 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
