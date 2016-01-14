mkdir ~/project_bk
# if it succeeded...(OK if dir already there)
mkdir ~/project_bk/seneca_bk
# if it succeeded... (OK if dir already there)
# if seneca_bk_2 present in project_bk
rm -rf ~/project_bk/seneca_bk_2
# if seneca_bk already present in project_bk
mv node_modules/seneca_bk ~/project_bk/seneca_bk_2
# if it succeeded...
cp -rf node_modules/seneca ~/project_bk/seneca_bk
# if it succeeded...
# check that current location has a package.json
# if it succeeded...
npm install seneca@0.7.1
# if it succeeded... (OK if dir already there)
# if server.js_bk_2 present in project_bk
rm -rf ~/project_bk/server.js_bk_2
# if server.js_bk already present in project_bk
mv -rf ./server.js_bk ~/project_bk/server.js_bk_2
# if it succeeded...
mv ./server.js ./server.no_tree.js
# if it succeeded...
cp ./server.tree.js ./server.js



### TEARDOWN ###
npm install git://github.com/nherment/seneca.git#0.6.1_custom
### WIP