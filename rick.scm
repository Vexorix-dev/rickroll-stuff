(define (open-rickroll)
  (let ((url "https://www.youtube.com/watch?v=dQw4w9WgXcQ"))
    (cond
      ((eq? (system-type) 'windows) (system (string-append "start " url)))
      ((eq? (system-type) 'darwin) (system (string-append "open " url)))
      (else (system (string-append "xdg-open " url))))))  ; Assume Linux

(define (main)
  (let* ((command "curl ascii.live/rick")
         (output (with-output-to-string
                   (lambda ()
                     (system command)))))
    (if (string? output)
        (display output) ; Print command output
        (begin
          (display "Command failed.\n")
          (open-rickroll)))))

(main)