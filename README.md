berkshelf-formatters-notifier
=============================

Berkshelf formatter which uses OSX notification-center to display messages

![](https://raw.github.com/wiki/usecide/berkshelf-formatters-notifier/berkshelf-formatter-notifications.png)

Installation
------------

This formatter depends on terminal-notifier gem:  
`gem install terminal-notifier`

Copy formatter file to your Berkshelf gem directory:  
`git clone git@github.com:usecide/berkshelf-formatters-notifier.git`  
`cd berkshelf-formatters-notifier`  
Assuming you are using bundler:    
``cp <PATH_TO_CLONED_REPO>/nc.rb `bundle show berkshelf`/lib/berkshelf/formatters/ ``

Usage
-----
As usual in cookbook directory with Berksfile  
`berks upload -F nc`