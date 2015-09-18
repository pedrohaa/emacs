
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Mode majeur pour éditer du code Caml" t)
(autoload 'camldebug "camldebug" "Exécuter le débogueur Caml" t) 

;; adjust paths for emacs source code
(add-to-list 'load-path "~remy/emacs/")

;; adjust paths for emacs ocaml info sources
(require 'info)
(add-to-list 'Info-directory-list "~remy/emacs/info/")


(define-key global-map (kbd "RET") 'newline-and-indent)

(setq url-using-proxy t)
(setq url-proxy-services  '(("http" . "kuzh.polytechnique.fr:8080")))

(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)


(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-source 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include"))

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("943bff6eada8e1796f8192a7124c1129d6ff9fbd1a0aed7b57ad2bf14201fdd4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;(load "~/lib/emacs/haskell-mode/haskell-site-file")
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(defun labelnameref ()
;;  "Insert \label{ARG} \index{\nameref{ARG}} at point"
  (interactive "")
  (insert "quicksort xs
    | xs == [] = []
    | otherwise = (quicksort (split (<) xs pivot)) ++ [pivot] ++ (quicksort (split (>) xs pivot))
    where pivot = xs !! (0)

split f xs pivot 
    | xs == [] = []
    | otherwise = if x `f` pivot then x:(split f (tail xs) pivot)
                  else split f (tail xs) pivot
    where x = head xs"))

(require 'iso-transl)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq scroll-step 1)
(setq-default indent-tabs-mode nil)
(ido-mode 1)
(setq package-check-signature nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'zenburn t)

(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)
(show-paren-mode 1)
