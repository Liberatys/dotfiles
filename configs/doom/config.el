;;; config.el -*- lexical-binding: t; -*-

; Personal Information
(setq user-full-name "Nick Flueckiger")
(setq user-mail-address "nick.anthony.flueckiger@hey.com")

; Themes / UI
(setq doom-theme 'doom-gruvbox)
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 20 :weight 'light)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font Mono" :size 20))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; ORG

(setq notes-base "~/notes")
(setq org-base-path notes-base)
(setq org-agenda-files '(notes-base))
(setq org-agenda-files (list notes-base))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))
(setq confirm-kill-emacs nil)

(setq org-refile-file-path (concat org-base-path "/" "refile.org"))
(setq org-journal-file-path (concat org-base-path "/" "journal.org"))
(setq org-journal-dir (concat org-base-path "/" "journals"))
(setq org-journal-file-type :weekly)
(setq org-journal-file-format "%W-%Y-journal.org")
(setq org-journal-prefix-key "C-c j")
(setq org-directory org-base-path)
(setq display-line-numbers-type t)
(setq default-directory org-base-path)
(setq calendar-week-start-day 1)

; LEDGER
(use-package! ledger-mode)
(use-package ledger-mode
  :ensure t
  :init
  (setq ledger-clear-whole-transactions 1)

  :config
  (add-to-list 'evil-emacs-state-modes 'ledger-report-mode)
  :mode "\\.dat\\'")

; General
(display-time-mode 1)
(doom-modeline-mode 1)
(delete-selection-mode 1)

(setq undo-limit 8000
      evil-want-fine-undo t
      truncate-string-ellipsis "…")

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

(setq lsp-headerline-breadcrumb-enable t)
(setq dumb-jump-selector 'ivy)
(setq ns-pop-up-frames nil)
(setq key-chord-two-keys-delay 0.3)
(global-subword-mode 1)
(setq display-line-numbers-type 'relative)

(defun get-journal-file-today ()
  "Return filename for today's journal entry."
  (let ((daily-name (format-time-string "%Y%m%d")))
    (expand-file-name (concat org-journal-dir daily-name))))

(set-face-attribute 'default nil :height 150)

(defun journal-file-today ()
  "Create and load a journal file based on today's date."
  (interactive)
  (find-file (get-journal-file-today)))

(add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode))
(setq doom-fallback-buffer-name "► Emacs"
      +doom-dashboard-name "► Doom")

(setq centaur-tabs-style "rounded")

(setq org-default-notes-file (concat org-base-path "/" "organizer.org"))

(setq org-agenda-span 'llllDAY)

; JAVA
(setq lsp-enable-on-type-formatting nil)
(setq lsp-java-format-enabled nil)

(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-SPC") 'execute-extended-command)
(global-set-key (kbd "C-a") 'normal-mode)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "C-l") 'evil-window-right)
(global-set-key (kbd "C-c w") '+workspace/switch-to)

(map! :desc "Agenda" :n "C-a" #'org-agenda)
(map! :desc "End of line" :n "T" #'end-of-line)
(map! :desc "Find file" :n "C-f" #'find-file)
(map! :desc "Find fuzzy" :n "C-p" #'+default/find-file-under-here)
(map! :desc "Format Buffer" :n "C-z" #'+format/buffer)
(map! :desc "IBuffer" :n "C-c b" 'ibuffer)
(map! :desc "Magit" :n "C-g" #'magit)
(map! :desc "Ripgrep" :n "C-q" '+vertico/project-search)
(map! :desc "Save buffer" :n "C-s" #'save-buffer)
(map! :desc "Start of line" :n "F" #'beginning-of-line)
(map! :desc "Treemacs" :n "C-c o" 'treemacs)

(evilem-default-keybindings "SPC")

(which-key-mode)

(setq org-confirm-babel-evaluate nil)

; Projectile
(setq projectile-enable-caching nil)
(add-hook 'projectile-after-switch-project-hook (lambda ()
                                                  (projectile-invalidate-cache nil)))

; Set empty main project
(defvar projectile-main-project nil)

(defun use-main-project (&rest args)
  "Skip calling `projectile-project-root' when there is a main project defined."
  (when projectile-main-project
    projectile-main-project))

(defun set-main-project (&optional dir)
  "Set the projectile main project based on the current buffer.
  When called with argument DIR, make that main project instead."
  (interactive)
  (if dir
    (setq projectile-main-project dir)
    (let ((current-project))
      (let ((projectile-main-project nil))
        (setq current-project (projectile-project-root)))
      (setq projectile-main-project current-project))))

(defadvice projectile-project-root ( around use-main-project activate)
  "Use the current main project, if any."
  (if projectile-main-project
      (setq ad-return-value projectile-main-project)
      ad-do-it))

(add-hook 'projectile-after-switch-project-hook (lambda ()(set-main-project)))
