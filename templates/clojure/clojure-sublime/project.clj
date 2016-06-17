(defproject clojure-sublime/lein-template "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                [me.raynes/fs "1.4.6"]]
  :eval-in-leiningen true
  :repl-options {
    :prompt (fn [ns] (str ns " => "))
    :welcome (println "Welcome to your project's REPL.")})
