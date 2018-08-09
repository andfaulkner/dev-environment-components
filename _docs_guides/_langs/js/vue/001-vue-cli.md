Packages to install
===================
    npm install --global vue
    npm install --global @vue/cli
    npm install --global vue-template-compiler
    npm install --global vue-cli-service

Serving (for prototyping)
=========================
## Default directory serving
In a directory with an App.vue file, do the following:

    vue serve

The App.vue file must contain a `<template>` section, e.g.:

    <template>
        <h1>Hello!</h1>
    </template>

## Serving a file
    vue serve NameOfFile.vue


Building
========
To build target file into a production build for deployment:

    vue build App.vue

Also lets you build component as a library or web component. [More info](https://cli.vuejs.org/guide/build-targets.html)


Create new project
==================
Run this from the projects parent folder:

    vue create [name-of-new-project-here]

*   Don't create a new directory first, this will create the full directory structure

Once that completes (it will ask you some questions), run:

    cd [name-of-new-project-here]
    yarn
    git init

## Build & serve newly created project
`npm run build`: Build for production
`npm run serve`: Build on change, immediately show changes in browser
