install: bundler_install bundle_install

bundler_install:
	gem install bundler

bundle_install:
	bundle install --path=vendor/bundle --jobs 4 --retry 3

flutter_build_dev_ios:
	flutter build ipa --export-options-plist=./ios/fastlane/ExportOptions/AdHocExportOptions.plist \
		--dart-define APP_NAME=DEV-PokemonFlutter \
		--dart-define APP_BUNDLE_SUFF=.dev \
		--dart-define APP_PROVISIONING_PROFILE_SPECIFIER="match AdHoc dev.eita.ios.pokemon-flutter-demo.dev" \
		--dart-define APP_ENV=dev

flutter_build_prod_ios:
	flutter build ipa --export-options-plist=./ios/fastlane/ExportOptions/ReleaseExportOptions.plist \
		--dart-define APP_NAME=PokemonFlutter \
		--dart-define APP_BUNDLE_SUFF="" \
		--dart-define APP_PROVISIONING_PROFILE_SPECIFIER="match AppStore dev.eita.ios.pokemon-flutter-demo" \
		--dart-define APP_ENV=prod

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

distribute_ios_enterprise_with_firebase: flutter_build_dev_ios
	cd ios && make distribute_with_firebase

distribute_ios_release_with_testflight: flutter_build_prod_ios
	cd ios && make distribute_with_testflight