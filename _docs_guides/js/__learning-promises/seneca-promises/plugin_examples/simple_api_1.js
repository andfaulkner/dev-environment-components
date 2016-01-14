module.exports = function simple_restapi1_SenecaPlugin(options) {

    this.add('role:simple_restapi1,cmd:provideOranges', provideOranges_cb);
    this.add('role:simple_restapi1,cmd:provideApples', provideApples_cb);
    this.add('role:simple_restapi1,cmd:provideBears', provideBears_cb);


    this.act('role:web', {
        use: {
            prefix: '/simple_restapi1',
            pin: 'role:simple_restapi1,cmd:*',
            map: {
                'provideOranges': { GET: true },
                'provideApples': { GET: true, POST: true },
                'provideBears': true //GET by default
            }
        }}
    );


    function provideOranges_cb(msg, callback){
        //operations here
        callback(null, { some_key: 'some_result'});
    }


    function provideApples_cb(msg, callback){
        //operations here
        callback(null, { some_key: 'some_result'});
    }


    function provideBears_cb(msg, callback){
        //operations here
        callback(null, { some_key: 'some_result'});
    }
};