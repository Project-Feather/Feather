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
			 "welcome": "displayWelcomeScreen",
             "experience": "displayExperienceScreen",
             "list-an-experience": "displayListAnExperienceScreen"
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
				executeAction(WelcomeController.display);
			});
		},
        displayExperienceScreen: function(){
            console.log("inside displayExperienceScreen!");
			require(["apps/feather/experience/experience_controller"], function(ExperienceController)
			{
				executeAction(ExperienceController.display);
			});
        },
        displayListAnExperienceScreen: function(){
            console.log("inside displayListAnExperienceScreen!");
            require(["apps/feather/list_an_experience/list_an_experience_controller"], function(ListAnExperienceController){
               executeAction(ListAnExperienceController.display); 
            });
        }
        
	};
	
	FeatherManager.on("welcome:display", function(){
        console.log("Inside welcome:display listener");
		FeatherManager.navigate("welcome");
		API.displayWelcomeScreen();
	});
        
	FeatherManager.on("experience:display", function(){
        console.log("Inside experience:display listener");
		FeatherManager.navigate("experience");
		API.displayExperienceScreen();
	});
        
    FeatherManager.on("list_an_experience:display", function(){
        console.log("Inside list an experience:display listener");
        FeatherManager.navigate("list-an-experience");
        API.displayListAnExperienceScreen();
    })
        
    FeatherManager.Routers.on("start", function(){
        console.log("About to instantiate our FeatherAppRouter");
        new FeatherAppRouter.Router({
            controller: API
        });
    });
	

   });
   
   return FeatherManager.Router;
});