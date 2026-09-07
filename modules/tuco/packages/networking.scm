;;; Copyright © 2026 nick <nicholascaitong@gmail.com>

(define-module (tuco packages networking)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages prometheus)
  #:use-module (gnu packages python)
  #:use-module (gnu packages serialization)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:))
 
(define-public cloudflared
  (package
    (name "cloudflared")
    (version "2026.8.3")
    (source (origin
              (method git-fetch)
              (uri
               (git-reference
                 (url "https://github.com/cloudflare/cloudflared")
                 (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "07j6i4wzbgf0lh21wkxf2q0md07wrn6wxkcy6ilwlckg7jhcyzxp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:go go-1.26
      #:import-path "github.com/cloudflare/cloudflared/cmd/cloudflared"
      #:unpack-path "github.com/cloudflare/cloudflared"
      ))
    (propagated-inputs (list go-github-com-quic-go-quic-go
                         go-github-com-cloudflare-backoff
                         go-github-com-coreos-go-oidc-v3
                         go-github-com-coreos-go-systemd-v22
                         go-github-com-facebookgo-grace
                         go-github-com-fortytw2-leaktest
                         go-github-com-fsnotify-fsnotify
                         go-github-com-getsentry-sentry-go
                         go-github-com-go-chi-chi-v5
                         go-github-com-go-chi-cors
                         go-github-com-go-jose-go-jose-v4
                         go-github-com-gobwas-ws
                         go-github-com-google-gopacket
                         go-github-com-google-uuid
                         go-github-com-gorilla-websocket
                         go-github-com-ipostelnik-cli-v2
                         go-github-com-json-iterator-go
                         go-github-com-mattn-go-colorable
                         go-github-com-mitchellh-go-homedir
                         go-github-com-pkg-errors
                         go-github-com-prometheus-client-golang
                         go-github-com-prometheus-client-model
                         go-github-com-rs-zerolog
                         go-github-com-shirou-gopsutil-v4
                         go-github-com-stretchr-testify
                         go-go-opentelemetry-io-contrib-propagators-autoprop
                         go-go-opentelemetry-io-otel
                         go-go-opentelemetry-io-otel-exporters-otlp-otlptrace
                         go-go-opentelemetry-io-otel-sdk
                         go-go-opentelemetry-io-otel-trace
                         go-go-opentelemetry-io-proto-otlp
                         go-go-uber-org-automaxprocs
                         go-go-uber-org-mock
                         go-golang-org-x-crypto
                         go-golang-org-x-net
                         go-golang-org-x-sync
                         go-golang-org-x-sys
                         go-golang-org-x-term
                         go-google-golang-org-protobuf
                         go-gopkg-in-natefinch-lumberjack-v2
                         go-gopkg-in-yaml-v3
                         go-nhooyr-io-websocket
                         go-zombiezen-com-go-capnproto2))
    (home-page "https://github.com/cloudflare/cloudflared")
    (synopsis "Cloudflare Tunnel client")
    (description "This package contains the command-line client for Cloudflare
Tunnel, a tunneling daemon that proxies traffic from the Cloudflare network to
your origins.  This daemon sits between Cloudflare network and your
origin (e.g. a webserver).  Cloudflare attracts client requests and sends them
to you via this daemon, without requiring you to poke holes on your firewall
--- your origin can remain as closed as possible.  Extensive documentation can
be found in the
@@url{https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel,Cloudflare
Tunnel section} of the Cloudflare Docs.  All usages related with proxying to
your origins are available under @@code{cloudflared tunnel help}.")
    (license license:asl2.0)))

(define-public go-github-com-facebookgo-clock
  (package
    (name "go-github-com-facebookgo-clock")
    (version "0.0.0-20150410010913-600d898af40a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/clock")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1z3jxwsqll65il7rcdx5j4dggg6w143z24h3agk09xvsc2iyj7a2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/facebookgo/clock"))
    (home-page "https://github.com/facebookgo/clock")
    (synopsis "clock")
    (description
     "Clock is a small library for mocking time in Go.  It provides an interface
around the standard library's @@url{http://golang.org/pkg/time/,(code time)}
package so that the application can use the realtime clock while tests can use
the mock clock.")
    (license license:expat)))

(define-public go-github-com-facebookgo-ensure
  (package
    (name "go-github-com-facebookgo-ensure")
    (version "0.0.0-20200202191622-63f1cf65ac4c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/ensure")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05vi49g2967i5awcb1z69i2n5b5hwn06682kw90x81hbxlr0px36"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/facebookgo/ensure"))
    (propagated-inputs (list go-github-com-davecgh-go-spew
                             go-github-com-facebookgo-stack
                             go-github-com-facebookgo-subset))
    (home-page "https://github.com/facebookgo/ensure")
    (synopsis "ensure")
    (description
     "Package ensure provides utilities for testing to ensure the given conditions are
met and Fatal if they aren't satisified.")
    (license license:bsd-3)))

(define-public go-github-com-facebookgo-grace
  (package
    (name "go-github-com-facebookgo-grace")
    (version "0.0.0-20180706040059-75cf19382434")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/grace")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15chyvgv5y59w9x2asm0vh29cmmcji7f5vxvv8gqcr15nkyi61q0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/facebookgo/grace/gracehttp"
      #:unpack-path "github.com/facebookgo/grace"))
    (propagated-inputs (list go-github-com-facebookgo-gracenet
                             go-github-com-facebookgo-httpdown))
    (home-page "https://github.com/facebookgo/grace")
    (synopsis "grace")
    (description
     "Package grace provides a library that  makes it easy to build socket based
servers that can be gracefully terminated & restarted (that is, without dropping
any connections).")
    (license license:expat)))

(define-public go-github-com-facebookgo-gracenet
  (package
    (name "go-github-com-facebookgo-gracenet")
    (version "0.0.0-20180706040059-75cf19382434")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/grace")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15chyvgv5y59w9x2asm0vh29cmmcji7f5vxvv8gqcr15nkyi61q0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/facebookgo/gracenet/gracenet"
      #:unpack-path "github.com/facebookgo/gracenet"))
    (home-page "https://github.com/facebookgo/grace")
    (synopsis "grace")
    (description
     "Package grace provides a library that  makes it easy to build socket based
servers that can be gracefully terminated & restarted (that is, without dropping
any connections).")
    (license license:expat)))

(define-public go-github-com-facebookgo-httpdown
  (package
    (name "go-github-com-facebookgo-httpdown")
    (version "0.0.0-20180706035922-5979d39b15c2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/facebookarchive/httpdown")
              (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15pqkvqb2b3rcs1nh7wv4vzwafx65a8knlivf718ikf3a0z2k8xk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/facebookgo/httpdown"))
    (propagated-inputs (list go-github-com-facebookgo-clock
                             go-github-com-facebookgo-stats
                             ))
    (home-page "https://github.com/facebookgo/httpdown")
    (synopsis "httpdown")
    (description
     "Package httpdown provides http.@code{ConnState} enabled graceful termination of
http.Server.")
    (license license:expat)))

(define-public go-github-com-ipostelnik-cli-v2
  (package
    (name "go-github-com-ipostelnik-cli")
    (version "1.22.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ipostelnik/cli")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n8lk58j7bdsp47yh5bcpsw38lhkbyzcy3203ffkawc2rvkf1pp7"))))
    (build-system go-build-system)
    (arguments
     (list #:test-flags
           #~(list "-skip" "TestApp_RunAsSubCommandIncorrectUsage|TestToMan")
           #:import-path "github.com/ipostelnik/cli"))
    (propagated-inputs (list go-github-com-burntsushi-toml
                             go-github-com-cpuguy83-go-md2man-v2
                             go-gopkg-in-yaml-v2
                             go-github-com-urfave-cli))
    (home-page "https://github.com/ipostelnik/cli")
    (synopsis "cli")
    (description
     "Package cli provides a minimal framework for creating and organizing command
line Go applications.  cli is designed to be easy to understand and write, the
most simple cli application can be written as follows:.")
    (license license:expat)))

(define go-github-com-quic-go-quic-go
  (package
    (name "go-github-com-quic-go-quic-go")
    (version "0.62.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/quic-go/quic-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0h6rw93pck8il6b5mphbm35iaxf16vx6nhk6vcjcqqkpfkahvm4f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:go go-1.26
      #:import-path "github.com/quic-go/quic-go"
      ;; Network access is required.
      #:test-flags #~(list "-skip" "TestHandshake|TestHTTP3StreamPriority")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'pre-check
            (lambda* (#:key tests? import-path #:allow-other-keys)
              (setenv "GODEBUG" "asynctimerchan=0"))))))
    (propagated-inputs (list go-github-com-quic-go-go-ossfuzz-seeds
                             go-github-com-quic-go-qpack
                             go-github-com-stretchr-testify
                             go-go-uber-org-mock
                             go-golang-org-x-crypto
                             go-golang-org-x-net
                             go-golang-org-x-sync
                             go-golang-org-x-sys))
    (home-page "https://github.com/quic-go/quic-go")
    (synopsis "A QUIC implementation in pure Go")
    (description
     "quic-go is an implementation of the QUIC protocol
(@@url{https://datatracker.ietf.org/doc/html/rfc9000,RFC 9000},
@@url{https://datatracker.ietf.org/doc/html/rfc9001,RFC 9001},
@@url{https://datatracker.ietf.org/doc/html/rfc9002,RFC 9002}) in Go.")
    (license license:expat)))

(define-public go-github-com-facebookgo-stack
  (package
    (name "go-github-com-facebookgo-stack")
    (version "0.0.0-20160209184415-751773369052")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/stack")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07yr05mz7h007ldpij90zjflwgixp148sbyrdlh1fj5bikr4p8m3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/facebookgo/stack"))
    (home-page "https://github.com/facebookgo/stack")
    (synopsis "stack")
    (description
     "Package stack provides utilities to capture and pass around stack
traces.")
    (license license:bsd-3)))

(define-public go-github-com-facebookgo-stats
  (package
    (name "go-github-com-facebookgo-stats")
    (version "0.0.0-20151006221625-1b76add642e4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/stats")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "112jgw7w6c0gvf2pgpmm9dmabcqwn6krj3hr4v9abkfwsk1xd7jn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/facebookgo/stats"))
    (propagated-inputs (list go-github-com-facebookgo-ensure))
    (home-page "https://github.com/facebookgo/stats")
    (synopsis "stats")
    (description
     "Package stats defines a lightweight interface for collecting statistics.
It doesn't provide an implementation, just the shared interface.")
    (license license:bsd-3)))

(define-public go-github-com-facebookgo-subset
  (package
    (name "go-github-com-facebookgo-subset")
    (version "0.0.0-20200203212716-c811ad88dec4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/subset")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1sjczgmq26mgqvh7267saypnn4sfdjx467wsm1pgdhyss77mc650"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/facebookgo/subset"))
    (home-page "https://github.com/facebookgo/subset")
    (synopsis "subset")
    (description
     "Package subset implements logic to check if a value is a subset of
another using reflect.")
    (license license:bsd-3)))

(define-public go-github-com-facebookgo-clock
  (package
    (name "go-github-com-facebookgo-clock")
    (version "0.0.0-20150410010913-600d898af40a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/facebookarchive/clock")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1z3jxwsqll65il7rcdx5j4dggg6w143z24h3agk09xvsc2iyj7a2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/facebookgo/clock"))
    (home-page "https://github.com/facebookgo/clock")
    (synopsis "clock")
    (description
     "Clock is a small library for mocking time in Go.  It provides an interface
around the standard library's @@url{http://golang.org/pkg/time/,(code time)}
package so that the application can use the realtime clock while tests can use
the mock clock.")
    (license license:expat)))

(define-public go-zombiezen-com-go-capnproto2
  (package
    (name "go-zombiezen-com-go-capnproto2")
    (version "v2.18.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/zombiezen/go-capnproto2")
              (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09mz05iwcfz2gfbv02k2nzzgijc5yhpm5gy9h3hmgxppghj4j4my"))))
    (build-system go-build-system)
    (arguments
     (list
      #:test-flags
      #~(list "-vet=off" "-skip"
              (string-append "TestInterface|"
                             "TestMarshalShouldMatchTextWhenDecoded|"
                             "TestMarshalPackedShouldMatchTextWhenDecoded"))
      #:import-path "zombiezen.com/go/capnproto2"))
    (propagated-inputs (list go-golang-org-x-net
                             go-github-com-kylelemons-godebug))
    (native-inputs (list capnproto))
    (home-page "https://zombiezen.com/go/capnproto2")
    (synopsis "Cap'n Proto implementation for Go")
    (description
     "Cap'n Proto is a massively fast data interchange format and
capability-based RPC system.")
    (license license:expat)))
