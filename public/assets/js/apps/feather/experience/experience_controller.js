/**************************
* Author: Mark Sun
* Created Date: 03/03/2016
* Modified Date: 03/03/2016
**************************/
define(["app", "apps/feather/experience/experience_view"], function(FeatherManager, View){
	FeatherManager.module("FeatherApp.Experience", function(Experience, FeatherManager, Backbone, Marionette, $, _){
		Experience.Controller = {
		  display: function(){
			var experience_screen_view = new View.Page();
			FeatherManager.regions.main.show(experience_screen_view);
		  }
		}
	});
	return FeatherManager.FeatherApp.Experience.Controller;
});