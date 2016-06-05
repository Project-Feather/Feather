ALTER TABLE `Experience` DROP FOREIGN KEY `Experience_fk0`;

ALTER TABLE `Experience` DROP FOREIGN KEY `Experience_fk1`;

ALTER TABLE `Experience` DROP FOREIGN KEY `Experience_fk2`;

ALTER TABLE `Experience` DROP FOREIGN KEY `Experience_fk3`;

ALTER TABLE `Experience` DROP FOREIGN KEY `Experience_fk4`;

ALTER TABLE `Message` DROP FOREIGN KEY `Message_fk0`;

ALTER TABLE `Message` DROP FOREIGN KEY `Message_fk1`;

ALTER TABLE `Message` DROP FOREIGN KEY `Message_fk2`;

ALTER TABLE `Reservation` DROP FOREIGN KEY `Reservation_fk0`;

ALTER TABLE `Reservation` DROP FOREIGN KEY `Reservation_fk1`;

ALTER TABLE `Reservation` DROP FOREIGN KEY `Reservation_fk2`;

ALTER TABLE `Reservation` DROP FOREIGN KEY `Reservation_fk3`;

ALTER TABLE `Reservation` DROP FOREIGN KEY `Reservation_fk4`;

ALTER TABLE `Experience_Weather_Mapping` DROP FOREIGN KEY `Experience_Weather_Mapping_fk0`;

ALTER TABLE `Experience_Weather_Mapping` DROP FOREIGN KEY `Experience_Weather_Mapping_fk1`;

ALTER TABLE `Experience_Type_Mapping` DROP FOREIGN KEY `Experience_Type_Mapping_fk0`;

ALTER TABLE `Experience_Type_Mapping` DROP FOREIGN KEY `Experience_Type_Mapping_fk1`;

ALTER TABLE `Experience_PickupLocation_Mapping` DROP FOREIGN KEY `Experience_PickupLocation_Mapping_fk0`;

ALTER TABLE `Experience_PickupLocation_Mapping` DROP FOREIGN KEY `Experience_PickupLocation_Mapping_fk1`;

ALTER TABLE `Profile_LanguageProficiency_Mapping` DROP FOREIGN KEY `Profile_LanguageProficiency_Mapping_fk0`;

ALTER TABLE `Profile_LanguageProficiency_Mapping` DROP FOREIGN KEY `Profile_LanguageProficiency_Mapping_fk1`;

ALTER TABLE `Profile_LanguageProficiency_Mapping` DROP FOREIGN KEY `Profile_LanguageProficiency_Mapping_fk2`;

ALTER TABLE `ExperiencePhotoUri` DROP FOREIGN KEY `ExperiencePhotoUri_fk0`;

ALTER TABLE `ExperienceVideoUri` DROP FOREIGN KEY `ExperienceVideoUri_fk0`;

ALTER TABLE `ExperienceRating` DROP FOREIGN KEY `ExperienceRating_fk0`;

ALTER TABLE `ExperienceRating` DROP FOREIGN KEY `ExperienceRating_fk1`;

ALTER TABLE `Experience_ExperienceAmenity_Mapping` DROP FOREIGN KEY `Experience_ExperienceAmenity_Mapping_fk0`;

ALTER TABLE `Experience_ExperienceAmenity_Mapping` DROP FOREIGN KEY `Experience_ExperienceAmenity_Mapping_fk1`;

ALTER TABLE `Experience_ExperienceOtherFeature_Mapping` DROP FOREIGN KEY `Experience_ExperienceOtherFeature_Mapping_fk0`;

ALTER TABLE `Experience_ExperienceOtherFeature_Mapping` DROP FOREIGN KEY `Experience_ExperienceOtherFeature_Mapping_fk1`;

ALTER TABLE `SubExperienceType` DROP FOREIGN KEY `SubExperienceType_fk0`;

ALTER TABLE `WishList` DROP FOREIGN KEY `WishList_fk0`;

ALTER TABLE `WishList` DROP FOREIGN KEY `WishList_fk1`;

ALTER TABLE `ExperienceState` DROP FOREIGN KEY `ExperienceState_fk0`;

ALTER TABLE `AcceptingExplorerState` DROP FOREIGN KEY `AcceptingExplorerState_fk0`;

ALTER TABLE `Pricing` DROP FOREIGN KEY `Pricing_fk0`;

ALTER TABLE `Pricing` DROP FOREIGN KEY `Pricing_fk1`;

ALTER TABLE `Seasonal` DROP FOREIGN KEY `Seasonal_fk0`;

ALTER TABLE `ExperienceSchedule` DROP FOREIGN KEY `ExperienceSchedule_fk0`;

ALTER TABLE `ExperienceSchedule_DayofTheWeek_Mapping` DROP FOREIGN KEY `ExperienceSchedule_DayofTheWeek_Mapping_fk0`;

ALTER TABLE `ExperienceSchedule_DayofTheWeek_Mapping` DROP FOREIGN KEY `ExperienceSchedule_DayofTheWeek_Mapping_fk1`;

DROP TABLE IF EXISTS `Profile`;

DROP TABLE IF EXISTS `Experience`;

DROP TABLE IF EXISTS `Message`;

DROP TABLE IF EXISTS `Reservation`;

DROP TABLE IF EXISTS `ReservationState`;

DROP TABLE IF EXISTS `ReservationType`;

DROP TABLE IF EXISTS `Experience_Weather_Mapping`;

DROP TABLE IF EXISTS `Weather`;

DROP TABLE IF EXISTS `Experience_Type_Mapping`;

DROP TABLE IF EXISTS `Experience_PickupLocation_Mapping`;

DROP TABLE IF EXISTS `PickupLocation`;

DROP TABLE IF EXISTS `Gender`;

DROP TABLE IF EXISTS `Profile_LanguageProficiency_Mapping`;

DROP TABLE IF EXISTS `Language`;

DROP TABLE IF EXISTS `LanguageProficiency`;

DROP TABLE IF EXISTS `ExperienceType`;

DROP TABLE IF EXISTS `ExperiencePhotoUri`;

DROP TABLE IF EXISTS `ExperienceVideoUri`;

DROP TABLE IF EXISTS `ExperienceRating`;

DROP TABLE IF EXISTS `Rating`;

DROP TABLE IF EXISTS `ExperienceAmenity`;

DROP TABLE IF EXISTS `ExperienceOtherFeature`;

DROP TABLE IF EXISTS `Experience_ExperienceAmenity_Mapping`;

DROP TABLE IF EXISTS `Experience_ExperienceOtherFeature_Mapping`;

DROP TABLE IF EXISTS `SubExperienceType`;

DROP TABLE IF EXISTS `WishList`;

DROP TABLE IF EXISTS `ExperienceState`;

DROP TABLE IF EXISTS `AcceptingExplorerState`;

DROP TABLE IF EXISTS `PricingModel`;

DROP TABLE IF EXISTS `Currency`;

DROP TABLE IF EXISTS `Pricing`;

DROP TABLE IF EXISTS `Seasonal`;

DROP TABLE IF EXISTS `ExperienceLocation`;

DROP TABLE IF EXISTS `ExperienceSchedule`;

DROP TABLE IF EXISTS `AvailabilityType`;

DROP TABLE IF EXISTS `DayOfTheWeek`;

DROP TABLE IF EXISTS `ExperienceSchedule_DayofTheWeek_Mapping`;

