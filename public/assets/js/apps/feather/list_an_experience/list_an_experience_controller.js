/**************************
* Author: Mark Sun
* Created Date: 05/01/2016
* Modified Date: 
**************************/
define(["app", "apps/feather/list_an_experience/list_an_experience_view"], function(FeatherManager, View){
	FeatherManager.module("FeatherApp.ListAnExperience", function(ListAnExperience, FeatherManager, Backbone, Marionette, $, _){
		ListAnExperience.Controller = {
		  display: function(){
			var list_an_experience_view = new View.Page();
			FeatherManager.regions.main.show(list_an_experience_view);
		  }
		}
	});
	return FeatherManager.FeatherApp.ListAnExperience.Controller;
});
