;;; Copyright © 2024 Luis Guilherme Coelho lgcoelho@disroot.org
;;; Copyright © 2026 nick <nicholascaitong@gmail.com>

(define-module (tuco system monitoring)
  #:export (ram-total))

;; From radix channel https://codeberg.org/anemofilia/radix/
;; radix/modules/radix/system/monitoring.scm
(define (ram-total)
  "Returns the total available ram in bytes."
  (call-with-input-file "/proc/meminfo"
    (lambda (port)
      (let ((_ (read port)))
        (* 1000 (read port))))))
