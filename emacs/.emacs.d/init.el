(setq inhibit-startup-message t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(set-frame-parameter (selected-frame) 'alpha '(100 100))

(add-to-list 'default-frame-alist '(alpha 100 100))
(show-paren-mode 1)
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(ido-mode 1)
(menu-bar-mode -1)            ; Disable the menu bar
(set-face-attribute 'default nil :font "Fira Code" :height 130)
(require 'package)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
		         ("GNU ELPA" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(doom-themes doom-modeline yasnippet-snippets evil-collection evil-mc-extras evil-commentary yasnippet company evil-magit magit evil smex use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
; (setq evil-want-keybinding nil)
; (require 'evil)
; (evil-mode 1)
(load-theme 'doom-tomorrow-night)
; (evil-commentary-mode)

;; c-mode 
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))
;; magit
(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)


;; dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

(require 'company)

(global-company-mode t)
(require 'yasnippet)
(yas-global-mode 1)
;; multi mc but evil
; (global-evil-mc-mode 1)

; (use-package evil-collection
;   :after evil
;   :custom
;   (evil-collection-outline-bind-tab-p nil)
;   :config
;   (evil-collection-init))
; (use-package doom-modeline
;   :ensure t
;   :init (doom-modeline-mode 1)
;   :custom ((doom-modeline-height 15)))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))
