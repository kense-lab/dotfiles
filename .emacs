(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("org"   . "http://orgmode.org/elpa/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line
(defun require-package (package) (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-magit magit helm org neotree evil-tabs evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans" :foundry "Bits" :slant normal :weight normal :height 113 :width normal)))))


;; Enable Server Start
;(server-start)
(require 'server)
(unless (server-running-p) (server-start))

;; Default Full Screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Enable Evil
(evil-mode 1)

;; Enable Evil Leader
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(global-set-key (kbd "C-u") 'evil-scroll-page-up)
(global-set-key (kbd "C-S-u") 'start-kbd-macro)
(evil-leader/set-key
  "fe" 'neotree-toggle
  "ff" 'neotree-find
  "q" 'delete-window
  "w" 'save-buffer
  "ps" 'helm-projectile-ag)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Bookmarks
(setq bookmark-default-file "~/.emacs.d/bookmarks"
      bookmark-save-flag 1) ;; save after every change

;; Neotree
(add-to-list 'load-path "/some/path/neotree")
(setq neo-window-fixed-size nil)
(setq neo-window-width 30)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "l") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "i") 'neotree-enter-horizontal-split)
(evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-enter-vertical-split)

;; Window
(define-key evil-motion-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-motion-state-map (kbd "C-k") #'evil-window-up)
(define-key evil-motion-state-map (kbd "C-l") #'evil-window-right)

;; Org Mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; Hide Bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Fcitx
(add-to-list 'load-path "/home/kense/.emacs.d/plugins/evil-fcitx.el")
(require 'evil-fcitx)

;; Helm
;; change default prefix key
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; helm-M-x
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)
;; helm-kill-ring
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; helm-mini
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
;; helm-find-files
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Helm Projectile
(projectile-global-mode)
(helm-projectile-on)
(define-key evil-normal-state-map (kbd "C-n") nil)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(global-set-key (kbd "C-S-p") 'helm-projectile-find-file-in-known-projects)

;; Buffer
(global-set-key (kbd "M-p") 'previous-buffer)
(global-set-key (kbd "M-n") 'next-buffer)

;; Evil Tabs
;(global-evil-tabs-mode t)

;; Magit
(require 'evil-magit)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)
