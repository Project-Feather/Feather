/****************************
* Author: Mark Sun
* Created Date: 05/01/2016
***************************/
define(["app",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_sidebar.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_profile.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_basics.tpl",        "bootstrap"],
		function(FeatherManager, listAnExperienceTpl, listAnExperienceSidebarTpl, listAnExperienceProfileTpl, listAnExperienceBasicsTpl ){
			FeatherManager.module("FeatherApp.ListAnExperience.View", function(View, FeatherManager, Backbone, Marionette, $, _){
				View.Page = Marionette.LayoutView.extend({
				  template: listAnExperienceTpl,

                  ui: {
                      theBasics: "#list-an-experience-sidebar-the-basics-link"
				  },
                
                  events: {
                      "click @ui.theBasics": "TheBasicsClick"
				  },
                    
				  regions: {
                      sidebarRegion: "#sidebar-region",
                      mainRegion: "#content-region"
                  },
                    
                  onRender: function() {
                      this.sidebarRegion.show(new View.StatusSidebar());
                      this.mainRegion.show(new View.ProfilePage());
                  },
                    
                  TheBasicsClick: function() {
                      this.mainRegion.show(new View.BasicsPage()); 
                  }
				});
                
                View.ProfilePage = Marionette.ItemView.extend({
                    template: listAnExperienceProfileTpl
                })
                
                View.BasicsPage = Marionette.ItemView.extend({
                    template: listAnExperienceBasicsTpl
                })
                
                View.StatusSidebar = Marionette.ItemView.extend({
                    template: listAnExperienceSidebarTpl
                })
			});
			
		return FeatherManager.FeatherApp.ListAnExperience.View;
   });