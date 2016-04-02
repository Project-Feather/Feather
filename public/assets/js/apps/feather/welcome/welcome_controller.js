/**************************
* Author: Mark Sun
* Created Date: 02/06/2016
* Co-Author: Sai N Muppa
* Modified Date: 02/06/2016
**************************/
define(["app", "apps/feather/welcome/welcome_view"], function(FeatherManager, View){
	FeatherManager.module("FeatherApp.Welcome", function(Welcome, FeatherManager, Backbone, Marionette, $, _){
		Welcome.Controller = {
		  display: function(){
			var welcome_screen_view = new View.Page();
			FeatherManager.regions.main.show(welcome_screen_view);
		  }
		}
	});
	return FeatherManager.FeatherApp.Welcome.Controller;
});
