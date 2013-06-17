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

(custom-set-variables
 '(help-at-pt-timer-delay 0.9)
 '(help-at-pt-display-when-idle '(flymake-overlay)))
