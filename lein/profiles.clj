{:user {:plugins [[org.clojars.weavejester/lein-clojars "0.8.0"]
                  [lein-autoexpect "1.0"]
                  [lein-marginalia "0.7.1"]
                  [lein-exec "0.3.1"]
                  [lein-droid "0.2.3"]]
        :android {:sdk-path "/usr/local/Cellar/android-sdk/23.0.2"}
        :dependencies [[slamhound "1.5.5"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :jvm-opts ["-XX:+CMSClassUnloadingEnabled" "-XX:MaxPermSize=256M"]}}