((magit-branch nil)
 (magit-commit nil)
 (magit-diff
  (("--" "ssDefs.py")
   "--no-ext-diff" "--stat")
  (("--" "deploy/GMPN.py")
   "--no-ext-diff" "--stat")
  ("--no-ext-diff" "--stat")
  ("--no-ext-diff"))
 (magit-dispatch nil)
 (magit-fetch nil)
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
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
 (magit-pull nil)
 (magit-push nil)
 (magit-rebase nil)
 (magit-reset nil)
 (magit-revert nil)
 (magit:-- "fsim.py" "" "ssDefs.py" "factor/*" "deploy/*" "deploy/GMPN.py"))
