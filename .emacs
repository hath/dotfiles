(load-theme 'wombat)

(setq help-char "C-?")


(defun newline-below ()
  "move to end of line and then insert a new line."
  (interactive)
  (end-of-line)
  (newline)
)

(defun newline-above ()
  "move to end of line and then insert a new line."
  (interactive)
  (end-of-line)
  (newline)
)


(global-set-key (kbd "C-o") 'newline-below)
(global-set-key (kbd "C-S-o") 'newline-above)

(global-set-key (kbd "C-?") 'help-command)

;C-hjkl movement keybindings
(global-set-key (kbd "C-j") 'next-line)

;added this to make C-k kill blank line only and not the one below
(setq kill-whole-line t)

;tab completion, tab first adjusts indentation and then if it's correct it auto-completes
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
