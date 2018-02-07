;; a simple major mode, commonlog-mode

(setq commonlog-highlights
      '(
        ("^[0-9:.TZ-]+" . font-lock-function-name-face) ;;timestamp
        ("\\(cri\\|maj\\):[a-zA-Z_]*:" . font-lock-warning-face) ;;critical/major + block name
        ("min:[a-zA-Z_]*:" . font-lock-keyword-face) ;; minor + block name
        ("inf:[a-zA-Z_]*:" . font-lock-constant-face) ;;info + block name
        ("<[0-9]+\.[0-9]+\.[0-9]+>" . font-lock-type-face) ;;PIDs
        ("^[0-9:.TZ-]+[a-z_]+:[a-z_]+:\"[^\"]*\":\\([a-z_0-9A-Z]+\\)" . (1 font-lock-type-face)) ;;process names
        ("\\([0-9]+\\)" . (1 font-lock-function-name-face)) ;;numeric constant
        ))

(define-derived-mode commonlog-mode fundamental-mode "commonlog"
  "major mode for editing common.log.* files."
  (setq font-lock-defaults '(commonlog-highlights)))
