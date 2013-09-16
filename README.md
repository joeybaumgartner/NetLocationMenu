NetLocationMenu
===============

This is a sample application to test making changes to OS X's network locations, without having to go through the  Menu, and then Locations. Unfortunately, these API calls are all secured by the operating system, preventing the user from making a selection via an external program running in the menubar.

This proof of concept is limited to just running within a simple window. Any change forces the user to enter their credentials to prove they are not a malicious program attempting to alter the underlying networking configuration.

It might be possible to do make all of these changes by writing a script at the shell level, parsing the output, and allowing the user to select the location item they would like to activate.

If you're an Alfred 2 user, you might just want to use this [workflow](http://jamesoff.net/site/2011/06/09/alfred-script-to-change-network-location-in-os-x/) instead.
