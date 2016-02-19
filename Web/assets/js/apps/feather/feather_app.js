/********************************
* Author: Mark Sun
* Created Date: 02/06/2016
* Co-Author: Sai N Muppa
* Modified Date 02/06/2016
********************************/
define(["app"], function(FeatherManager){
  FeatherManager.module("FeatherApp", function(FeatherApp, FeatherManager, Backbone, Marionette, $, _){
    FeatherApp.startWithParent = false;

    FeatherApp.onStart = function(){
      console.log("starting FeatherApp");
    };

    FeatherApp.onStop = function(){
      console.log("stopping FeatherApp");
    };
  });

  return FeatherManager.FeatherApp;
});