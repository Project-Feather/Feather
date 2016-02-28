/********************************************
* Author: Mark Sun
* Created Date: 02/06/2016
* Co-Author: Sai N Muppa
* Modified Date 02/06/2016
*********************************************/
define(["app"], function(FeatherManager){
	FeatherManager.module("Routers.FeatherApp", function(FeatherAppRouter, FeatherManager, Backbone, Marionette, $, _) {
		FeatherAppRouter.Router = Marionette.AppRouter.extend({
			appRoutes: {
			 "welcome": "displayWelcomeScreen"
			}
	});
	 
	var executeAction = function(action, arg){
	  FeatherManager.startSubApp("FeatherApp");
      console.log("In executeAction just before calling action");
	  action(arg);
	};

	var API = {
		displayWelcomeScreen: function(){
            console.log("inside displayWelcomeScreen!");
			require(["apps/feather/welcome/welcome_controller"], function(WelcomeController)
			{
                console.log("inside displayWelcomeScreen:just before executeAction");
				executeAction(WelcomeController.display);
			});
		}
	};
	
	FeatherManager.on("welcome:display", function(){
        console.log("Inside welcome:display listener");
		FeatherManager.navigate("welcome");
		API.displayWelcomeScreen();
	});

   });
   
   return FeatherManager.Router;
});