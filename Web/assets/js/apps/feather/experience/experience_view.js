/****************************
* Author: Mark Sun
* Created Date: 03/03/2016
* Modified Date: 03/03/2016
***************************/
define(["app",
        "tpl!apps/feather/experience/templates/experience.tpl"],
		function(FeatherManager, experienceTpl){
			FeatherManager.module("FeatherApp.Experience.View", function(View, FeatherManager, Backbone, Marionette, $, _){
				View.Page = Marionette.ItemView.extend({
				  template: experienceTpl,

				  ui: {
                      experienceOneStarRating: "#experience-1-star-rating"
				  },

				  events: {
				  },
                    
                  onRender: function() {
                    console.log("Experience_View was rendered!");
                    // initialize with defaults
                    $("experience-1-star-rating").rating();

                    // with plugin options (do not attach the CSS class "rating" to your input if using this approach)
                    $("#experience-1-star-rating").rating({'size':'lg'});
                  }
                

				});
			});
			
		return FeatherManager.FeatherApp.Experience.View;
   });