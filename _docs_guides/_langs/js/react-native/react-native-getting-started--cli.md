Install React Native [2018-11-13]
=================================
Global
------
Install required CLI apps:

    brew install watchman
    npm install -g react-native-cli

*   Don't install `react-native` globally, it will complain

Get Expo

    npm install -g expo-cli

iOS
---
Install XCode
(?)

Android
-------
*   Install Android Studio

*   Open Android Studio for the first time
    -   Required to download the SDK - do the required steps for this

*   Set ANDROID_PATH in a bash initialization file. It's often:
```
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```
    -   Note that `~` doesn't work in the ANDROID_HOME path for some reason

*   Run in project once to complete the setup/config (see below)

*   You may need to install a very specific version from the Android SDK manager in Android Studio


----------------------------------------------------------------------------------------------------
Create a project
================
React Native
------------
    react-native init ProjectName

*   Can't use dashes in project name - AlphaNumeric only 😡

Expo
----
expo init ProjectName

*   Still can't use dashes in project name 😡

----------------------------------------------------------------------------------------------------
Run project
===========
React Native
------------
### Run on Android
    react-native run-android

### Run on iOS
    react-native run-ios

Expo
----
    expo start

*   You can then select