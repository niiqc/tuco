;;; Copyright © 2026 nick <nicholascaitong@gmail.com>

(define-module (tuco packages games)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages vulkan)
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (lsfg-vk))

(define lsfg-vk
  (package
    (name "lsfg-vk")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri
               (git-reference
                 (url "https://git.lsfg-vk.dev/lsfg-vk.git")
                 (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1rhva77l6n79m2m1hhj94rda6hpp0k0qsib41gvmwmaxs9lkz7dy"))))
    (build-system cmake-build-system)
    (outputs '("out"))
    (arguments
     (list #:build-type "Release"
           #:generator "Ninja"
           #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_CXX_COMPILER=clang++"
                   "-DLSFGVK_BUILD_LAYER=ON"
                   "-DLSFGVK_BUILD_UI=ON"
                   "-DLSFGVK_BUILD_CLI=ON"
                   "-DLSFGVK_MANAGED=ON"
                   (string-append "-DLSFGVK_LAYER_LIBRARY_PATH=" #$output
                                  "/lib/liblsfg-vk-layer.so"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-programs
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (vk  (string-append (assoc-ref inputs "vulkan-loader")
                                              "/lib")))
                     (for-each
                      (lambda (prog)
                        (wrap-program (string-append out "/bin/" prog)
                          `("LD_LIBRARY_PATH" ":" prefix (,vk))))
                      '("lsfg-vk-cli" "lsfg-vk-ui"))))))))
    (native-inputs
     (list clang-toolchain))
    (inputs
     (list libglvnd
           qtbase
           qtdeclarative
           vulkan-headers
           vulkan-loader))
    (home-page "https://lsfg-vk.dev/")
    (synopsis "LSFG-VK hooks into Vulkan applications and generates additional
frames")
    (description "The lsfg-vk project ports the most popular feature from the
Windows-exclusive Lossless Scaling program to Linux. Through the use of a
Vulkan layer, it hooks into Vulkan applications and generates additional
frames using Lossless Scaling’s frame generation.")
    (license license:expat)))
