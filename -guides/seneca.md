---------------------------------------------------------------------------
SENECA
======
---------------------------------------------------------------------------

DATA ENTITIES
=============




PERUSING SENECA CODE -- NOTES
=============================
seneca.delegate
---------------
*   wtf is this?
*   code trail:

		function api_delegate(fixedargs)
			--makes--> delegate, as a Object.create instance of 'make_seneca'
				--has--> act 			 --via--> function api_act()
				--has--> delegate.did --> function refnid() --> function actnid() 		===nm===> 	nid
