(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(csv-separators (quote (";" "," "|")))
 '(indicate-buffer-boundaries (quote ((top . left) (bottom . left) (up . left) (down . left))))
 '(inhibit-startup-screen t)
 '(major-mode (quote text-mode))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(size-indication-mode t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(csv-separator-face ((t (:background "blue" :foreground "gold")))))

;;
;; Kriss's configuration

;-----------------Generic config----------------------
;;; Turn on debugging (comment this out for normal use)
;; (setq debug-on-error t)
;; (setq debug-init t)


(setq user-full-name    "Kriss Lu")
(setq user-mail-address "kriss.lu@ericsson.com")

(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-8)


(setq url-proxy-services '(("http" . "www-proxy.ao.ericsson.se:8080")))

(setq fill-column 80)
(setq default-tab-width 4)


;; make the help, apropos and completion windows the right height for their
;; contents
(temp-buffer-resize-mode t) 

;ctrl+mouse_left_click
(setq mouse-buffer-menu-mode-mult 1)


;; do not consider case significant in completion
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;do not show any init content in *scratch* buffer
(setq initial-scratch-message nil)
;initial mode for *scratch* buffer
(setq initial-major-mode 'text-mode)

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files


(global-font-lock-mode t) ;syntax highlight
(global-auto-revert-mode 1);auto refresh
(global-linum-mode t)
(global-hl-line-mode 1) ; turn on highlighting current line
;Long lines that go over window width can be displayed so that they are wrapped
;at word boundary, not cutting a word in half into the next line.
(global-visual-line-mode 1) ;


;If the cursor gets too close to the mouse, displace the mouse
;a random distance & direction.
(mouse-avoidance-mode 'animate)
(setq mouse-avoidance-threshold 2)
(setq mouse-avoidance-nudge-dist 1)
(setq mouse-avoidance-nudge-var  2)

(setq enable-recursive-minibuffers t)


(require 'generic) 
(require 'generic-x)

; keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key [(f10)] 'recentf-open-files)




(require 'icomplete) 
(icomplete-mode 99)



(setq browse-url-generic-program (executable-find "google-chrome")
    browse-url-browser-function 'browse-url-generic)

;;-------------------mode line --------------------------
;;display which function the cursor in in the minibuffer
(which-function-mode t) 
;;let all the main mode which support "which func mode" enable "which func mode"
(setq which-func-modes t)

(size-indication-mode 1) ; show the buffer size in mode line


;highlight entire brlacket expression
(setq show-paren-style 'expression) 


(setq echo-keystrokes  0.01) ;; delay for echo the key stroke in the mini bufffer
(setq suggest-key-bindings 1); wait 1 second

;delete seleted text when typing
(delete-selection-mode 1) 


;; When emacs asks for "yes" or "no", let "y" or "n" sufficide
(fset 'yes-or-no-p 'y-or-n-p)


(auto-image-file-mode)

(setq require-final-newline nil)

(set-background-color "#C7EDCC")


;ability to revert split pane config. Call winner-undo 【Ctrl+c ←】 and winner-redo 【Ctrl+c →】
(winner-mode 1)


(setq-default fill-column 70)


;mouse scroll only one line, more smooth scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

; try to improve slow performance on windows.
(setq w32-get-true-file-attributes nil)


;;display the file path on the title

(setq frame-title-format 
'("%S" (buffer-file-name "%f" 
        (dired-directory dired-directory "%b"))))


;; use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings 'meta)
;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t )

;;make buffer siwtch command show suggestions
;(require 'ido)
;(setq ido-enable-prefix nil)
;(setq ido-enable-case nil)
;(ido-mode t)

;;create mutiple scratch buffers
(add-to-list 'load-path "~/.emacs.d")
(require 'multi-scratch)
(setq multi-scratch-buffer-name "new")
(global-set-key [(f12)] 'multi-scratch-new)    


;;------------------- ediff ---------------------------------
(require 'ediff) 
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-merge-split-window-function 'split-window-horizontally)
; let the control panel in the same frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; aspell
(setq-default ispell-program-name  "aspell")


;;increase/descrease font size with mouse
;; For Linux
;(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
;(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
 
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;yank at point(cursor) rather than on click
(setq mouse-yank-at-point t)

(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
   This command is convenient when reading novel, documentation."
  (interactive)
  (if (eq (cdr (window-margins)) nil)
      (set-window-margins nil 460 (- (window-body-width) fill-column))
    (set-window-margins nil 500 nil) 
  )
) 


;-------------------- elpa -------------------------
(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
		         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("ELPA" . "http://tromey.com/elpa/") 
			 )
)

;-----------iswitch---------------
(iswitchb-mode 1)
;do not display the Emacs internal buffer
(setq iswitchb-buffer-ignore '("*"))

; allow left/right arrow key navigation of the buffer list
(defun iswitchb-local-keys ()
      (mapc (lambda (K) 
	      (let* ((key (car K)) (fun (cdr K)))
    	        (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match))
      )
)
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

;----------------ibuffer------------------
;use ibuffer to replace the default 'list-buffers(C-x C-b)
(defalias 'list-buffers 'ibuffer)


;----------------ido ------------------
;(ido-mode 1)


;------------------  dired --------------------
;when open a directory, the listing will be refreshed
(setq dired-auto-revert-buffer t)
;guess the target directory for move/copy operation
(setq dired-dwim-target t)

;ant Enter  and ^ (parent dir) to use the same buffer
;(define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file)
;(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file ".."))) 

(defun dired-open-in-external-app ()
  "Open the current file or dired marked files in external app."
  (interactive)
  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           (t (list (buffer-file-name))) ) ) )

    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files?") ) 
    )

    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList)
        )
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )  myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList) ) ) 
    ) 
  ) 
)

(defun dired-open-in-desktop ()
  "Show current file in desktop (OS's file manager)."
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux")
    (let ((process-connection-type nil)) (start-process "" nil "xdg-open" "."))
    ;; (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. ?? with nautilus
    ) 
  )
)

(require 'dired+)

;;---------------- tabbar-ruler------------------
(add-to-list 'load-path "~/.emacs.d/tabbar")
(require 'tabbar-ruler)
;(setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;;(setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;;(setq tabbar-ruler-popup-menu 't) ; auto hide menu
;;(setq tabbar-ruler-popup-toolbar 't) ; auto hide toolbar

 (setq tabbar-buffer-groups-function
          (lambda ()
            (list "All")))

(global-set-key [(control shift tab)] 'tabbar-backward-tab)
(global-set-key [(control tab)] 'tabbar-forward-tab)



  
;;----------------hide show----------------------
(require 'hideshowvis)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(autoload 'hideshowvis-minor-mode
   "hideshowvis"
   "Will indicate regions foldable with hideshow in the fringe."
   'interactive)


 (dolist (hook (list 'emacs-lisp-mode-hook
                     'c++-mode-hook))
             (add-hook hook 'hideshowvis-enable))

(hideshowvis-symbols)

;;--------------smooth scroll--------
(setq scroll-step            1
      scroll-conservatively  10000)

;; Leave point at same position in window when scrolling page
; t => preserve screen position for full scrren commands only
; 1 => preserve screen position for any scroll commands.
(setq scroll-preserve-screen-position 'foo)


;;------- highlight-symbol-------
(require 'highlight-symbol)

(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(control f3)] 'highlight-symbol-next)

(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(control meta f3)] 'highlight-symbol-query-replace)

;`highlight-symbol-at-point': toggle highlighting of the symbol at point throughout the current buffer.  
;`highlight-symbol-mode' to keep the symbol at point highlighted.
;The functions `highlight-symbol-next', `highlight-symbol-prev',`highlight-symbol-next-in-defun' and `highlight-symbol-prev-in-defun' allow for cycling through the locations of any symbol at point.
; `highlight-symbol-on-navigation-p' is set, highlighting is triggered regardless of `highlight-symbol-idle-delay'.


;;-- --- auto highlight------
;;(require 'idle-highlight-mode)

;;(autoload 'idle-highlight-mode "idle-highlight" "highlight the word the point is on" t)
;;(add-hook 'find-file-hook 'idle-highlight-mode)

;;------------list all the lines with the word under cursor:  M-s-O  -------
(require 'thingatpt)
 
(defun occur-at-point (nlines)
 (interactive "P")
 (occur (format "%s" (thing-at-point 'symbol)) nlines))
 
(define-key search-map "O" 'occur-at-point)

;;---------csv mode-------------
;(require 'csv-mode)


;;-------    org  -----------
;(setq org-startup-indented t)

(setq org-log-done t) ; add a time stamp to a DONE task
(setq org-agenda-files (list "c:/work/to_do_list.org"))
(define-key global-map "\C-ca" 'org-agenda)

;--------------Tramp---------------
;(require 'tramp)
;(setq tramp-default-mvethod "ssh")
;(setq shell-file-name "bash")
;(setq explicit-shell-file-name shell-file-name)

;(setq tramp-default-method "plink") ; for windows
;(setq shell-file-name "bash")
;(setq explicit-shell-file-name shell-file-name)
;(setq tramp-auto-save-directory "c:\\temp")


;---------------scala ------------------

;;(add-to-list 'load-path "~/.emacs.d/ensime_2.10.0-0.9.8.9/elisp/")
;;(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. 
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;------------- highlight change ------
;;(global-highlight-changes-mode 1)

;; (set-face-foreground 'highlight-changes nil)
;; (set-face-background 'highlight-changes "#c936ab")
;; (set-face-foreground 'highlight-changes-delete nil)
;; (set-face-background 'highlight-changes-delete "#686897")

;;----------------calendar -------------
;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
(setq calendar-latitude +39.9)
(setq calendar-longitude +116.4)
;;我的所在地－北京
(setq calendar-location-name "Beijing")
;;当退出日日历的时候把它自己建立的frame删除
(setq calendar-remove-frame-by-deleting t)
;;设定一周的开始为周一
;(setq calendar-week-start-day 1)

; disable 希伯来人的节日
(setq hebrew-holidays nil)

(setq general-holidays '((holiday-fixed 1 1 "元旦")
  (holiday-fixed 3 8 "妇女节")
  (holiday-fixed 4 1 "愚人节")
  (holiday-fixed 5 1 "劳动节")
  (holiday-fixed 10 1 "国庆节")
  (holiday-fixed 12 25 "圣诞节")
  ))

;(appt-activate 1)
;;在日历中突出标记节日和生日
(setq mark-holidays-in-calendar t)
;;打开calendar自动打开节日和生日列表
(setq view-calendar-holidays-initially t)



;;--------------Evil----------------------
(require 'evil)
(evil-mode 0)

;;--------------deskstop-----------------------
(load "desktop") 
(desktop-save-mode 1)
(setq history-length 250)
(setq desktop-load-locked-desktop t); Don't ask if you have an open previous desktop
(add-to-list 'desktop-globals-to-save 'file-name-history)


(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
