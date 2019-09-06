{:user {:plugins [[cider/cider-nrepl "0.21.1"]
                  [lein-autoexpect "1.0"]
                  ;[jonase/eastwood "0.2.1"]
                  [lein-exec "0.3.1"]
                  [lein-marginalia "0.7.1"]
                  [lein-pdo "0.1.1"]
                  [lein-ring "0.12.5"]
                ;_[lein-cljfmt "0.1.6"]
                  [org.clojars.weavejester/lein-clojars "0.8.0"]
                ;_[venantius/ultra "0.1.9"]
                ]
        :ultra  {:color-scheme :solarized_dark}
        :cljfmt {:indents
                 {require [[:block 0]]
                  ns [[:block 0]]
                  defproject [[:inner 1]]
                  }}
        :dependencies [[slamhound "1.5.5"]
                       [pjstadig/humane-test-output "0.9.0"]
                      ;_[jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                      ;_[cljfmt "0.1.6"]
                      ]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :jvm-opts ["-XX:+CMSClassUnloadingEnabled" "-XX:MaxPermSize=256M"]}

 :android-config {:android {:sdk-path "/usr/local/Cellar/android-sdk/23.0.2"}}}
