//Drop this into server.js:

var origAct = seneca.act;
origAct.bind(seneca);

seneca.act = function act(args, cb) {
	var actPat = '';
	if (_.isString(args)) {
		actPat = args;
		logger.fn('act::   ' + actPat);
	} else {
		if (args.init)			actPat = actPat + 'init:' + args.init + ','
		if (args.role)			actPat = actPat + 'role:' + args.role + ','
		if (args.base)			actPat = actPat + 'base:' + args.base + ','
		if (args.name)			actPat = actPat + 'name:' + args.name + ','
		if (args.trigger)		actPat = actPat + 'trigger:' + args.trigger + ','
		if (args.cmd)				actPat = actPat + 'cmd:' + args.cmd + ','
		if (args.end)				actPat = actPat + 'end:' + args.end + ','
		if (args.hook)			actPat = actPat + 'hook:' + args.hook + ','
		if (args.id)				actPat = actPat + 'id:' + args.id + ','
		if (args.inactive)	actPat = actPat + 'inactive:' + args.inactive + ','
		if (args.login$)		actPat = actPat + 'login$:' + args.login$ + ','
		actPat = _.trimRight(actPat, ',');
		logger.fn('act::   ' + actPat);
		// logger.fn(inspect(args, { color: true, depth: 1 }));
	}
	origAct.call(this, args, cb);
}


/// REFINE IT, MAKE IT ACTIVATEABLE VIA AN ENVIRONMENT VARIABLE, AND PR IT