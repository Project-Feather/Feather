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
			 //"applicableOptions": "displayApplicableOptions",
			 "welcome": "displayWelcomeScreen"
			 //"individualFinder": "displayIndividualFinder",
			 //"groupFinder": "displayGroupFinder",
			 //"signUp": "displaySignUp",
			 //"checkInSuccessful": "displayCheckInSuccessful"
			}
	});
	 
	var executeAction = function(action, arg){
	  FeatherManager.startSubApp("FeatherApp");
	  action(arg);
	};

	var API = {
        /*
		displayApplicableOptions: function(){
			require(["apps/volunteer/applicable_options/applicable_options_controller"], function(ApplicableOptionsController)
			{
				executeAction(ApplicableOptionsController.display);
			});
		},
        */
		displayWelcomeScreen: function(){
			require(["apps/feather/welcome/welcome_controller"], function(WelcomeController)
			{
				executeAction(WelcomeController.display);
			});
		}
        /*,
		displayIndividualFinder: function(){
			require(["apps/volunteer/individual_finder/individual_finder_controller"], function(IndividualFinderController)
			{
				executeAction(IndividualFinderController.display);
			});
		},
		displayGroupFinder: function(){
			require(["apps/volunteer/group_finder/group_finder_controller"], function(GroupFinderController)
			{
				executeAction(GroupFinderController.display);
			});
		},
		displaySignUp: function(){
			require(["apps/volunteer/sign_up/sign_up_controller"], function(SignUpController)
			{
				executeAction(SignUpController.display);
			});
		},
		displayCheckInSuccessful: function(){
			require(["apps/volunteer/check_in_successful/check_in_successful_controller"], function(CheckInSuccessfulController)
			{
				executeAction(CheckInSuccessfulController.display);
			});
		}
        */
	};
	
    /*
	FeatherManager.on("applicableoptions:display", function(){
		FeatherManager.navigate("applicableOptions");
		API.displayApplicableOptions();
	});
    */
	
	FeatherManager.on("welcome:display", function(){
		FeatherManager.navigate("welcome");
		API.displayWelcomeScreen();
	});
	
    /*
	FeatherManager.on("individualfinder:display", function(){
		FeatherManager.navigate("individualFinder");
		API.displayIndividualFinder();
	});
	
	FeatherManager.on("groupfinder:display", function(){
		FeatherManager.navigate("groupFinder");
		API.displayGroupFinder();
	});
	
	FeatherManager.on("signup:display", function(){
		FeatherManager.navigate("welcome");
		API.displaySignUp();
	});
	
	FeatherManager.on("checkinsuccess:display", function(){
		FeatherManager.navigate("checkInSuccessful");
		API.displayCheckInSuccessful();
	});

	FeatherManager.Routers.on("start", function(){
		new FeatherAppRouter.Router({
			controller: API
		});
	});
    */

   });
   
   return FeatherManager.Router;
});