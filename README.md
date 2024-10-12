# Bible Trainer

Scripture memorization mobile application.

Find out more at [www.bibletrainer.co.uk](https://www.bibletrainer.co.uk).

## Download the app

- [iOS](https://itunes.apple.com/us/app/bibletrainer/id1447626377)
- [Android](https://play.google.com/store/apps/details?id=io.bibletrainer.scripture)

## Contributing and feature requests

There are an increasing number of requests, bug fixes and feature ideas. We're aiming to put something (small) our each month on a cycle of month one: feature, month two improvement. Please see the [project board](https://github.com/johnraftery/BibleTrainer/projects/1) for more information.

## Development

Bible Trainer is built on top of the [Ionic Framework](https://ionicframework.com).

To get started…

At the moment, this project requires NodeJS v6, NPM v3 and Python 2.7

### VERY IMPORANT PLEASE READ ###

In order to deploy to iOS, currently you must be on NodeJS version 14, LTS is fine. 

1. Check out this repo
2. Install Ionic globally: `npm install -g ionic`
3. Install NPM packages: `npm install`
4. Run the ionic server: `npm run start`

In order to deploy to iOS, currently you must be on NodeJS version 14, LTS is fine. 

1  vim ./plugins/cordova-sqlite-storage/scripts/beforePluginInstall.js replace with var Q = require('q')
2. vim ./platforms/ios/cordova/lib/list-emulator-build-targets, fix issue with defaultTarget as shown by build //TODO: BEFORE AND AFTER NEEDED
3. vim platforms/ios/cordova/lib/build.js, fix issue with defaultValue as shown by build //TODO: BEFORE AND AFTER NEEDED
4. ionic cordova emulate ios --target="DB94866E-0E5C-44C9-A804-B8F87E5793B3" --verbose


Environment vars are stored in `src/environments`. For deployment you will need to create a file `environment.prod.ts` with relevant keys in it.

## Test builds

### Android

Make sure that you have [Android Studio](https://developer.android.com/studio/index.html) installed and set up.

Then on the CLI run: `ionic cordova run android --prod`

[More details](https://ionicframework.com/docs/intro/deploying/)

### iOS

1. You'll need [Xcode](https://developer.apple.com/xcode/) installed
2. Generate the Xcode files: `ionic cordova build ios --prod`
3. Open the .xcodeproj file in platforms/ios/ in Xcode
4. Connect your phone via USB and select it as the run target
5. Click the play button in Xcode to try to run your app

Get errors? Read the [Ionic documentation](https://ionicframework.com/docs/intro/deploying).

# Nim's notes that may be quite useful:

```bash
nvm use lts/fermium
git switch build24
npm i
npm run dev

vim ./plugins/cordova-sqlite-storage/scripts/beforePluginInstall.js
# Update line: 13, from `var Q = context.requireCordovaModule('q'); to `var Q = require('q');

vim ./platforms/ios/cordova/lib/list-emulator-build-targets
# Update line: 54, from `device.availability.toLowerCase().indexOf('unavailable') < 0) {` to `device.availability && device.availability.toLowerCase().indexOf('unavailable') < 0) {`

vim platforms/ios/cordova/lib/build.js
# Update line: 130, from `emulatorTarget = defaultTarget.name;' to 'emulatorTarget = 'iPhone 14';`
ionic cordova emulate ios --target="DB94866E-0E5C-44C9-A804-B8F87E5793B3" --verbose
```
