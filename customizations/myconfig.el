; prefer buffers to split horizontally if there is enough space
(setq split-height-threshold nil)
(setq split-width-threshold 80)

; bind projectile command key to Super
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
; avoid alien indexing method so that .projectile can be used
(setq projectile-indexing-method 'native)
(setq projectile-sort-order 'modification-time)

; set project directory
(setq projectile-project-search-path '("~/Projects/"))

; set keybind for projectile-compile-project + RET
;(global-set-key (kbd "s-k") projectile-compile-project)

; turn on fci-mode automatically for all files
(add-hook 'after-change-major-mode-hook 'fci-mode)

; fill-column default
(setq-default fill-column 80)

;; and for specific major modes
(add-hook 'markdown-mode-hook
  (lambda ()
    (set-fill-column 100)))

;; Fira code as default font
(set-frame-font "Fira Code 11" nil t)

;; fill sentences
(defun fill-sentence ()
  (interactive)
  (save-excursion
    (or (eq (point) (point-max)) (forward-char))
    (forward-sentence -1)
    (indent-relative t)
    (let ((beg (point))
          (ix (string-match "LaTeX" mode-name)))
      (forward-sentence)
      (if (and ix (equal "LaTeX" (substring mode-name ix)))
          (LaTeX-fill-region-as-paragraph beg (point))
        (fill-region-as-paragraph beg (point))))))

(global-set-key (kbd "M-j") 'fill-sentence)

; smooth scrolling
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 5)

; smooth scrolling - mouse
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelarate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

; multiple cursors keybinding
(global-set-key (kbd "C-c m") 'mc/edit-lines)
