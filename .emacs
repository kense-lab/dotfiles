(setq package-archives '(("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("org-cn"   . "http://orgmode.org/elpa/")
                         ("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
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
 '(custom-enabled-themes (quote (doom-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("cb96a06ed8f47b07c014e8637bd0fd0e6c555364171504680ac41930cfe5e11e" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "1d50bd38eed63d8de5fcfce37c4bb2f660a02d3dff9cbfd807a309db671ff1af" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" "07e3a1323eb29844e0de052b05e21e03ae2f55695c11f5d68d61fb5fed722dd2" "4daff0f7fb02c7a4d5766a6a3e0931474e7c4fd7da58687899485837d6943b78" "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "72fda75af7caddec17ba9b49d2f99703c20a5f5f5c4dcec641d34a0b83569e88" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "6e2d579b02aadc933f434003f49d269d004f5c7094eb53658afbacc817761d83" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "a038af4fff7330f27f4baec145ef142f8ea208648e65a4b0eac3601763598665" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "74a42b2b5dde1057e66bcf4c241789213e0ed5b77a2ee41c982fdc8c2abe9d98" "d5f8099d98174116cba9912fe2a0c3196a7cd405d12fa6b9375c55fc510988b5" "d261bb8f66be37752791a67f03dd24361592ce141b32d83bcbe63ec1c738b087" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "774aa2e67af37a26625f8b8c86f4557edb0bac5426ae061991a7a1a4b1c7e375" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "88a3c267ce2132defd46f2a4761925983dcbc35b1c3cfff1dded164ce169fed4" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "ca849ae0c889eb918785cdc75452b1e11a00848a5128a95a23872e0119ccc8f4" "0809c08440b51a39c77ec5529f89af83ab256a9d48107b088d40098ce322c7d8" "ec8246f6f74bfe0230521412d88092342c17c1c0448a4b8ba39bddd3da170590" "559b28ae6deb74713fee9064e7ece54cb71ba645f44acbf81ad7916a4f947815" "1c8171893a9a0ce55cb7706766e57707787962e43330d7b0b6b0754ed5283cda" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (google-translate auto-complete awesome-tab w3m lsp-vue lsp-mode highlight-parentheses google-c-style diminish web-mode vue-mode markdown-mode doom-modeline doom-themes evil-magit magit helm org neotree evil)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "MS  " :slant normal :weight normal :height 120 :width normal)))))

;; Enable Server Start
                                        ;(server-start)

(require 'server)
(unless (server-running-p) (server-start))

;; use-package setup
;; install if not yet installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package diminish
  :ensure t
  :defer t)
(use-package bind-key
  :ensure t
  :defer t)

;; Default Full Screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-margin 3)
(setq scroll-step 3)

;; Enable Evil
(evil-mode 1)

;; Enable Evil Leader
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(global-set-key (kbd "C-u") 'evil-scroll-up)
(global-set-key (kbd "C-S-u") 'start-kbd-macro)
(evil-leader/set-key
  "fe" 'neotree-toggle
  "ff" 'neotree-project-dir-toggle
  "q" 'delete-window
  "w" 'save-buffer
  "ps" 'helm-projectile-ag
  ;; "mm" 'evil-show-marks
  ;; "bb" 'buffer-menu-other-window
  "mm" 'helm-mark-ring
  "bb" 'helm-buffers-list
  )

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Bookmarks
(setq bookmark-default-file "~/.emacs.d/bookmarks"
      bookmark-save-flag 1) ;; save after every change

;; Neotree
(use-package neotree
  :ensure t
  :init
  (setq neo-window-fixed-size nil)
  (setq neo-window-width 30)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "K") 'neotree-select-up-node)
  (evil-define-key 'normal neotree-mode-map (kbd "J") 'neotree-select-down-node)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "y y") 'neotree-copy-filepath-to-yank-ring)
  (evil-define-key 'normal neotree-mode-map (kbd "X") 'neotree-collapse-all)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "i") 'neotree-enter-horizontal-split)
  (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-enter-vertical-split)
  (setq inhibit-compacting-font-caches t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
                                        ;(setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action))

(defun neotree-project-dir-toggle ()
  "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
  (interactive)
  (let ((project-dir
         (ignore-errors
              ;;; Pick one: projectile or find-file-in-project
                                        ; (projectile-project-root)
           (ffip-project-root)
           ))
        (file-name (buffer-file-name))
        (neo-smart-open t))
    (if (and (fboundp 'neo-global--window-exists-p)
             (neo-global--window-exists-p))
        (neotree-hide)
      (progn
        (neotree-show)
        (if project-dir
            (neotree-dir project-dir))
        (if file-name
            (neotree-find file-name))))))

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
(add-to-list 'load-path "/home/kense/.emacs.d/plugins/evil-fcitx")
(require 'evil-fcitx)

;; Helm
;; change default prefix key
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Helm Projectile
(projectile-global-mode)
(helm-projectile-on)
(define-key evil-normal-state-map (kbd "C-n") nil)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(global-set-key (kbd "C-S-p") 'helm-projectile-find-file)
(define-key evil-insert-state-map (kbd "C-n") 'ac-start)
(define-key evil-insert-state-map (kbd "C-p") 'ac-start)
(setq projectile-require-project-root nil)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)
(setq projectile-globally-ignored-directories
      (append '(
                ".vim"
                ".git"
                ".svn"
                ".idea"
                ".vscode"
                ".mvn"
                "dist"
                "node_modules")
              projectile-globally-ignored-directories))
(setq projectile-globally-ignored-files
      (append '(
                ".DS_Store"
                )
              projectile-globally-ignored-files))

;; Buffer
(global-set-key (kbd "M-p") 'previous-buffer)
(global-set-key (kbd "M-n") 'next-buffer)

;; Tabs
;; (use-package awesome-tab
;;   :load-path "/home/kense/.emacs.d/plugins/awesome-tab/"
;;   :init
;;   (evil-define-key 'normal awesome-tab-mode-map (kbd "g t") 'awesome-tab-forward-tab)
;;   (evil-define-key 'normal awesome-tab-mode-map (kbd "t n") 'awesome-tab-forward-tab)
;;   (evil-define-key 'normal awesome-tab-mode-map (kbd "t p") 'awesome-tab-backward-tab)
;;   (evil-define-key 'normal awesome-tab-mode-map (kbd "g T") 'awesome-tab-backward-tab)
;;   :config
;;   (awesome-tab-mode t)
;;   (setq awesome-tab-style "zigzag"))

;; ;; (defun awesome-tab-buffer-groups-function (x)

;; (defun awesome-tab-hide-tab (x)
;;   (let ((name (format "%s" x)))
;;     (or
;;      (string-prefix-p "*" name)
;;      (string-prefix-p " *" name)
;;      (and (string-prefix-p "magit" name)
;;           (not (file-name-extension name)))
;;      )))
;; (global-set-key (kbd "M-p") 'awesome-tab-forward-group)
;; (global-set-key (kbd "M-n") 'awesome-tab-backward-group)

;; Magit
(require 'evil-magit)

;; Esc quits
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

;; Doom Modelline
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Open Config
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs"))

(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "C-<f5>") 'load-file)

;; Auto complate
(require 'auto-complete-config)
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (setq ac-delay 0)
  (setq ac-auto-show-menu 0)
  (setq ac-quick-help-delay 0.5)
  (define-key ac-completing-map (kbd "C-p") 'ac-expand-previous)
  (define-key ac-completing-map (kbd "C-n") 'ac-expand)
  )

;; Use C-tab to autocomplete the files and directories
;; based on the two commands `comint-dynamic-complete-filename`
;; and `comint-dynamic-list-filename-completions`
(defun atfd ()
  (interactive)
  ;; (comint-dynamic-list-filename-completions)
  (comint-dynamic-complete-as-filename))
(global-set-key ( kbd "C-c k" ) 'atfd)

(defun my-code-mode-config ()
  (hs-minor-mode t)
  (auto-fill-mode 0)
  ;; (whitespace-mode t)
  (set (make-local-variable 'electric-indent-mode) nil))

(add-hook 'java-mode-hook 'my-code-mode-config)
(add-hook 'web-mode-hook  'my-code-mode-config)
(add-hook 'emacs-lisp-mode-hook 'my-code-mode-config)

;; Global Options
(global-hl-line-mode 1)

(add-to-list 'auto-mode-alist '("\\.java\\'" . c-mode))

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

(use-package web-mode
  :mode ("\\.vue\\'" "\\.html\\'" "\\.js\\'" "\\.css\\'" "\\.scss\\'" "\\.wxml\\'")
  :config
  (setq-default indent-tabs-mode nil)
  (setq web-mode-indent-level 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

;; pair
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(electric-pair-mode 1)
(setq electric-pair-pairs
      '((?\" . ?\")
        (?\{ . ?\})
        (?\' . ?\')
        (?\< . ?\>)))

;; Google Translate
(use-package web-mode
  :config
  (setq-default google-translate-enable-ido-completion t)
  (setq-default google-translate-default-source-language "en")
  (setq-default google-translate-default-target-language "zh-CN")
  (eval-after-load 'google-translate-core
    '(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
           google-translate-listen-url "http://translate.google.cn/translate_tts"))
  (eval-after-load 'google-translate-tk
    '(setq google-translate--tkk-url "http://translate.google.cn/"))
  (evil-leader/set-key
    "tt" 'google-translate-at-point
    "tr" 'google-translate-at-point-reverse
    "tT" 'google-translate-query-translate
    "tR" 'google-translate-query-translate-reverse
    ))
