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
                      experienceOneImg: "#experience-1"
				  },

				  events: {
                      "click @ui.experienceOneImg": "Experience1Click"
				  },
                    
                  onRender: function() {
                      console.log("Welcome_View was rendered!");
                  },
                    
                  Experience1Click: function(e){
                      console.log("Experience 1 img was clicked!");
                      e.preventDefault();
                      e.stopPropagation();
                      FeatherManager.trigger("experience:display");
                  }
                

				});
			});
			
		return FeatherManager.FeatherApp.Welcome.View;
   });