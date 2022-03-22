;; Enable full screen at startup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(acme))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(acme-theme dashboard projectile ## company lsp-ui lsp-pyright lsp-mode))
 '(warning-suppress-types '((comp) (comp))))


;; Enable line numbers
(global-linum-mode 1)


;; Enable Ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Set buffer C-x C-b to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Enable MELPA repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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
(setq dashboard-startup-banner "/home/giuss/.config/emacs/res/dash.png")

;; Dashboard - Set centered
(setq dashboard-center-content t)


;; Language Server Protocol packages loading
(use-package lsp-mode
  :hook ((python-mode) . lsp-deferred)
  :commands lsp)

;; Disable file watchers
;; (altrimenti cerca di aggiungere tutti i file del venv python alla lista di file watched)
(setq lsp-enable-file-watchers nil)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp)))
  :init (when (executable-find "python3")
	  (setq lsp-pyright-python-executable-cmd "python3")))

;; Projectile configuration
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Initialize MELPA packages
(package-initialize)

;; MELPA automatic configurations

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
