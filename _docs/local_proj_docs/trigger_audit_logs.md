How to trigger audit logs
=========================
trigger audit events e.g. Updated Case
--------------------------------------
-   send a trigger from frontend (the event.trigger(‘some_audit_event’) thing you’ve seen a few times)
cmd:load, cmd:save etc. have their own system level items
-   rules 
    -   in sys_*.audit.js — this is what determines what triggers it
	- all the backend does is make the diff - the rest of the conditions are in sys_*.audit.js