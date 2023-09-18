(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-font-list
   '((1 "" "" "\\mathcal{" "}") (2 "\\textbf{" "}" "\\mathbf{" "}")
     (3 "\\textsc{" "}") (5 "\\emph{" "}")
     (6 "\\textsf{" "}" "\\mathsf{" "}")
     (9 "\\textit{" "}" "\\mathit{" "}") (12 "\\textulc{" "}")
     (13 "\\textmd{" "}") (14 "\\textnormal{" "}" "\\mathnormal{" "}")
     (18 "\\textrm{" "}" "\\mathrm{" "}")
     (19 "\\textsl{" "}" "\\mathbb{" "}")
     (20 "\\texttt{" "}" "\\mathtt{" "}") (21 "\\textup{" "}")
     (23 "\\textsw{" "}") (4 "" "" t) (75 "" "" "\\mathfrak{" "}")))
 '(connection-local-criteria-alist
   '(((:application tramp :machine "Rylees-MacBook-Pro.local")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile)
     ((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "ipo3912l200.rad.rutgers.edu")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . tramp-ps-time)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (ttname . string)
                                          (time . tramp-ps-time)
                                          (nice . number)
                                          (etime . tramp-ps-time)
                                          (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number)
                                          (group . string) (comm . 52)
                                          (state . string)
                                          (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . number)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null"))))
 '(custom-file "~/.config/emacs-customize.el")
 '(custom-safe-themes
   '("26149a1b5de476aa661bbb9c8f79540509c038fbba58c1c719466851c2968464"
     "f5e666fba0ded6ae9be004314ecf5f7feb605cdb84711b5c5ffd81acfb831183"
     "d761e13c0132ff8ded1e6d78c11da8ab24847181a421a1cb2c7baeb582344fb6"
     "ba7668593f457e1d7eaa496359d442270c0f11716baba30a437b7119157530c2"
     "7824a9288587969287aa044f19c2bc09e8f79c01afae033700b58cf023e5627f"
     "6c62af5597f559f469d63d9124a78ab14ae8077edefb7cc32f3be431df68fa8b"
     "dccd2fc19efdd84ea8a82048d0ffa10bd3eea15b47f671c8037481cac9229dbd"
     "859c337b799607120700a96e9fec45f815094bd5f0940b54389effa003c7e8f3"
     "ac517f97b146492d0ffb9216a9b68900add7af7f14374996003abc0da990e9d9"
     "c6d06b827acf5ecef6fc211186e40724bb95c01b2965eaa7497928dc0263f69a"
     "69bdf19e640ef7417b496a7bb70ea4f8727ae86ca0a652c4d17fa7031686fd01"
     "c00b033ab6a6c1d2b3a93847feb8a6a68bc45f76ec2c3c62f06dfe06e356c0ad"
     "6e5bcd28d7a027427984a5e49616cfcd11948b34fd849298020996587b0e1266"
     "8ee41a07bb67a220cbd4338890a8fe00de290267f5ce55ccc116d87cf5dea9e0"
     "9207506c7d2461e9dfa7915bbcd00b87ce424d5b92a5012154d2986263024dab"
     "b45dd8b071757ff67b18798bc946be49d5c81eddb71206f1217cd5700d651c67"
     "cd8244f57c5c48c8b5743a35cf98669f4743753bbe5db913666cc9583e30c2b1"
     "c30e58bc261915075c9bdcbff38cfb6be79235078ec531e56dd1a75a9aa85e69"
     "f0860b29511c58f9f020a4e0cd5df2d052475f21229a47fc1e8a40d9c2577a41"
     "328e367b4e7335820189a763d94b173bdc806c970242c4dd24eb866d84fdb0b2"
     "5f3754245bc87255953aafc3266fcb294eb044d1e9684e161b32254ecb07f8f7"
     "eff4b8762c96a5a1bda2ab108f30541f23f476d62aeb8b9ca9be17ffefbec54f"
     "51722d03f365e82b8f199303b0ceb3f8af709f67f780b45b102b5f59d19b016d"
     "5d255ca842be909774b85cf4f695f6075361bfaa2e01aed9032be89bade7057a"
     "4886e177d8390193392c00a147aeb34012989bef9a6981b77a6d80341bfc200a"
     "4342ff831185dc06bac36c3caf1ab83f35531420b7debec0983ccbe28aad51d5"
     "c9d1b3ba44c9b39afe9e25aa01b2e3c5a61fb4e0aee642f8ec31120f5620e56a"
     "0c75e07bcf5eea5eb375124b33094704f955b52b611d578312fcb19c073223c5"
     "dd6c757e1b42ff4a1a66f6782e0f371811e952d3fb217fa13177db04eae9660c"
     "2f53ddd4fc439a391d65eaf66c443cf57c8ff2394173fe56d51d5c5b2d69f0c6"
     "0e84f2f9a4089cb10feeb48e973e798c697cf4f014b5338c63f9fd7e9f0779d5"
     "5cd260faeeae54662f609b2963dd923c30127ae4a33f312c34cd293fe6918bc5"
     "98b3782a4b53817f50b2c4b7ed94fdf526649907e06e9aa9f3e0016c685e1fdf"
     "56853860e42dd3e6bbb1b5b448aa70db754fa2c99defa722879a1c91f28d87b6"
     "989058f5a1bc17437cc072469bb25483fab32a533f73a88d75ccc2b61976767a"
     "7048393fd24ce469c3e14c7a8701df534477a26561e18787a118d8a2f0927ac8"
     "9001c98c492ffdaa1cf8ba67bb8f576e4b733b34a1a6245e6c951436bef15d32"
     "f1fe852c3c6cea35a1d6a9711e5dc5f39f4cf848554b4d48363fafa9e7be2e6b"
     "3aa1b3585be4212c218257360d8b41d7bbed09b203455fc1d24928af1c344830"
     "5c576dbd156d2bab35a96fe35c859615e7b90d42e2d139f1204567a73eb5c105"
     "31e2c1c54a879ba93213d8b7f1030d058e48d477632a833054b9168dc1d2a7c7"
     "eaf98e54d9dd1f928efd279e6d3ebda34721acd6d44f44dea1abb956fddcaf98"
     "814f168d93dbaa397a4be077df18d68af9ed2bf0b97fafb7047f804ab98da0d5"
     "31bdcb32edfb5437fe5ec24f33b59cf21c8a23ae0d9e7a240c7bf720f6095358"
     "5c437f41bcf57f4d536f8bbc1486ba8a96e264d35e17c1aa6cdd215ff76fd067"
     "de7069756ef3eb833113191b90604e82f7a68d8afa22ccc613e04477fc7fff9a"
     "c7d89c5de2e3d46b69a2d5c5b9b3a0b103dc3e8cc12eb90cbf1e39a23774b074"
     "52bfaf1f5041d9dce075f113065bcd61bfe58b840c60ad0e3078feff6dd00eb6"
     "e5613d533434611e2069ca336514113c1d054f59b48beba8f62afce21a0d803e"
     "29d9300ec888e4798e92e366566f021fb9eb1c904354f41330df1cb7f4c79154"
     "26d3ffdd5380720b5fccc44c3a877146efb5e15051fc2915f0c635ca162e8f4d"
     "9c7a53451183f08258fe7c7a0c710bd73451dc7c2574c3e51f69bc76efb0f35c"
     "452bdc8227386030765a8678bb8b4a1773f8f76c603acf42618cdbc726e3c963"
     "da9df8330e10a29e84cfe4d2d6c6e6a2e8d5c9b7972f0e2468fa1cf84367909d"
     "6b4827818b80749743302265edbea2b3c4308a320e7d392010300b8dd8ea41b2"
     "94670e8e96d6f8671d0c98c9a96bde4b6b318c5dd3333af89933ef90286494a5"
     "92900c6407d52a3bab4e146b9f09c5cc5c006cb5ee4fdbf0d9dfa07a34b1ae25"
     "4ed14fc0c418335c94e9e3e5e5397dff5af9bd989786782718baecafbe315353"
     "74a309f88535bda13e7a18e3d75c1afde9c71c0b22f2d8e1c36a7769e277abbc"
     "ba8259ab63959ce47958121762398ef790f7859b18c0727bf41ea85355415efd"
     "b61ec923e414af628f4d05838f20e22ffd8abb2dd26515ac347db771e380a65d"
     "48763fb017b7c36c3f528203f35b61ec2dc2ebdb5d71c546901a46b9c09e8844"
     "6ef2f6f1d1bcee4217f4bffaac8d7ed6f27800b1d41b75ea32b70d2170f90b5d"
     "b45a7f99e13f45ec33c3086c57f4b5ae8d20787db605031004e5074a71750361"
     "242966b58c4c120ffffc73a535bd9a6de79bc814ae9df8bc347064f447d28956"
     "bf797ee5d85227db8eb2ff58bb200eb8868f06c9eedbbf0aaefce18a24b9e1ba"
     "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077"
     default))
 '(package-selected-packages
   '(tempel-collection ligature lua-mode all-the-icons dap-C dap-mode
                       lsp-treemacs lsp-ui exec-path-from-shell
                       flycheck auctex-latexmk use-package corfu
                       vertico lsp-mode elcord preview-dvisvgm
                       preview-latex auctex evil))
 '(preview-dvisvgm-image-type 'svg)
 '(shell-file-name "/bin/bash")
 '(treesit-font-lock-level 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
