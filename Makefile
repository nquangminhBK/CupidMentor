gen:
	dart run build_runner build --delete-conflicting-outputs
update-lang:
	flutter --no-color pub global run intl_utils:generate
deploy-web:
	flutter build web --release && firebase deploy
