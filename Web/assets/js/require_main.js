/***********************************
* Author: Sai N Muppa
* Date: 11/27/2015
***********************************/

requirejs.config({
  baseUrl: "assets/js",
  paths: {
    backbone: "vendor/backbone",
    "backbone.modal": "vendor/backbone.modal-min",
	"backbone.picky": "vendor/backbone.picky.min",
	localstorage: "vendor/backbone.localStorage-min",
    jquery: "vendor/jquery.min",
	bootstrap: "vendor/bootstrap.min", 
    "jquery-ui": "vendor/jquery-ui.min",
	json3: "vendor/json3.min",
    marionette: "vendor/backbone.marionette",
	"marionette.modal": "vendor/backbone.marionette.modals-min",
    text: "vendor/text",
    tpl: "vendor/underscore-tpl",
    underscore: "vendor/underscore"
  },

  shim: {
    underscore: {
      exports: "_"
    },
    backbone: {
      deps: ["jquery", "underscore", "json3"],
      exports: "Backbone"
    },
	"backbone.picky": ["backbone"],
	"backbone.modal": ["backbone"],
    marionette: {
      deps: ["backbone"],
      exports: "Marionette"
    },
    "jquery-ui": ["jquery"],
    localstorage: ["backbone"],
    tpl: ["text"]
  }
});

require(["app", "apps/feather/feather_app_router"], function(FeatherManager){
  FeatherManager.start();
});
