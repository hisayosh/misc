(add-to-list 'load-path"~/.emacs.d")
(add-to-list 'load-path"~/.emacs.d/themes")
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta) 
(fset 'yes-or-no-p 'y-or-n-p)
(setq indent-tabs-mode nil)
(global-font-lock-mode 1)

(require 'linum)
(line-number-mode 1)
(column-number-mode 1)  ;; Line numbers on left most column
(global-linum-mode 1)

(auto-compression-mode 1)
(setq tramp-default-method "ssh")

(require 'color-theme)
(color-theme-clarity)
(defface hl-line '((t (:background "DarkSlateGrey")))
 "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default

(setq c-default-style "linux" c-basic-offset 8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU GLOBAL(gtags)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))
;; c-modeで自動的にgtags-modeに切り替える
(add-hook 'c-mode-common-hook
          '(lambda ()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))
