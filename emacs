(require 'package)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(desktop-save-mode t)
 '(evil-flash-delay 30)
 '(ido-enable-flex-matching t)
 '(jdee-global-classpath (quote ("." "/usr/local/algs4/algs4.jar")))
 '(jdee-server-dir "/usr/local/lib/jdee-bundle/")
 '(package-selected-packages (quote (erlang jdee solarized-theme evil))))
 ;;'(evil-symbol-word-search t)
 '(inhibit-startup-screen t)
 '(show-trailing-whitespace t)
 '(org-startup-indented t)
 '(org-startup-truncated nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ************ evil ************
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "M-.") 'erlang-find-tag)
(define-key evil-insert-state-map (kbd "RET") 'newline-and-indent)
(define-key evil-normal-state-map (kbd "M-*") 'pop-tag-mark)
(evil-set-initial-state 'term-mode 'emacs)
(setq-default evil-symbol-word-search t)

;; ************ org *************
;collapse w/ tab in plain text parts
(setq org-cycle-emulate-tab 'white)
;hides blank lines between headings which keeps folded view nice and compact.
(setq org-cycle-separator-lines 0)
;prevents creating blank lines before headings but allows list items to adapt to existing blank lines around the items:
(setq org-blank-before-new-entry (quote (((plain-list-item . auto)))))
;customizing the org workflow tags:
(setq org-todo-keywords '((sequence "TODO" "WORK" "|" "DONE")))

;;************ solarized ************
;;prevents solarized to change font size
(setq solarized-use-variable-pitch nil
      solarized-scale-org-headlines nil)
;;solarized color theme
(add-hook 'after-init-hook (lambda () (load-theme 'solarized-light)))


;;************ highlight words ************
(add-hook 'erlang-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\|elsziva\\|ELSZIVA\\)" 1 font-lock-warning-face t)))))

;;hide toolbar
(tool-bar-mode 0)
;;make system copy/paste work with Emacs copy/paste
(setq x-select-enable-clipboard t)
;; I hate tabs:
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
; ignore case
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)
(delete-selection-mode 1)
(setq visible-bell t)
(global-linum-mode -1)
(global-hl-line-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
(column-number-mode)
;;show lines longer than 80
(require 'whitespace)
(setq whitespace-style '(face lines-tail trailing))
(global-whitespace-mode t)
;;buffer switching
(require 'ido)
(ido-mode t)
;;resize main frame on startup
(setq default-frame-alist '( (height . 65) (width . 150) ))
;;show the full path of file in title bar
(setq frame-title-format "%b - %f")
(server-start)
