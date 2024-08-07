gen:
	dart run build_runner build --delete-conflicting-outputs
deploy-web:
	flutter build web --release --web-renderer html && firebase deploy
