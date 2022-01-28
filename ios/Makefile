FASTLANE := bundle exec fastlane

# Initialization

setup_fastlane:
	$(FASTLANE) init

setup_fastlane_match:
	$(FASTLANE) match init

# Make certification and provisioning profile for each

make_profiles:
	$(FASTLANE) match development
	$(FASTLANE) match adhoc
	$(FASTLANE) match appstore

# Get certification and provisioning profile for development

get_develop_profiles:
	$(FASTLANE) match development --readonly

# Make iOS Project

make_develop_project:
	flutter clean
	flutter pub get
	flutter build ios --verbose --release --flavor develop --dart-define=FLAVOR=DEV --no-codesign

make_staging_project:
	flutter clean
	flutter pub get
	flutter build ios --verbose --release --flavor staging --dart-define=FLAVOR=PRD --no-codesign

make_product_project:
	flutter clean
	flutter pub get
	flutter build ios --verbose --release --flavor product --dart-define=FLAVOR=PRD --no-codesign

# Make IPA

make_develop_ipa: make_develop_project
	$(FASTLANE) make_develop_ipa

make_staging_ipa: make_staging_project
	$(FASTLANE) make_staging_ipa

# Distribute with AppDistribution

distribute_develop: make_develop_project
	$(FASTLANE) distribute_develop_with_appdistribution

distribute_staging: make_staging_project
	$(FASTLANE) distribute_staging_with_appdistribution

# Distribute with TestFlight

distribute_product: make_product_project
	$(FASTLANE) distribute_with_testflight