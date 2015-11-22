;; package 
(require 'package)
(add-to-list 'package-archives'
  ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives'
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; python set
(elpy-enable)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)
;; jedi
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)
(add-to-list 'interpreter-mode-alist
                         '("/home/qxoo/virtual_env/bin/python" . python-mode))

;; set neotree key
(global-set-key [f5] 'neotree-toggle)
;;(defun neotree-ffip-project-dir ()
;;    "Open NeoTree using the git root."
;;    (interactive)
;;    (let ((project-dir (ffip-project-root))
;;          (file-name (buffer-file-name)))
;;      (if project-dir
;;          (progn
;;            (neotree-dir project-dir)
;;            (neotree-find file-name))
;;        (message "Could not find git project root."))))  
;;(global-set-key (kbd "<f4>") 'neotree-ffip-project-dir)
;; set etags key
(global-set-key [f12] 'visit-tags-table)
;; set line num
(global-set-key [f6] 'linum-mode)

;; debug
(defun add-py-debug ()  
      "add debug code and move line down"  
    (interactive)  
    (move-beginning-of-line 1)  
    (insert "import pdb; pdb.set_trace();
"))  
(defun remove-py-debug ()  
  "remove py debug code, if found"  
  (interactive)  
  (let ((x (line-number-at-pos))  
    (cur (point)))  
    (search-forward-regexp "^[ ]*import pdb; pdb.set_trace();")  
    (if (= x (line-number-at-pos))  
    (let ()  
      (move-beginning-of-line 1)  
      (kill-line 1)  
      (move-beginning-of-line 1))  
      (goto-char cur))))
;; python indentation  
(defun python-indentation-keys ()
    (local-set-key (kbd "C-c ]") 'python-indent-shift-right)
    (local-set-key (kbd "C-c [") 'python-indent-shift-left)
)
(defun set-my-pdb ()
  (local-set-key (kbd "<f7>") 'add-py-debug)
  (local-set-key (kbd "<f8>") 'remove-py-debug)
)
(add-hook 'python-mode-hook 'set-my-pdb)
(add-hook 'python-mode-hook 'python-indentation-keys)

;; disable pyfly
;;(setq elpy-modules(delq 'elpy-module-flymake elpy-modules))

;; autopair
(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)

;; env
(setenv "VIRTUAL_ENV" "/Users/qx-oo/my_env")

;; load plugin 
(let ((default-directory "~/.emacs.d/site-lisp/")) 
    (normal-top-level-add-subdirs-to-load-path))

;; meta window
(require 'window-numbering)
(window-numbering-mode 1)
(winner-mode 1)

;; set eshell 
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH"))) 
(setq exec-path (append exec-path '("/usr/local/bin" "/opt/bin")))

;; theme set 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq molokai-theme-kit t)
(load-theme 'molokai)

  

;; markdown set
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; 取消工具栏
;;(tool-bar-mode -1)

;;去掉菜单栏
(menu-bar-mode -1)

;; 设置C->键作为窗口之间的切换
(global-set-key (kbd "C->") 'other-window)

;; Irc online chat
(require 'erc)
(global-set-key [f9] 'erc)

;; set undo 
(global-set-key (kbd "C-/") 'undo)
(put 'upcase-region 'disabled nil)

;; org-mode
(setq org-log-done 'note)


;; 多行初始快捷键 M-; 或者comment-or-uncomment-region绑定键 
