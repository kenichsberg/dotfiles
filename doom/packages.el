;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
(package! transient
  :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440"
  :recipe (:host github :repo "magit/transient"))

(package! with-editor
  :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab"
  :recipe (:host github :repo "magit/with-editor"))


(unpin! cider clojure-mode clj-refactor)
(unpin! jet neil)

(unpin! straight)
(package! key-chord)

;; (package! clojure-mode :pin "3453cd229b412227aaffd1dc2870fa8fa213c5b1")
;; (package! clj-refactor :pin "b5abe655e572a6ecfed02bb8164b64716ef76b8e")
;; (package! cider :pin "1ed5163433c991c00ea83fdd4447e8daf4aeccbe")
;; (when (and (modulep! :checkers syntax)
;;            (not (modulep! :checkers syntax +flymake)))
;;   (package! flycheck-clj-kondo :pin "ff7bed2315755cfe02ef471edf522e27b78cd5ca"))
;; (package! jet :pin "f007660c568e924e32d486a02aa4cd18203313cc")
;; (package! neil
;;   :recipe (:host github :repo "babashka/neil" :files ("*.el"))
;;   :pin "1dbac785cee4af8ad499839adbb83a8a297e7c70")
