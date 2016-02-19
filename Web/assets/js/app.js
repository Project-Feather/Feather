/***********************************
* Author: Mark Sun
* Created Date: 02/14/2016
* Co-Author: Sai N Muppa
* Modified Date:
***********************************/
define(["marionette", "jquery-ui"], function(Marionette){
	var FeatherManager = new Marionette.Application();

	FeatherManager.on("before:start", function(){
	  var RegionContainer = Marionette.LayoutView.extend({
		el: "#app-container",

		regions: {
		  main: "#main-region"
		}
	  });

	  FeatherManager.regions = new RegionContainer();
	})

	FeatherManager.navigate = function(route,  options){
	  options || (options = {});
	  Backbone.history.navigate(route, options);
	};

	FeatherManager.getCurrentRoute = function(){
	  return Backbone.history.fragment
	};
	
	FeatherManager.startSubApp = function(appName, args){
		var currentApp = appName ? FeatherManager.module(appName) : null;
		if (FeatherManager.currentApp === currentApp){ return; }

		if (FeatherManager.currentApp){
		  FeatherManager.currentApp.stop();
		}

		FeatherManager.currentApp = currentApp;
		if(currentApp){
		  currentApp.start(args);
		}
	};

	FeatherManager.on("start", function(){

	  if(Backbone.history){
		  require(["apps/feather/feather_app"], function () {
			Backbone.history.start();

			if(FeatherManager.getCurrentRoute() === ""){
				FeatherManager.trigger("welcome:display");
			} 
              
		  });
		}
	});

	return FeatherManager;
});



