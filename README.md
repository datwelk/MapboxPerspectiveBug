# MapboxPerspectiveBug
Demonstration of https://github.com/mapbox/mapbox-gl-native/issues/14362

# How to use
- Replace `MGLMapboxAccessToken` in `Info.plist` with a valid Mapbox Access Token
- Run `carthage update --platform iOS`
- Run the app
- Toggle the perspective button and notice how the map is moving south after repeatedly togging the button.
