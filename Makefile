install: bundler_install bundle_install

# Initialization

bundler_install:
	gem install bundler

bundle_install:
	bundle config set --local path 'vendor/bundle'
	bundle install --jobs 4 --retry 3

# Debug

flutter_run:
	flutter run --debug --dart-define=FLAVOR=DEV
