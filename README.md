# APEX-Auto-Refresh-Plugin

![](https://img.shields.io/badge/Type-Dynamic_Action-orange.svg) ![](https://img.shields.io/badge/APEX-20.1-success.svg) 

my first plugin for oracle apex - and i'm very proud that works as well:  
a simple dynamic action auto refresh plugin for classic and interactive report regions.  

![Screenshot](https://github.com/xCite1986/APEX-Auto-Refresh-Region-Plugin/raw/master/2020-05-14_23h13_01.gif)

## HowTo use the Plugin  

1. assign a static ID to the region wich should be updated after a certain time
2. add a dynamic action event after page load
3. as true-action choose the plugin and reference to the region via the static id and set the refresh interval
4. thats it! multiple dynamic actions can also be used for other regions

click here for a example  
http://webapplications.cloud/apex/f?p=251

contribution & special thanks goes to:  

[@Ronny Weiss](https://github.com/RonnyWeiss) - for telling us on APEX connect 2020 to put everything in a plugin what we use often... ;)  
[@Stefan Dobre](https://github.com/stefandobre) - for his plugins which I use as learning stuff