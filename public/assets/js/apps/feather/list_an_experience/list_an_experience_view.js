/****************************
* Author: Mark Sun
* Created Date: 05/01/2016
***************************/
define(["app",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_sidebar.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_profile.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_basics.tpl",
        "jquery-ui",
        "bootstrap"],
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
                    template: listAnExperienceBasicsTpl,
                   
                    ui: {
                        accomodationSlider: "#ex2"
                    },
                    
                    onAttach: function(){
                        
                        // Activate our jQuery ui slider
                        $( "#slider-range" ).slider({
                          range: true,
                          min: 1,
                          max: 50,
                          values: [ 1, 50 ],
                          slide: function( event, ui ) {
                            $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
                          }
                        });
                        $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
                          " - $" + $( "#slider-range" ).slider( "values", 1 ) );

                        
                            var availableTags = [
                              "Raleigh, NC",
                              "Seattle, WA",
                              "Durham, NC",
                              "Cary, NC",
                              "San Francisco, CA",
                              "Lost Angeles, CA",
                              "Chicago, IL",
                              "Detroit, MI",
                              "East Lansing, MI",
                              "New York, NY",
                              "Boston, MA",
                              "Boulder, CO"
                            ];
                            $( "#tags" ).autocomplete({
                              source: availableTags
                            });
                    }
                    
                    
                    //$("#ex2").slider({});
                })
                
                View.StatusSidebar = Marionette.ItemView.extend({
                    template: listAnExperienceSidebarTpl
                })
			});
			
		return FeatherManager.FeatherApp.ListAnExperience.View;
   });