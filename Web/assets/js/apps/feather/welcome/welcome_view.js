/****************************
* Author: Mark Sun
* Created Date: 02/06/2016
* Co-Author: Sai N Muppa
* Modified Date: 02/06/2016
***************************/
define(["app",
        "tpl!apps/feather/welcome/templates/welcome.tpl"],
		function(FeatherManager, welcomeTpl){
			FeatherManager.module("FeatherApp.Welcome.View", function(View, FeatherManager, Backbone, Marionette, $, _){
				View.Page = Marionette.ItemView.extend({
				  template: welcomeTpl,

				  ui: {
					checkIn: "#welcome-check-in-btn",
					checkOut: "#welcome-check-out-btn"
				  },

				  events: {
					"click @ui.checkIn": "CheckInOnClick",
					"click @ui.checkOut": "CheckOutOnClick"
				  },
                    
                  onRender: function() {
                      console.log("Welcome_View was rendered!");
                  }
                

				});
			});
			
		return FeatherManager.FeatherApp.Welcome.View;
   });