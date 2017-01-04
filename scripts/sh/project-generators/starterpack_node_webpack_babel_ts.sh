# ruby "$SNIPPETS_DIR/scripts/sh/project-generators/starterpack_node_webpack_babel_ts__ruby.rb" $0

############################################# HELPERS ##############################################
function init_react_native_in_cur_dir {
    local CUR_DIR_NAME_CAMELIZED=$(curdirname | camelize)
    cd ..
    react-native init $CUR_DIR_NAME_CAMELIZED
    cd $CUR_DIR_NAME_CAMELIZED
}

starterpack_node_webpack_babel_ts__usage() {
    echo "USAGE: starterpack_node_webpack_babel_ts [framework] [db] <OPTIONS>"
    echo "  framework = react, react-native, or electron"
    echo "  db {optional} = postgres, mysql, or couch"
    echo " OPTIONS:"
    echo "  --redis: include redis store"
    echo "  --express: include express store"
}

starterpack_node_webpack_babel_ts__install_main_framework() {
    # INSTALL MAIN FRAMEWORK
    if [[ "$1" = "electron" ]]; then
        yarn add electron                               # electron
    elif [[ "$1" = "react-native" ]]; then
        echo "Installing react-native..."
        init_react_native_in_cur_dir
    elif [[ "$1" = "react" ]]; then
        echo "basic react project type selected. Other options: electron, react-native"
        yarn add react
        yarn add --dev react-addons-test-utils
    else
        starterpack_node_webpack_babel_ts__usage
        RET_FROM_starterpack_node_webpack_babel_ts__install_main_framework='FAIL'
        return 1
    fi
}

has_arg() {
    RET_FROM_HAS_ARG=$(ruby "$SNIPPETS_DIR/scripts/sh/project-generators/starterpack_node_webpack_babel_ts__ruby.rb" $1 $@)
}

################################# ACTUAL PROJECT BUILDER FUNCTION ##################################
function starterpack_node_webpack_babel_ts {
    has_arg '--redis';      ARG_redis=$RET_FROM_HAS_ARG
    has_arg '--express';    ARG_express=$RET_FROM_HAS_ARG

    CURRENT_DIR_PATH=$(pwd)

    if ! [[ -n "$1" ]]; then
        starterpack_node_webpack_babel_ts__usage
        return 1
    fi

    ############################### INSTALLATIONS ###############################
    # INSTALL MAIN FRAMEWORK
    starterpack_node_webpack_babel_ts__install_main_framework $1
    if [[ "$RET_FROM_starterpack_node_webpack_babel_ts__install_main_framework" = "FAIL" ]]; then
        unset RET_FROM_starterpack_node_webpack_babel_ts__install_main_framework
        return 1
    fi

    # basic initializations
    git init

    # not used by react-native
    if ! [[ "$1" = "react-native" ]]; then
        npm init -f

        # INSTALL DB
        if [[ -n "$2" ]]; then
          # POSTGRES
          if [[ "$2" = "postgres" ]]; then
            yarn add pg
          # MYSQL
          elif [[ "$2" = "mysql" ]]; then
            yarn add mysql
          # COUCHDB
          elif [[ "$2" = "couch" ]] || [[ "$2" = "couchdb" ]]; then
            if [[ "$1" = "react-native" ]]; then
                yarn add pouchdb-react-native
            else
                yarn add cradle
            fi
          else
            echo "Unknown database selected, none being installed"
          fi
        fi

        #### essential utils ####
        yarn add lodash moment bluebird                    # essential libraries
        yarn add class-transformer                         # OOP tools

        #### constants ####
        yarn add common-constants

        yarn add detect-node isomorphic-fetch              # isomorphic utilties
        yarn add mad-logs winston morgan                   # logging
        yarn add deep-freeze-strict seamless-immutable     # immutability
        
        #### react ####
        yarn add mobx react-mobx                           # state store
        yarn add react-intl react-toastr                   # react components

        #### env config ####
        yarn add --dev dotenv

        #### build ####
        yarn add --dev babel-core
        yarn add babel-polyfill                            # babel frontend
        yarn add --dev babel-cli
        yarn add --dev rimraf-promise
        yarn add --dev child-process-promise

        #### run ####
        yarn add --dev nodemon
        yarn add --dev death
        yarn add --dev terminate
        yarn add --dev pm2

        ## essential build tools
        yarn add --dev webpack@2.2.0-rc.3                        # webpack itself
        yarn add --dev sass                                # style transpiling 
        yarn add --dev css-loader style-loader sass-loader # webpack style plugins
        yarn add --dev babel-loader                        # webpack js plugins
        yarn add --dev awesome-typescript-loader           # webpack ts plugins
        yarn add --dev raw-loader json-loader              # webpack misc plugins
        yarn add --dev handlebars-webpack-plugin
        yarn add extract-text-webpack-plugin@^2.0.0-beta.4
        yarn add --dev typescript typings                  # typescript
        yarn add --dev source-map-support                  # source maps for ts
        yarn add --dev chokidar commander colors           # cli tool creation
        yarn add --dev handlebars handlebars-helpers       # templating
        yarn add --dev node-notifier                       # produces notifications

        ### TDD ###
        yarn add --dev mocha chai sinon test-console       # testing - core
        yarn add --dev enzyme chai-enzyme                  # testing: react/frontend
        yarn add supertest --dev 
        yarn add --dev istanbul                            # code coverage

        ### LINTING ###
        yarn add --dev tslint
        yarn add --dev tslint-eslint-rules
        yarn add --dev tslint-microsoft-contrib vrsource-tslint-rules
        yarn add --dev eslint
        yarn add --dev babel-eslint
        yarn add --dev eslint-plugin-react

        ### filesystem ###
        yarn add app-root-path filter-argv                 # filesystem navigation
        yarn add --dev node-mkdirp fs-extra                # filesystem editing

        ### babel plugins / addons / tools ###
        yarn add --dev babel-preset-stage-0
        yarn add --dev babel-preset-react
        yarn add --dev babel-preset-es2015
        yarn add --dev babel-plugin-transform-object-rest-spread
        yarn add --dev babel-plugin-react-intl
        yarn add --dev babel-plugin-lodash
        yarn add --dev babel-loader
        yarn add babel-core
        yarn add babel-polyfill

        ##### REDIS #####
        if [[ "$ARG_redis" = "true" ]]; then
            yarn add redis
            if [[ "$ARG_express" = "true" ]]; then
                yarn add connect-redis
            fi
        fi

        ##### EXPRESS BACKEND #####
        if [[ "$ARG_express" = "true" ]]; then
            yarn add express
            yarn add body-parser
            yarn add express-session

            # hashing
            yarn add argon2
            yarn add crypto-js

            # auth
            yarn add jsonwebtoken
            yarn add passport
            yarn add passport-local
            yarn add passport-jwt
        fi

    fi
    ############################ /END INSTALLATIONS #############################

    if ! [[ "$1" = "react-native" ]]; then

        ##### Make required directories #####
        mkdir test
        mkdir script
        mkdir doc
        mkdir app
        mkdir app/server
        mkdir app/client
        mkdir typings
        mkdir typings/custom
        mkdir build

        ##### Copy tsconfigs #####
        cp $SNIPPETS_DIR/scripts/sh/project-generators/source-files/tsconfig--server.json $CURRENT_DIR_PATH/app/server/tsconfig.json
        cp $SNIPPETS_DIR/scripts/sh/project-generators/source-files/tsconfig--client.json $CURRENT_DIR_PATH/app/client/tsconfig.json
        
        ##### Copy custom typings files (starting points) #####  <<< MUST GO BEFORE GET TYPINGS!!!
        cp $SNIPPETS_DIR/scripts/sh/project-generators/source-files/typings--index.d.ts $CURRENT_DIR_PATH/typings/index.d.ts
        cp $SNIPPETS_DIR/scripts/sh/project-generators/source-files/project-typings.d.ts $CURRENT_DIR_PATH/typings/custom/

        ##### Get typings #####
        typings install --global dt~node
        typings install --save lodash
        typings install --global dt~react
        typings install --save express
        typings install --save dt~app-root-path
        typings install --global dt~chai
        typings install --global dt~colors
        typings install --save dt~supertest
        typings install --save dt~morgan
        typings install --save dt~crypto-js
        typings install --save-dev dt~jsonwebtoken
        typings install --global dt~isomorphic-fetch
        typings install --save-dev dt~enzyme
        
        npm install --save-dev @types/mocha

        #### Other basic setup tasks #####
        newnode__babel_base
        newnode__babel_config_base_react
        newnode__default_eslint
        newnode__webpack
        newnode_create_empty_config
    fi

    newnode__sublime_project_base
    newnode__gitignore_base
}