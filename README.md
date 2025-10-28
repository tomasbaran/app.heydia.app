## Deploying for web
#### DEV firebase hosting:
```
flutter build web --target lib/main_dev.dart --dart-define flavor=dev && firebase use heydia-dev && firebase deploy -m '' && say -v Zarvox "Dev environment deployed"
```

#### LIVE firebase hosting:
```
flutter build web --target lib/main_live.dart --dart-define flavor=live && firebase use heydia-live && firebase deploy -m '' && say -v Zarvox "Live environment deployed"
```
