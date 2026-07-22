;;; copyright.el --- Insert a Guix copyright.  -*- lexical-binding: t; -*-

;; Copyright © 2020 Oleg Pykhalov <go.wigust@gmail.com>

;;; Commentary:

;; This package provides skeleton to insert a copyright with `guix-copyright'.

;;; Code:

(define-skeleton guix-copyright
  "Insert a copyright by $USER notice at cursor."
  "FULL_NAME <MAIL_ADDRESS>: "
  comment-start
  ";; Copyright © " `(format-time-string "%Y") " "
  (or (format "%s <%s>" user-full-name user-mail-address) str)
  comment-end)

;;; copyright.el ends here
