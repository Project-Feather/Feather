/****************************
* Author: Mark Sun
* Created Date: 05/01/2016
***************************/
define(["app",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_sidebar.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_profile.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_basics.tpl",
        "tpl!apps/feather/list_an_experience/templates/list_an_experience_description.tpl",
        "jquery-ui",
        "bootstrap"],
		function(FeatherManager, listAnExperienceTpl, listAnExperienceSidebarTpl, listAnExperienceProfileTpl, listAnExperienceBasicsTpl, listAnExperiencesDescriptionTpl ){
			FeatherManager.module("FeatherApp.ListAnExperience.View", function(View, FeatherManager, Backbone, Marionette, $, _){
				View.Page = Marionette.LayoutView.extend({
				  template: listAnExperienceTpl,

                  ui: {
                      yourProfile: "#list-an-experience-sidebar-profile-link",
                      theBasics: "#list-an-experience-sidebar-the-basics-link",
                      description: "#list-an-experience-sidebar-description-link",
                      photosVideos: "#list-an-experience-sidebar-photos-and-videos-link",
                      services: "#list-an-experience-sidebar-services-link",
                      seasonal: "#list-an-experience-sidebar-seasonal-link",
                      schedule: "#list-an-experience-sidebar-schedule-link",
                      reservationType: "#list-an-experience-sidebar-reservation-type-link",
                      pricing: "#list-an-experience-sidebar-pricing-link"
				  },
                
                  events: {
                      "click @ui.yourProfile": "YourProfileOnClick",
                      "click @ui.theBasics": "TheBasicsOnClick",
                      "click @ui.description": "DescriptionOnClick"
				  },
                    
				  regions: {
                      sidebarRegion: "#sidebar-region",
                      mainRegion: "#content-region"
                  },
                    
                  onRender: function() {
                      this.sidebarRegion.show(new View.StatusSidebar());
                      this.mainRegion.show(new View.ProfilePage());
                  },
                    
                  YourProfileOnClick: function() {
                      this.mainRegion.show(new View.ProfilePage());          
                  },
                    
                  TheBasicsOnClick: function() {
                      this.mainRegion.show(new View.BasicsPage()); 
                  },
                    
                  DescriptionOnClick: function(){
                      this.mainRegion.show(new View.DescriptionPage());
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
                
                View.DescriptionPage = Marionette.ItemView.extend({
                    template: listAnExperiencesDescriptionTpl
                })
                
                View.StatusSidebar = Marionette.ItemView.extend({
                    template: listAnExperienceSidebarTpl
                })
			});
			
		return FeatherManager.FeatherApp.ListAnExperience.View;
   });