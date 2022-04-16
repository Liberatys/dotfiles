;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nick Flueckiger")
(setq user-mail-address "nick.anthony.flueckiger@hey.com")

(setq doom-theme 'doom-gruvbox)
(setq notes-base "~/notes")

(setq org-base-path notes-base)
(setq org-agenda-files '(notes-base))

(setq org-agenda-files (list notes-base))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

(use-package! ledger-mode)
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

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(delete-selection-mode 1)

(setq undo-limit 8000
      evil-want-fine-undo t
      truncate-string-ellipsis "…")

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(setq +ivy-buffer-preview t)

(display-time-mode 1)
(doom-modeline-mode 1)

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

(map! :desc "Save buffer" :n "C-s" #'save-buffer)
(map! :desc "Format Buffer" :n "C-z" #'+format/buffer)
(map! :desc "Magit" :n "C-g" #'magit)
(map! :desc "Agenda" :n "C-a" #'org-agenda)
(map! :desc "Find file" :n "C-f" #'find-file)
(map! :desc "Find fuzzy" :n "C-p" #'+default/find-file-under-here)
(map! :desc "Treemacs" :n "C-c o" 'treemacs)
(map! :desc "IBuffer" :n "C-c b" 'ibuffer)
(map! :desc "Ripgrep" :n "C-q" '+vertico/project-search)
(map! :desc "Start of line" :n "F" #'beginning-of-line)
(map! :desc "End of line" :n "T" #'end-of-line)

(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)

(global-set-key (kbd "C-SPC") 'execute-extended-command)
(global-set-key (kbd "C-a") 'normal-mode)

(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-l") 'evil-window-right)

(evilem-default-keybindings "SPC")

(which-key-mode)

(add-hook 'projectile-after-switch-project-hook (lambda ()
                                                  (projectile-invalidate-cache nil)))
(setq org-confirm-babel-evaluate nil)

(use-package ledger-mode
  :ensure t
  :init
  (setq ledger-clear-whole-transactions 1)

  :config
  (add-to-list 'evil-emacs-state-modes 'ledger-report-mode)
  :mode "\\.dat\\'")
