((magit-branch nil)
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat")
  (("--" "MLDefs.py")
   "--no-ext-diff" "--stat")
  (("--" "ssDefs.py")
   "--no-ext-diff" "--stat")
  (("--" "deploy/GMPN.py")
   "--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-fetch nil)
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n256" "--decorate")
  ("-n256"
   ("--" "fsim.py")
   "--graph" "--decorate")
  ("-n256"
   ("--" "ssDefs.py")
   "--graph" "--decorate")
  ("-n256"
   ("--" "factor/*")
   "--graph" "--decorate")
  ("-n256"
   ("--" "deploy/*")
   "--graph" "--decorate"))
 (magit-merge nil)
 (magit-patch nil)
 (magit-pull nil
             ("--rebase"))
 (magit-push nil
             ("--force"))
 (magit-rebase nil)
 (magit-remote
  ("-f"))
 (magit-reset nil)
 (magit-revert
  ("--edit")
  nil)
 (magit-stash nil)
 (magit-submodule nil
                  ("--force" "--recursive"))
 (magit:-- "MLDefs.py" "" "fsim.py" "ssDefs.py" "factor/*" "deploy/*" "deploy/GMPN.py"))
