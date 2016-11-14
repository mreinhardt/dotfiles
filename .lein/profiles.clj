{
  :user {
    :dependencies [
      [org.clojure/tools.nrepl "0.2.11"]
      [debugger "0.1.7"]
      [com.cemerick/pomegranate "0.3.0"]
      [cljfmt "0.5.1"]
      [org.clojure/tools.namespace "0.2.11"]
      [pjstadig/humane-test-output "0.8.0"]
    ]
    :injections [
      (require 'pjstadig.humane-test-output)
      (pjstadig.humane-test-output/activate!)
    ]
    :plugins [
      [lein-pprint "1.1.1"]
      [cider/cider-nrepl "0.10.2"]
      [jonase/eastwood "0.2.3"]
      [lein-kibit "0.1.2"]
      [debugger "0.1.7"]
      [lein-cloverage "1.0.6"]
      [lein-cljfmt "0.5.2"]
    ]
    :env {}
  }
}

