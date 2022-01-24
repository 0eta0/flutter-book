install: bundler_install bundle_install

bundler_install:
	gem install bundler

bundle_install:
	bundle install --path=vendor/bundle --jobs 4 --retry 3

# Debug
flutter_run:
	flutter run --debug --flavor develop

# iOS
flutter_build_develop_ios:
	flutter build ipa --release --flavor develop --dart-define=FLAVOR=DEV --export-options-plist=./ios/fastlane/ExportOptions/AdHocExportOptions.plist

flutter_build_staging_ios:
	flutter build ipa --release --flavor staging --dart-define=FLAVOR=PRD --export-options-plist=./ios/fastlane/ExportOptions/AdHocExportOptions.plist

flutter_build_product_ios:
	flutter build ipa --release --flavor product --dart-define=FLAVOR=PRD --export-options-plist=./ios/fastlane/ExportOptions/ReleaseExportOptions.plist

distribute_ios_debug_with_firebase: flutter_build_develop_ios
	cd ios && make distribute_develop_with_firebase

distribute_ios_staging_with_firebase: flutter_build_staging_ios
	cd ios && make distribute_staging_with_firebase

distribute_ios_release_with_testflight: flutter_build_product_ios
	cd ios && make distribute_with_testflight

# Android
flutter_build_develop_android:
	flutter build apk --release --flavor develop --dart-define=FLAVOR=DEV

flutter_build_staging_android:
	flutter build apk --release --flavor staging --dart-define=FLAVOR=PRD

flutter_build_product_android:
	flutter build appbundle --flavor product --dart-define=FLAVOR=PRD

distribute_android_debug_with_firebase: flutter_build_develop_android
	cd android && make distribute_develop_with_firebase

distribute_android_staging_with_firebase: flutter_build_staging_android
	cd android && make distribute_staging_with_firebase

distribute_android_release_with_testflight: flutter_build_product_android
	cd android && make deploy_to_googleplay
