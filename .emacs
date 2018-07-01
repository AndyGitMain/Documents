
;;==================================================================
;; Mode
;;==================================================================
;; select mode
(setq auto-mode-alist (append
		       '(("\\.c$" . c-mode)
				 ("\\.h$" . c-mode)
				 ("\\.C$" . c++-mode)
				 ("\\.cc$" . c++-mode)
				 ("\\.H$" . c++-mode)
				 ("\\.hh$" . c++-mode)
				 ("\\.cxx$" . c++-mode)
				 ("\\.hxx$" . c++-mode)
				 ("\\.cpp$" . c++-mode)
				 ("\\.hpp$" . c++-mode)
				 ("\\.tex$" . TeX-mode)
				 ("\\.txi$" . Texinfo-mode)
				 ("\\.el$" . emacs-lisp-mode)
				 (".emacs" . lisp-mode)
				 ("\\.a$" . c-mode))
			   auto-mode-alist))


;;==================================================================
;; Package Manager
;;==================================================================
(require 'package)
(dolist (source '(("gnu" . "http://elpa.gnu.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)


;;==================================================================
;; Color Themes
;;==================================================================
;; customize-themes
(load-theme 'manoj-dark)


;;==================================================================
;; General Setting
;;==================================================================
;; show time on status bar
(display-time)

;; syntax highlighting
(global-font-lock-mode t)

;; set fonts
(set-default-font "Monospace-10")

;; disable making a backup file
(setq make-backup-files nil)

;; disable welcome message
(setq inhibit-startup-message t)

;; disable auto-save
(setq auto-save-default nil)

;; mouse scrolling
(setq mouse-wheel-scroll-amount '(10))

;; enable mouse acceleration
(setq mouse-wheel-progressive-speed nil)

;; disable tool bar below menu bar
(tool-bar-mode -1)

;; set frame size and position
(set-frame-position (selected-frame) 0 0)
(set-frame-height (selected-frame) 50)
(set-frame-width (selected-frame) 180)

;; scrolling
(setq scroll-step            2
      scroll-conservatively  10000)


;;==================================================================
;; Windows and Buffer
;;==================================================================
;; When activated, it allows you to "undo" (and "redo") changes
;; in the window configuration
;; C-c left / C-c right
(winner-mode 1)

;; move between windows with the [shift + arrow keys]
(windmove-default-keybindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/home/andy/Git/DeviceDriver")))
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages (quote (projectile ecb magit avy company which-key))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;==================================================================
;; Shell-Switcher
;;==================================================================
;; Manage multiple terminal buffer
;; C + '
(require 'shell-switcher)
(setq shell-switcher-mode t)




;;==================================================================
;; Programming
;;==================================================================
;; show parenthesis matching
(show-paren-mode t)

;; set tab
(setq default-tab-width 4
      c-basic-offset 4)

;; always insert indent at ENTER-key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; line number at info bar
(setq line-number-mode t)




;;==================================================================
;; Yasnippet and auto-complete
;;==================================================================
;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)

;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete)
(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; auto complete clang
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-clang-20140409.52/")
(require 'auto-complete-clang)



;;==================================================================
;; Magit
;;==================================================================
;; Disable backend git
;(setq vc-handled-backends nil)
(global-set-key (kbd "C-x g") 'magit-status)



;;==================================================================
;; Ido
;;==================================================================
;; enable ido mode
(require 'ido)
(ido-mode t)


;;==================================================================
;; Ido
;;==================================================================

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
