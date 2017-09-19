Gradle lifecycle
================
3 phases:
    1. Initialization
        Determines which projects are going to take part in the build.
            (since Gradle supports single and multi-project builds)
        Creates a Project instance for each of these projects.

    2. Configuration
        Project objects are configured.
        Build scripts of *all* projects which are part of the build are executed.
        opt-in "configuration on demand" feature, where Gradle configures only relevant projects
            (View “Configuration on demand” docs on Gradle site for more info).

    3. Execution
        Determines subset of tasks (created & configured during the configuration phase) to execute.
            Subset determined by task name args passed to the gradle command, & by the current dir.
        Executes each of the selected tasks.

Can receive notifications as build progresses through the lifecycle, and respond to them
    *   e.g. by running code, logging events, etc.
    *   See https://docs.gradle.org/current/userguide/build_lifecycle.html#build_lifecycle_events


Settings file
=============
*   settings.gradle file in the root dir gets executed in the initialization phase
*   optional for a single-project build

Name the root project
---------------------
Example (place at the top of settings.gradle):
    rootProject.name = 'main'

List projects to include in settings
------------------------------------
Can set up either a hierarchical or a flat project layout

### Hierarchical project layout:
This type of layout gets projects from dirs inside the root directory
Example code to use in settings.gradle:

    include 'project1', 'project2:child', 'project3:child1'

    *   ...maps to dirs [PROJ_ROOT]/project1, [ROOT]/project2/child, & [ROOT]/project3/child1
*   Includes 5 projects: project1, project2, project2:child, project3, project3:child1
    *   All parent directories in the tree of specified projects always get included
    *   Lower level dirs are considered child projects
        *   e.g. child1 is a child project of project3 in the example

### Flat project layout
This type of layout gets projects from dirs that are siblings of the root directory.
Example code in settings.gradle:

    includeFlat 'project3', 'project4'

    *   ...relative to the project root, maps to dirs ../project3, ../project3


Version
=======
To specify the project version, use version command in build.gradle.
Examples (use only 1 in the build.gradle file):

    version '1.0-SNAPSHOT'
    version '1.0'
    version '0.0.1'

buildscript
===========
Configure gradle script's classpath
*   i.e. configure the dependencies of the gradle script itself
*   Dependencies are acquired from the configured online repository (often mavenCentral())
    *   Configure this in the repositories child config (see below for example)
*   Script dependencies go in the dependencies child config, before repositories
    *   Gradle plugins are configured here (they are build script dependencies)
*   Define vars available throughout the gradle build inside buildscript, via the ext prefix.
        *   e.g. ext.var_name = "Value of var_name"
        *   Availability extends to the rest of the buildscript object
    *   Can use anywhere in the buildscript config including inside strings (embed in strings w "$")
        *   e.g. "org.example.com:some-plugin:$some_plugin_version"
*   Note that you *CANNOT* reference anything outside buildscript from within buildscript
    *   buildscript executes before anything else in the script (regardless of its location in file)

Example:

    buildscript {
        // Any value defined w/ ext.some_val is available throughout the buildscript config object
        ext.kotlin_version = '1.1.4-3'
        ext.plugin_suffix = 'gradle-plugin'
        repositories {
            mavenCentral()
        }
        dependencies {
            classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        }
    }


Dependency types
================
[Full list of dependency types & extensive docs on each](https://docs.gradle.org/current/userguide/dependency_management.html#sec:how_to_declare_your_dependencies)

External module dependency: dependency on an external module in some repository. Most common type.
                            dependencies. They refer to a module in an external repository.

Project dependency: dependency on another project in the same build.

File dependency: dependency on a set of files on the local filesystem.

Client module dependency: dependency on an external module, where the artifacts are located in some
                          repo but the module meta-data is specified by the local build. You use
                          this kind of dependency when you want to override the metadata for the module.

Gradle API dependency:  dependency on the API of the current Gradle version. You use this kind of
                        dependency when developing custom Gradle plugins & task types.
Local Groovy dependency: dependency on Groovy version used by the current Gradle version. You use
                         this kind of dependency when developing custom Gradle plugins & task types.
