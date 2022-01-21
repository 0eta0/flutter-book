install: bundler_install bundle_install

bundler_install:
	gem install bundler

bundle_install:
	bundle install --path=vendor/bundle --jobs 4 --retry 3

flutter_run:
	flutter run --debug --flavor develop

flutter_build_develop_ios:
	flutter build ipa --release --flavor develop --export-options-plist=./ios/fastlane/ExportOptions/AdHocExportOptions.plist

flutter_build_staging_ios:
	flutter build ipa --release --flavor staging --export-options-plist=./ios/fastlane/ExportOptions/AdHocExportOptions.plist

flutter_build_product_ios:
	flutter build ipa --release --flavor product --export-options-plist=./ios/fastlane/ExportOptions/ReleaseExportOptions.plist

flutter_build_dev_android:
	flutter build appbundle \
		--dart-define APP_NAME=DEV-PokemonFlutter \
		--dart-define APP_BUNDLE_SUFF=.dev \
		--dart-define APP_ENV=dev

flutter_build_prod_android:
	flutter build apk --release \
		--dart-define APP_NAME=PokemonFlutter \
		--dart-define APP_BUNDLE_SUFF= \
		--dart-define APP_ENV=prod

distribute_ios_debug_with_firebase: flutter_build_develop_ios
	cd ios && make distribute_with_firebase

distribute_ios_staging_with_firebase: flutter_build_staging_ios
	cd ios && make distribute_with_firebase

distribute_ios_release_with_testflight: flutter_build_product_ios
	cd ios && make distribute_with_testflight