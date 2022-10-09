(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(acme))
 '(custom-safe-themes
   '("998975856274957564b0ab8f4219300bca12a0f553d41c1438bbca065f298a29" default))
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(textsize web-mode magit yasnippet-snippets yasnippet eglot docker-compose-mode dockerfile-mode docker smart-mode-line acme-theme dashboard projectile ## company))
 '(visible-bell t)
 '(warning-suppress-types '((comp) (comp))))

;; Set default font
(when (member "JuliaMono" (font-family-list))
  (set-frame-font "JuliaMono-16" t t))

;; Enable line numbers
(global-linum-mode 1)

;; Enable column number
(column-number-mode 1)

;; Disable <C-Z> suspend frame
(global-unset-key (kbd "C-z"))
(global-set-key "\C-z" 'undo)

;; Enable Ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Enable electric pair
(electric-pair-mode 1)

;; Set buffer C-x C-b to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Enable MELPA repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Org-mode configuration
(use-package org
  :config
  (setq org-pretty-entities t)
  (setq org-hide-emphasis-markers t)
  (setq org-startup-with-inline-images t))

(use-package textsize
      :ensure nil
      :commands textsize-mode
;;      :config
;;      (textsize-default-points 16)
      :init (textsize-mode))

;; Acme theme configuration
(use-package acme-theme
  :config
  (load-theme 'acme t))

;; Dashboard configuration
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Dashboard - Set project backend
(setq dashboard-project-backend 'projectile)

;; Dashboard - Set items
(setq dashboard-items '((recents  . 5)
                        (projects . 5)))

;; Dashboard - Set the title
(setq dashboard-banner-logo-title (concat "Benvenuto su Emacs, " (getenv "USER") "."))

;; Dashboard - Set the banner
(setq dashboard-startup-banner (concat (getenv "HOME") "/.config/emacs/res/dash.png"))

;; Dashboard - Set centered
(setq dashboard-center-content t)

;; Enable Smart Mode Line
(sml/setup)

;; Language Server Protocol packages loading
(use-package eglot
  :ensure t
  :hook ((python-mode) . eglot-ensure)
  :hook ((c-mode) . eglot-ensure)
  :hook ((c++-mode) . eglot-ensure))

(use-package yasnippet
  :ensure t
  :hook (python-mode . (lambda ()
			 (yas-reload-all)
			 (yas-minor-mode))))

(use-package company
  :hook ((python-mode) . company-mode)
  :hook ((c-mode) . company-mode)
  :hook ((c++-mode) . company-mode))

;; Docker modes
(use-package dockerfile-mode)

(use-package docker-compose-mode)

;; Projectile configuration
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-indexing-method 'hybrid)

;; Initialize MELPA packages
(package-initialize)

;; MELPA automatic configurations

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
