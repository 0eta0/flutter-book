FASTLANE := bundle exec fastlane

# Initialization

setup_fastlane:
	$(FASTLANE) init

# Make APK

make_develop_apk:
	flutter clean
	flutter pub get
	flutter build apk --release --flavor develop --dart-define=FLAVOR=DEV

make_staging_apk:
	flutter clean
	flutter pub get
	flutter build apk --release --flavor staging --dart-define=FLAVOR=PRD

# Make AAB for Google Play

make_product_aab:
	flutter clean
	flutter pub get
	flutter build appbundle --flavor product --dart-define=FLAVOR=PRD

# Distribute with AppDistribution

distribute_develop: make_develop_apk
	$(FASTLANE) distribute_develop_with_appdistribution

distribute_staging: make_staging_apk
	$(FASTLANE) distribute_staging_with_appdistribution

# Deploy to Google Play

deploy_to_googleplay: make_product_aab
	$(FASTLANE) deploy_to_googleplay
