/****************************
* Author: Mark Sun
* Created Date: 05/01/2016
***************************/
define(["app",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_sidebar.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_profile.tpl"],
		function(FeatherManager, listAnExperienceTpl, listAnExperienceSidebarTpl, listAnExperienceProfileTpl ){
			FeatherManager.module("FeatherApp.ListAnExperience.View", function(View, FeatherManager, Backbone, Marionette, $, _){
				View.Page = Marionette.LayoutView.extend({
				  template: listAnExperienceTpl,

				  regions: {
                      sidebarRegion: "#sidebar-region",
                      mainRegion: "#content-region"
                  },
                    
                  onRender: function() {
                      console.log("List an experience view was rendered!");
                      this.sidebarRegion.show(new View.StatusSidebar());
                      this.mainRegion.show(new View.ProfilePage());
                  }
				});
                
                View.ProfilePage = Marionette.ItemView.extend({
                    template: listAnExperienceProfileTpl
                })
                
                View.StatusSidebar = Marionette.ItemView.extend({
                    template: listAnExperienceSidebarTpl
                })
			});
			
		return FeatherManager.FeatherApp.ListAnExperience.View;
   });