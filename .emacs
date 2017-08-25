(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(make-backup-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 显示行号
(global-linum-mode t)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; 自动补全
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

;; lisp实现
(add-to-list 'load-path "~/.emacs.d/slime/")
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup '(slime-fancy))

;; 快速窗口切换
(add-to-list 'load-path "~/.emacs.d/plugins/window-numbering/")
(require 'window-numbering)  
(window-numbering-mode 1)

;; color-theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)

;; f11设置透明度
(global-set-key [(f11)] 'loop-alpha)  
(setq alpha-list '((100 100) (65 35)))  
(defun loop-alpha ()  
  (interactive)  
  (let ((h (car alpha-list)))                ;; head value will set to  
    ((lambda (a ab)  
       (set-frame-parameter (selected-frame) 'alpha (list a ab))  
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))  
       ) (car h) (car (cdr h)))  
    (setq alpha-list (cdr (append alpha-list (list h))))  
    )  
)

;; 光标移到行的中间
(defun middle-of-line ()  
  "Put cursor at the middle point of the line."  
  (interactive)  
  (goto-char (/ (+ (point-at-bol) (point-at-eol)) 2)))  
(global-set-key (kbd "C-d") 'middle-of-line)

;; ace-jump-mode
(add-to-list 'load-path "~/.emacs.d/plugins/ace-jump-mode/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-j") 'ace-jump-mode)

;; 跳转到指定行
(define-key global-map (kbd "C-g") 'goto-line)

;; eww配置
(with-eval-after-load 'eww
  (custom-set-variables
   '(eww-search-prefix "https://cn.bing.com/search?q="))

  (define-key eww-mode-map (kbd "r") 'eww-reload)

  (define-key eww-mode-map (kbd "b") 'eww-back-url)
  (define-key eww-mode-map (kbd "f") 'eww-forward-url)

  (define-key eww-mode-map (kbd "h") 'eww-list-histories)
  (define-key eww-mode-map (kbd "m") 'eww-list-bookmarks)
  (define-key eww-mode-map (kbd "a") 'eww-add-bookmark)
  (define-key eww-mode-map (kbd "e") 'eww-browse-with-external-browser)
  (define-key eww-mode-map (kbd "i") 'eww)
  )

(when (fboundp 'eww)
  (progn
    (defun xah-rename-eww-hook ()
      "Rename eww browser's buffer so sites open in new page."
      (rename-buffer "eww" t))
    (add-hook 'eww-mode-hook 'xah-rename-eww-hook)))
