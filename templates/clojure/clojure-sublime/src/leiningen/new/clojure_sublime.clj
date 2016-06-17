(ns leiningen.new.clojure-sublime
  (:require [leiningen.new.templates :refer [renderer name-to-path ->files]]
            [leiningen.core.main :as main]))

(def render (renderer "clojure-sublime"))

(defn clojure-sublime
  "Generate a simple lein project with a sublime project already built"
  [name]
  (let [data {:name name
              :sanitized (name-to-path name)}]
    (main/info "Generating fresh 'lein new' clojure-sublime project.")
    (->files data
        ["src/{{sanitized}}/core.clj"
          (render "core.clj" data)]
        ["src/{{sanitized}}/project_files/sublime-project.clj"
          (render "sublime-project.clj" data)]
        ["src/{{sanitized}}/project_files/project.sublime-project"
          (render "project.sublime-project" data)])))
