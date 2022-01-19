install: bundler_install bundle_install

bundler_install:
	gem install bundler

bundle_install:
	bundle install --path=vendor/bundle --jobs 4 --retry 3

flutter_build_ios:
	flutter build ios \
		--dart-define APP_NAME=[DEV] Pokemon \
		--dart-define APP_SUFFIX=.develop \
		--dart-define APP_ENV=dev