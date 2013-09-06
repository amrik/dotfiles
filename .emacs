(setq inhibit-splash-screen t)
(global-font-lock-mode t)
(setq make-backup-files nil)
;(load-library "~/.emacs.d/color-theme.el")
(setq auto-mode-alist (append '((".fbml" . xml-mode)) auto-mode-alist)) ; force fbml to load as xml
;(mouse-wheel-mode)
(setq c-default-style "linux")
(if (>= emacs-major-version 23)
    (set-default-font "Monospace-10"))
;; code checking via flymake
;; set code checker here from "epylint", "pyflakes"
(setq pycodechecker "pyflakes")
  (when (load "flymake" t) 
         (defun flymake-pyflakes-init () 
           (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                              'flymake-create-temp-inplace)) 
              (local-file (file-relative-name 
                           temp-file 
                           (file-name-directory buffer-file-name)))) 
             (list "pyflakes" (list local-file)))) 

         (add-to-list 'flymake-allowed-file-name-masks 
		            '("\\.py\\'" flymake-pyflakes-init))) 

(add-hook 'find-file-hook 'flymake-find-file-hook)
;(require 'color-theme)
;(color-theme-initialize)
;(setq color-theme-is-global t)
;(color-theme-dark-laptop)
;(mouse-wheel-mode t)
;(menu-bar-mode)
;(scroll-bar-mode)
;(tool-bar-mode)

;; Ropemacs bindings for python autocompletion
(eval-after-load "python-mode"
  '(progn
     (require 'pymacs)
     (pymacs-load "ropemacs" "rope-")))
(load-library "~/.emacs.d/markdown-mode.el")
(setq auto-mode-alist (append '((".md" . markdown-mode)) auto-mode-alist))
(load-library "~/.emacs.d/haml-mode.el")
(load-library "~/.emacs.d/sass-mode.el")
(setq auto-mode-alist (append '((".sass" . sass-mode)) auto-mode-alist))
(load-library "~/.emacs.d/csv-mode.el")
(setq auto-mode-alist (append '((".csv" . csv-mode)) auto-mode-alist))
(load-library "~/.emacs.d/yaml-mode.el")
(add-to-list 'auto-mode-alist '(".yml" . yaml-mode))
(load-library "~/.emacs.d/auto-install.el")
(load-library "~/.emacs.d/tsv-mode.el")
(autoload 'tsv-mode "tsv-mode" "A mode to edit table like file" t)
(autoload 'tsv-normal-mode "tsv-mode" "A minor mode to edit table like file" t)
;; Protobuf editing
(load-library "~/.emacs.d/protobuf-mode.el")
(setq auto-mode-alist (append '((".proto" . protobuf-mode)) auto-mode-alist))

  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))

  (add-hook 'protobuf-mode-hook
    (lambda () (c-add-style "my-style" my-protobuf-style t)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9))
(global-auto-revert-mode t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(load-library "crosshairs")
(set-face-attribute 'highlight nil :foreground 'unspecified)
(set-face-attribute 'vline nil :foreground 'unspecified)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "#222"))))
 '(highlight ((t (:background "#222")))))
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'ido)
(ido-mode t)
