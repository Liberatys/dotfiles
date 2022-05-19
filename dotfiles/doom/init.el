;;; init.el -*- lexical-binding: t; -*- (Received feedback by CCC - Nicola regarding import)

(doom! :input
       :completion

       (company           ; the ultimate code completion backend
        +auto               ; as-you-type code completion
        +childframe      ; a nicer company UI (Emacs 26+ only)
        )
        (vertico +icons)
       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       (emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       modeline          ; snazzy, Atom-inspired modeline, plus API
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       tabs              ; a tab bar for Emacs
       treemacs ; a project drawer, like neotree but cooler
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       multiple-cursors  ; editing in many places at once
       snippets          ; my elves. They type so I don't have to

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ibuffer         ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       (spell +flyspell) ; tasing you for misspelling mispelling
       grammar           ; tasing grammar mistake every you make

       :tools
       (debugger
        +lsp)
       docker
       editorconfig      ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       (lookup +dictionary)              ; navigate your code and its documentation
       lsp
       terraform
       magit             ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       pdf               ; pdf enhancements
       prodigy           ; FIXME managing external services & code builders
       taskrunner        ; taskrunner for all your projects
       ;;tmux              ; an API for interacting with tmux

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS

       :lang
       cc                ; C > C++ == 1
       crystal           ; ruby at the speed of c
       ledger
       ;;data              ; config/data formats
       (dart +flutter)   ; paint ui and not much else
       elixir            ; erlang done right
       emacs-lisp        ; drown in parentheses
       (go +lsp)         ; the hipster dialect
       json              ; At least it ain't XML
       (java +lsp) ; the poster child for carpal tunnel syndrome
       (javascript +lsp +tide)        ; all(hope(abandon(ye(who(enter(here))))))
       latex             ; writing papers in Emacs has never been so fun
       (org              ; organize your plain life in plain text
        +roam
        +dragndrop       ; drag & drop files/images into org buffers
        ipython          ; ipython support for babel
        +pandoc          ; export-with-pandoc support
        +pomodoro        ; be fruitful with the tomato technique
        +present)        ; using org-mode for presentations
       markdown          ; writing docs for people to ignore
       org               ; organize your plain life in plain text
       plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       (python
        ;; +pyenv
        ;; +conda
        +pyright
        +lsp)            ; beautiful is better than ugly
       (ruby +rails +lsp)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       web               ; the tubes
       (yaml +lsp)
       nix
       :email
       (mu4e +gmail +org)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       (default +bindings +smartparens))
