CREATE TABLE `Profile` (
	`ProfileID` bigint NOT NULL AUTO_INCREMENT,
	`FirstName` varchar(64) NOT NULL,
	`LastName` varchar(64) NOT NULL,
	`MiddleName` varchar(64) NOT NULL,
	`Suffix` varchar(64) NOT NULL,
	`Email` varchar(64) NOT NULL,
	`PhoneNumber` varchar(64) NOT NULL,
	`GenderID` smallint NOT NULL,
	`BirthDate` DATE NOT NULL,
	`City` varchar(64) NOT NULL,
	`AboutMe` varchar(64) NOT NULL,
	`UniqueAboutYourExperiences` varchar(64),
	`ProfilePhotoUri` varchar(64),
	`RegisteredDateTime` DATETIME NOT NULL,
	`LastModifiedDateTime` DATETIME NOT NULL,
	`AcceptingExplorerStateID` smallint NOT NULL,
	PRIMARY KEY (`ProfileID`)
);

CREATE TABLE `Experience` (
	`ExperienceID` bigint NOT NULL AUTO_INCREMENT,
	`LocalProfileID` bigint NOT NULL,
	`ReservationTypeID` smallint NOT NULL,
	`MinimumExplorers` smallint NOT NULL,
	`MaximumExplorers` smallint NOT NULL,
	`LengthOfExperience` smallint NOT NULL,
	`ExperienceTitle` varchar(64) NOT NULL,
	`ExperienceDescription` varchar(64) NOT NULL,
	`ExperienceAgenda` varchar(64) NOT NULL,
	`WhatsIncluded` varchar(64) NOT NULL,
	`ExperienceStateID` smallint NOT NULL,
	`RequestPickup` bool NOT NULL DEFAULT false,
	`PricingID` bigint NOT NULL,
	`WeatherDependent` bool NOT NULL DEFAULT false,
	`IsSeasonal` bool NOT NULL DEFAULT false,
	`IsAvailableAllTimes` bool NOT NULL DEFAULT false,
	`ExperinceLocationID` bigint NOT NULL,
	`ExperienceScheduleID` bigint NOT NULL,
	PRIMARY KEY (`ExperienceID`)
);

CREATE TABLE `Message` (
	`MessageID` bigint NOT NULL AUTO_INCREMENT,
	`ExperienceID` bigint,
	`ProfileID` bigint NOT NULL,
	`ReservationID` bigint NOT NULL,
	`IsStarred` bool NOT NULL,
	`IsUnread` bool NOT NULL,
	`IsArchived` bool NOT NULL,
	`ReceivedDateTime` DATETIME NOT NULL,
	PRIMARY KEY (`MessageID`)
);

CREATE TABLE `Reservation` (
	`ReservationID` bigint NOT NULL AUTO_INCREMENT,
	`ExperienceID` bigint NOT NULL,
	`ReservationStateID` smallint NOT NULL,
	`ReceivedDateTime` DATETIME NOT NULL,
	`StartTime` DATETIME NOT NULL,
	`EndTime` DATETIME NOT NULL,
	`PickupLocationID` bigint NOT NULL,
	`ReservedProfileID` bigint NOT NULL,
	`ExplorerProfileID` bigint NOT NULL,
	PRIMARY KEY (`ReservationID`)
);

CREATE TABLE `ReservationState` (
	`ReservationStateID` smallint NOT NULL,
	`ReservationStateAbbr` varchar(64) NOT NULL,
	`ReservationStateDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`ReservationStateID`)
);

CREATE TABLE `ReservationType` (
	`ReservationTypeID` smallint NOT NULL,
	`ReservationModelDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`ReservationTypeID`)
);

CREATE TABLE `Experience_Weather_Mapping` (
	`ExperienceID` bigint NOT NULL,
	`WeatherID` smallint NOT NULL,
	PRIMARY KEY (`ExperienceID`,`WeatherID`)
);

CREATE TABLE `Weather` (
	`WeatherID` smallint NOT NULL,
	`WeatherDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`WeatherID`)
);

CREATE TABLE `Experience_Type_Mapping` (
	`ExperienceID` bigint NOT NULL,
	`ExperienceTypeID` smallint NOT NULL,
	PRIMARY KEY (`ExperienceID`,`ExperienceTypeID`)
);

CREATE TABLE `Experience_PickupLocation_Mapping` (
	`ExperienceID` bigint NOT NULL,
	`PickupLocationID` bigint NOT NULL,
	PRIMARY KEY (`ExperienceID`,`PickupLocationID`)
);

CREATE TABLE `PickupLocation` (
	`PickupLocationID` bigint NOT NULL AUTO_INCREMENT,
	`PickupLocationName` varchar(64),
	`StreetAddress` varchar(64) NOT NULL,
	`BuildingNumber` bigint NOT NULL,
	`City` varchar(64) NOT NULL,
	`Zipcode` int NOT NULL,
	`State` varchar(64) NOT NULL,
	`Country` varchar(64) NOT NULL,
	`Latitude` DECIMAL NOT NULL,
	`Longitude` DECIMAL NOT NULL,
	PRIMARY KEY (`PickupLocationID`)
);

CREATE TABLE `Gender` (
	`GenderID` smallint NOT NULL,
	`GenderAbbreviation` varchar(64) NOT NULL,
	`GenderDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`GenderID`)
);

CREATE TABLE `Profile_LanguageProficiency_Mapping` (
	`ProfileID` bigint NOT NULL,
	`LanguageID` smallint NOT NULL,
	`LanguageProficiencyID` smallint NOT NULL,
	PRIMARY KEY (`ProfileID`,`LanguageID`,`LanguageProficiencyID`)
);

CREATE TABLE `Language` (
	`LanguageID` smallint NOT NULL,
	`LanguageName` varchar(64) NOT NULL,
	PRIMARY KEY (`LanguageID`)
);

CREATE TABLE `LanguageProficiency` (
	`LanguageProficiencyID` smallint NOT NULL,
	`LanguageProficiencyDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`LanguageProficiencyID`)
);

CREATE TABLE `ExperienceType` (
	`ExperienceTypeID` smallint NOT NULL,
	`ExperienceTypeAbbr` varchar(64) NOT NULL,
	`ExperienceTypeDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`ExperienceTypeID`)
);

CREATE TABLE `ExperiencePhotoUri` (
	`ExperienceID` bigint NOT NULL,
	`ExperiencePhotoUri` varchar(64) NOT NULL,
	`ExperiencePhotoOrder` int NOT NULL,
	PRIMARY KEY (`ExperienceID`,`ExperiencePhotoUri`,`ExperiencePhotoOrder`)
);

CREATE TABLE `ExperienceVideoUri` (
	`ExperienceID` bigint NOT NULL,
	`ExperienceVideoUri` varchar(64) NOT NULL,
	`ExperienceVideoOrder` int NOT NULL,
	PRIMARY KEY (`ExperienceID`,`ExperienceVideoUri`,`ExperienceVideoOrder`)
);

CREATE TABLE `ExperienceRating` (
	`ExperienceRatingID` bigint NOT NULL AUTO_INCREMENT,
	`ExperienceID` bigint NOT NULL,
	`ReservationID` bigint NOT NULL,
	`ReceivedDateTime` DATETIME NOT NULL,
	`AccuracyRating` smallint NOT NULL,
	`CommunicationRating` smallint NOT NULL,
	`LocationRating` smallint NOT NULL,
	`ValueRating` smallint NOT NULL,
	`UniquenessRating` smallint NOT NULL,
	`ExperienceReview` varchar(64) NOT NULL,
	PRIMARY KEY (`ExperienceRatingID`)
);

CREATE TABLE `Rating` (
	`RatingID` smallint NOT NULL,
	`RatingDescription` varchar(64) NOT NULL
);

CREATE TABLE `ExperienceAmenity` (
	`ExperienceAmenityID` smallint NOT NULL,
	`ExperienceAmenityTitle` varchar(64) NOT NULL,
	`ExperienceAmenityDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`ExperienceAmenityID`)
);

CREATE TABLE `ExperienceOtherFeature` (
	`ExperienceOtherFeatureID` smallint NOT NULL,
	`ExperienceOtherFeatureTitle` varchar(64) NOT NULL,
	`ExperienceOtherFeatureDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`ExperienceOtherFeatureID`)
);

CREATE TABLE `Experience_ExperienceAmenity_Mapping` (
	`ExperienceID` bigint NOT NULL,
	`ExperienceAmenityID` smallint NOT NULL,
	PRIMARY KEY (`ExperienceID`,`ExperienceAmenityID`)
);

CREATE TABLE `Experience_ExperienceOtherFeature_Mapping` (
	`ExperienceID` bigint NOT NULL,
	`ExperienceOtherFeatureID` smallint NOT NULL,
	PRIMARY KEY (`ExperienceID`,`ExperienceOtherFeatureID`)
);

CREATE TABLE `SubExperienceType` (
	`SubExperienceTypeID` int NOT NULL,
	`SubExperienceTypeAbbr` varchar(64) NOT NULL,
	`SubExperienceTypeDescription` varchar(64) NOT NULL,
	`ExperienceTypeID` smallint NOT NULL,
	PRIMARY KEY (`SubExperienceTypeID`)
);

CREATE TABLE `WishList` (
	`WishListID` bigint NOT NULL AUTO_INCREMENT,
	`ProfileID` bigint NOT NULL,
	`ExperienceID` bigint NOT NULL,
	`DateModified` DATETIME NOT NULL,
	PRIMARY KEY (`WishListID`)
);

CREATE TABLE `ExperienceState` (
	`ExperienceStateID` smallint NOT NULL,
	`ExperienceStateAbbr` varchar(64) NOT NULL,
	`ExperienceStateDescription` varchar(64) NOT NULL,
	`ExperienceID` bigint NOT NULL UNIQUE,
	PRIMARY KEY (`ExperienceStateID`)
);

CREATE TABLE `AcceptingExplorerState` (
	`AcceptingExplorerStateID` smallint NOT NULL,
	`AcceptingExplorerStateAbbr` varchar(64) NOT NULL,
	`AcceptingExplorerStateDescription` varchar(64) NOT NULL,
	`ProfileID` bigint NOT NULL UNIQUE,
	PRIMARY KEY (`AcceptingExplorerStateID`)
);

CREATE TABLE `PricingModel` (
	`PricingModelID` smallint NOT NULL,
	`PricingModelAbbr` varchar(64) NOT NULL,
	`PricingModelDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`PricingModelID`)
);

CREATE TABLE `Currency` (
	`CurrencyID` smallint NOT NULL,
	`CurrencyAbbr` varchar(64) NOT NULL,
	`CurrencyDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`CurrencyID`)
);

CREATE TABLE `Pricing` (
	`PricingID` bigint NOT NULL AUTO_INCREMENT,
	`PricingModelID` smallint NOT NULL,
	`CurrencyID` smallint NOT NULL,
	`Price` int NOT NULL,
	`HasDiscount` bool NOT NULL,
	`MinimiumDiscountGroup` smallint,
	`DiscountPercentage` smallint,
	PRIMARY KEY (`PricingID`)
);

CREATE TABLE `Seasonal` (
	`SeasonalID` bigint NOT NULL AUTO_INCREMENT,
	`ExperienceID` bigint NOT NULL,
	`EpochDayOfTheYearStart` smallint NOT NULL,
	`EpochDayofTheYearEnd` smallint NOT NULL,
	PRIMARY KEY (`SeasonalID`)
);

CREATE TABLE `ExperienceLocation` (
	`ExperienceLocationID` bigint NOT NULL AUTO_INCREMENT,
	`City` varchar(64) NOT NULL,
	`State` varchar(64) NOT NULL,
	`Country` varchar(64) NOT NULL,
	`ZipCode` varchar(64) NOT NULL,
	`ExperienceID` bigint NOT NULL UNIQUE,
	PRIMARY KEY (`ExperienceLocationID`)
);

CREATE TABLE `ExperienceSchedule` (
	`ExperienceScheduleID` bigint NOT NULL AUTO_INCREMENT,
	`AvailabilityTypeID` smallint NOT NULL,
	`StartDate` DATE NOT NULL,
	`EndDate` DATE NOT NULL,
	`BreakTime` int NOT NULL,
	PRIMARY KEY (`ExperienceScheduleID`)
);

CREATE TABLE `AvailabilityType` (
	`AvailablityTypeID` smallint NOT NULL AUTO_INCREMENT,
	`AvailablityTypeDescription` varchar(64) NOT NULL,
	PRIMARY KEY (`AvailablityTypeID`)
);

CREATE TABLE `DayOfTheWeek` (
	`DayOfTheWeekID` smallint NOT NULL,
	`DayOfTheWeekAbbr` varchar(64) NOT NULL,
	`DayOfTheWeekDescription` varchar(64) NOT NULL,
	`IsAllHours` bool NOT NULL,
	`StartTime` smallint NOT NULL,
	PRIMARY KEY (`DayOfTheWeekID`)
);

CREATE TABLE `ExperienceSchedule_DayofTheWeek_Mapping` (
	`ExperienceScheduleID` bigint NOT NULL,
	`DayOfTheWeekID` smallint NOT NULL,
	PRIMARY KEY (`ExperienceScheduleID`,`DayOfTheWeekID`)
);

ALTER TABLE `Experience` ADD CONSTRAINT `Experience_fk0` FOREIGN KEY (`LocalProfileID`) REFERENCES `Profile`(`ProfileID`);

ALTER TABLE `Experience` ADD CONSTRAINT `Experience_fk1` FOREIGN KEY (`ReservationTypeID`) REFERENCES `ReservationType`(`ReservationTypeID`);

ALTER TABLE `Experience` ADD CONSTRAINT `Experience_fk2` FOREIGN KEY (`PricingID`) REFERENCES `Pricing`(`PricingID`);

ALTER TABLE `Experience` ADD CONSTRAINT `Experience_fk3` FOREIGN KEY (`ExperinceLocationID`) REFERENCES `ExperienceLocation`(`ExperienceLocationID`);

ALTER TABLE `Experience` ADD CONSTRAINT `Experience_fk4` FOREIGN KEY (`ExperienceScheduleID`) REFERENCES `ExperienceSchedule`(`ExperienceScheduleID`);

ALTER TABLE `Message` ADD CONSTRAINT `Message_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `Message` ADD CONSTRAINT `Message_fk1` FOREIGN KEY (`ProfileID`) REFERENCES `Profile`(`ProfileID`);

ALTER TABLE `Message` ADD CONSTRAINT `Message_fk2` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation`(`ReservationID`);

ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_fk1` FOREIGN KEY (`ReservationStateID`) REFERENCES `ReservationState`(`ReservationStateID`);

ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_fk2` FOREIGN KEY (`PickupLocationID`) REFERENCES `PickupLocation`(`PickupLocationID`);

ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_fk3` FOREIGN KEY (`ReservedProfileID`) REFERENCES `Profile`(`ProfileID`);

ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_fk4` FOREIGN KEY (`ExplorerProfileID`) REFERENCES `Profile`(`ProfileID`);

ALTER TABLE `Experience_Weather_Mapping` ADD CONSTRAINT `Experience_Weather_Mapping_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `Experience_Weather_Mapping` ADD CONSTRAINT `Experience_Weather_Mapping_fk1` FOREIGN KEY (`WeatherID`) REFERENCES `Weather`(`WeatherID`);

ALTER TABLE `Experience_Type_Mapping` ADD CONSTRAINT `Experience_Type_Mapping_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `Experience_Type_Mapping` ADD CONSTRAINT `Experience_Type_Mapping_fk1` FOREIGN KEY (`ExperienceTypeID`) REFERENCES `ExperienceType`(`ExperienceTypeID`);

ALTER TABLE `Experience_PickupLocation_Mapping` ADD CONSTRAINT `Experience_PickupLocation_Mapping_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `Experience_PickupLocation_Mapping` ADD CONSTRAINT `Experience_PickupLocation_Mapping_fk1` FOREIGN KEY (`PickupLocationID`) REFERENCES `PickupLocation`(`PickupLocationID`);

ALTER TABLE `Profile_LanguageProficiency_Mapping` ADD CONSTRAINT `Profile_LanguageProficiency_Mapping_fk0` FOREIGN KEY (`ProfileID`) REFERENCES `Profile`(`ProfileID`);

ALTER TABLE `Profile_LanguageProficiency_Mapping` ADD CONSTRAINT `Profile_LanguageProficiency_Mapping_fk1` FOREIGN KEY (`LanguageID`) REFERENCES `Language`(`LanguageID`);

ALTER TABLE `Profile_LanguageProficiency_Mapping` ADD CONSTRAINT `Profile_LanguageProficiency_Mapping_fk2` FOREIGN KEY (`LanguageProficiencyID`) REFERENCES `LanguageProficiency`(`LanguageProficiencyID`);

ALTER TABLE `ExperiencePhotoUri` ADD CONSTRAINT `ExperiencePhotoUri_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `ExperienceVideoUri` ADD CONSTRAINT `ExperienceVideoUri_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `ExperienceRating` ADD CONSTRAINT `ExperienceRating_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `ExperienceRating` ADD CONSTRAINT `ExperienceRating_fk1` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation`(`ReservationID`);

ALTER TABLE `Experience_ExperienceAmenity_Mapping` ADD CONSTRAINT `Experience_ExperienceAmenity_Mapping_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `Experience_ExperienceAmenity_Mapping` ADD CONSTRAINT `Experience_ExperienceAmenity_Mapping_fk1` FOREIGN KEY (`ExperienceAmenityID`) REFERENCES `ExperienceAmenity`(`ExperienceAmenityID`);

ALTER TABLE `Experience_ExperienceOtherFeature_Mapping` ADD CONSTRAINT `Experience_ExperienceOtherFeature_Mapping_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `Experience_ExperienceOtherFeature_Mapping` ADD CONSTRAINT `Experience_ExperienceOtherFeature_Mapping_fk1` FOREIGN KEY (`ExperienceOtherFeatureID`) REFERENCES `ExperienceOtherFeature`(`ExperienceOtherFeatureID`);

ALTER TABLE `SubExperienceType` ADD CONSTRAINT `SubExperienceType_fk0` FOREIGN KEY (`ExperienceTypeID`) REFERENCES `ExperienceType`(`ExperienceTypeID`);

ALTER TABLE `WishList` ADD CONSTRAINT `WishList_fk0` FOREIGN KEY (`ProfileID`) REFERENCES `Profile`(`ProfileID`);

ALTER TABLE `WishList` ADD CONSTRAINT `WishList_fk1` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `ExperienceState` ADD CONSTRAINT `ExperienceState_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `AcceptingExplorerState` ADD CONSTRAINT `AcceptingExplorerState_fk0` FOREIGN KEY (`ProfileID`) REFERENCES `Profile`(`ProfileID`);

ALTER TABLE `Pricing` ADD CONSTRAINT `Pricing_fk0` FOREIGN KEY (`PricingModelID`) REFERENCES `PricingModel`(`PricingModelID`);

ALTER TABLE `Pricing` ADD CONSTRAINT `Pricing_fk1` FOREIGN KEY (`CurrencyID`) REFERENCES `Currency`(`CurrencyID`);

ALTER TABLE `Seasonal` ADD CONSTRAINT `Seasonal_fk0` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience`(`ExperienceID`);

ALTER TABLE `ExperienceSchedule` ADD CONSTRAINT `ExperienceSchedule_fk0` FOREIGN KEY (`AvailabilityTypeID`) REFERENCES `AvailabilityType`(`AvailablityTypeID`);

ALTER TABLE `ExperienceSchedule_DayofTheWeek_Mapping` ADD CONSTRAINT `ExperienceSchedule_DayofTheWeek_Mapping_fk0` FOREIGN KEY (`ExperienceScheduleID`) REFERENCES `ExperienceSchedule`(`ExperienceScheduleID`);

ALTER TABLE `ExperienceSchedule_DayofTheWeek_Mapping` ADD CONSTRAINT `ExperienceSchedule_DayofTheWeek_Mapping_fk1` FOREIGN KEY (`DayOfTheWeekID`) REFERENCES `DayOfTheWeek`(`DayOfTheWeekID`);

