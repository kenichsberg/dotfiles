;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Ken Nakayama"
      user-mail-address "kn1017356@gmail.com")

(setq doom-theme 'doom-outrun-electric)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
(setq doom-font (font-spec :family "Fira Code" :size 15 :weight 'Regular)
      ;; doom-variable-pitch-font (font-spec :family "Fira Code" :size 12)
      ;; doom-unicode-font (font-spec :family "Fira Code" :size 12)
      )
;; (setq doom-font nil)

(setq display-line-numbers-type t)
(setq org-directory "~/org/")
(setq undo-limit 80000000
      evil-want-fine-undo t
      auto-save-default t
      inhibit-compacting-font-caches t
      truncate-string-ellipsis "…")




(after! cider
  (setq cider-print-fn 'fipp)
  (setq cider-print-options '(("print-level" 50)))

  ;; Use cider-debugger in evil-mode
  (defun cider-debug-toggle-insert-state ()
    (if cider--debug-mode
        (evil-insert-state)
      (evil-normal-state)))

  ;; (setq cider-repl-pop-to-buffer-on-connect t)
  ;; (remove-hook 'cider--debug-mode-hook #' evil-normalize-keymaps)
  ;; (remove-hook 'cider--debug-mode-hook #' +clojure--cider-setup-debug)
  ;; (add-hook 'cider--debug-mode-hook 'evil-normalize-keymaps)
  ;; (add-hook 'cider--debug-mode-hook '+clojure--cider-setup-debug)
  (add-hook 'cider--debug-mode-hook 'cider-debug-toggle-insert-state)
  (set-popup-rule! "^\\*cider-repl*" :size 0.5 :side 'right :select nil :quit nil :ttl nil)
  ;;(set-popup-rule! "^\\*cider-error*" :size 0.4 :side 'bottom :select t :quit t)

  (setq cljr-assume-language-context 'clj)

  (setq cider-eldoc-display-for-symbol-at-point nil) ; disable cider showing eldoc during symbol at point

  (setq clojure-indent-style 'align-arguments)
  (setq clojure-align-forms-automatically nil)
  )


(use-package evil
  :hook (after-init . evil-mode)
  :general
  (:states '(normal motion visual)
           ;; swap ':' with ';' to save my left pinky finger
           ";" 'evil-ex
           ":" 'evil-repeat-find-char))



;; Key-mappings
;; (require 'key-chord)
;; (key-chord-mode 1)
;; (setq key-chord-one-key-delay 0.4)
;; (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(after! evil
  (require 'key-chord)
  (key-chord-mode 1)
  (setq key-chord-one-key-delay 0.4)
  (setq key-chord-safety-interval-forward 0.001)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (map! :leader
        :desc "Clear search highlight"
        "s c"
        #'evil-ex-nohighlight))


(map! (:localleader
       (:map (clojure-mode-map clojurescript-mode-map)
             "=" #'cider-format-defun
             "+" #'clojure-align
             (:prefix ("e" . "eval")
                      "f" #'cider-eval-defun-at-point
                      "F" #'cider-insert-defun-in-repl
                      ";" #'cider-pprint-eval-last-sexp-to-comment)
             (:prefix ("i")
                      "p" #'cider-inspector-pop))
       (:map (sql-mode-map)
        ;; "e" #'run-sql
        :v "v" #'sql-send-region
        :n "e" #'sql-send-paragraph
        "c" #'sql-connect))
      (:leader
       (:map (clojure-mode-map clojurescript-mode-map emacs-lisp-mode-map)
             (:prefix ("k" . "lisp")
                      ;; https://ebzzry.com/en/emacs-pairs/
                      "j" #'sp-join-sexp
                      "x" #'sp-split-sexp
                      "r" #'sp-raise-sexp

                      "d" #'sp-kill-sexp
                      "D" #'sp-kill-hybrid-sexp
                      "i" #'my/kill-insert
                      "I" #'my/kill-insert-hybrid

                      "y" #'sp-copy-sexp
                      "u" #'sp-unwrap-sexp
                      "(" #'sp-wrap-round
                      "[" #'sp-wrap-square
                      "{" #'sp-wrap-curly

                      "#" #'my/cl-comment

                      "s" #'sp-forward-slurp-sexp ;; [foo bar] baz -> [foo bar baz]
                      "S" #'sp-backward-slurp-sexp
                      "b" #'sp-forward-barf-sexp ;; [foo bar baz] -> [foo bar] baz
                      "B" #'sp-backward-barf-sexp

                      "t" #'sp-transpose-sexp))
       (:map evil-window-map
             (:prefix "w"
                      "m" #'my/toggle-maximize-buffer
                      "u" #'winner-undo
                      "r" #'winner-redo
                      "." #'+hydra/window-nav/body
                      "a" #'ace-window
                      )))
      (:after ivy
       :map ivy-minibuffer-map
       "C-d" #'ivy-switch-buffer-kill))

(map! :leader
      :desc "key map redifined"
      "Esc" #'switch-to-last-buffer
      )

(map! :leader
      :desc "Paredit functions"
      ;; "l (" #'sp-wrap-round
      ;; "l {" #'sp-wrap-curly
      ;; "l [" #'sp-wrap-square
      ;; "l w" #'sp-wrap-round
      ;; "l W" #'sp-wrap-curly
      ;; "l s" #'sp-forward-slurp-sexp
      ;; "l b" #'sp-forward-barf-sexp
      ;; "l r" #'raise-sexp
      ;; "l c" #'sp-convolute-sexp
      ;; "l d" #'sp-kill-sexp
      ;; "l y" #'sp-copy-sexp
      ;; "l u" #'sp-splice-sexp
      ;; "l t" #'sp-transpose-sexp
      "l i" #'qdzo-clj-instrument-scope
      "l l" #'qdzo-clj-let-to-global
      ;; "l =" #'cider-format-defun
      ;; "l v" #'mark-sexp
      )


;; run-sql
(defun do-run-sql ()
  (interactive)
  (save-excursion
    ;; Take SQL
    (search-backward "----")
    (setq p1 (point))
    (search-forward  "----")
    (search-forward  "----")
    (setq sql (buffer-substring p1 (point)) )
    ;; Take psql connection string
    (search-backward "---- db:")
    (setq conn (substring (buffer-substring (point) (line-end-position)) 8 ))


    (write-region (format "\\timing\n%s" sql) nil "/tmp/sql")
    ;;(setq cmd (format "echo  \"\"\"\n%s\"\"\" | psql %s" (shell-quote-argument sql) conn))
    ;;(setq cmd (format "psql %s <<EOF\n%s\nEOF " conn sql ))

    (setq cmd (format "psql %s -f /tmp/sql"  conn))
    ;; print SQL
    ;;(setq cmd (format "psql %s -f /tmp/sql -E"  conn))

    (with-output-to-temp-buffer "*SQL Result*"
      (set-buffer "*SQL Result*")
      (funcall (intern "sql-mode"))
      ;;(insert  cmd)
      (insert (shell-command-to-string cmd)))))

(defun run-sql ()
    (interactive)
    (if (equal major-mode 'sql-mode)
        (do-run-sql))
    )

(define-key evil-normal-state-map (kbd "RET") 'run-sql)


;; persist-scope
(defun qdzo-clj-insert-persist-scope-macro ()
  (interactive)
  (insert
   "(defmacro persist-scope
              \"Takes local scope vars and defines them in the global scope. Useful for RDD\"
              []
              `(do
                  (println \"Persist scoped fn called at\" ~(meta &form))
                  ~@(map (fn [v] `(def ~v ~v))
                          (keys (cond-> &env (contains? &env :locals) :locals)))))"))


(defun qdzo-clj-instrument-scope ()
  (interactive)
  (let ((beg (point)))
    (qdzo-clj-insert-persist-scope-macro)
    (cider-eval-region beg (point))
    (delete-region beg (point))
    (insert "(persist-scope)")
    (cider-eval-defun-at-point)
    (delete-region beg (point))
    ;; (insert "#_(persist-scope)")
    ;; (qdzo-make-new-overlay beg)
    ))


(defun qdzo-clj-let-to-global ()
  (interactive)
  (let ((beg (region-beginning))
        (end (region-end)))
    (goto-char end)
    (insert ")")
    (goto-char beg)
    (insert "(def ")
    (cider-eval-region beg (+ end 6))
    (goto-char beg)
    (delete-char 5)
    (goto-char end)
    (delete-char 1)
    ))


;; ;; Settings for lsp
;; (setq gc-cons-threshold 90)
;; (setq read-process-output-max (* 1024 1024 3))
;; (setq lsp-idle-delay 0.500)
;; (setq lsp-log-io nil)

;; zen-lsp
(require 'lsp-mode)

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection "/home/ken/projects/hs/zen-lsp/vscode-extension/debug-srv")
  :major-modes '(clojure-mode)
  :add-on? t
  :activation-fn (lsp-activate-on "clojure")
  :server-id 'zen-lang))
