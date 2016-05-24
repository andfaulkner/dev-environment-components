*  <uses-sdk android:minSdkVersion="integer"
          android:targetSdkVersion="integer"
          android:maxSdkVersion="integer" />



##Usage Stats, Versions To Support
* as of May 2016:   (source: http://www.statista.com/statistics/271774/share-of-android-platforms-on-mobile-devices-with-android-os/)
	- ~97.7% of devices in the wild are running Ice Cream Sandwich 4.03 or higher (API 14)
	- ~95.7% of devices in the wild are running Jelly Bean 4.1 or higher (API 16)
	- IMHO let's support Jelly Bean 4.1+
	- 


WILLIAMS APP
============

Williams app SDK version
------------------------
* Target SDK: 		       19
	  - VERSION_CODE:  		 KITKAT
	  - Android version:   4.4
* Min SDK    === 14
		- VERSION_CODE:      ICE_CREAM_SANDWICH
		- Android version:   4.0, 4.0.1, 4.0.2

* Changes required to sdk/api:
    - deprecate 14 and 15. They have a combined total of 2% market share, not work the pain
    - 19 is an excellent target SDK, since it accounts for 32.5% of the market - the largest slice.

