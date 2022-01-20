FASTLANE := bundle exec fastlane

setup_fastlane:
	$(FASTLANE) init

setup_fastlane_match:
	$(FASTLANE) match init

make_profiles:
	$(FASTLANE) match development
	$(FASTLANE) match adhoc
	$(FASTLANE) match appstore

get_develop_profiles:
	$(FASTLANE) match development --readonly

get_adhoc_profiles:
	$(FASTLANE) match adhoc --readonly

get_appstore_profiles:
	$(FASTLANE) match appstore --readonly

setup_appdistribution:
	$(FASTLANE) run firebase_app_distribution_login

distribute_with_firebase:
	$(FASTLANE) distribute_with_firebase

distribute_with_testflight:
	$(FASTLANE) distribute_with_testflight

