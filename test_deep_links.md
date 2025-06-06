# Deep Link Testing Guide

This guide explains how to test the deep linking functionality in the Joplate app.

## Setup Complete

✅ **Android Configuration**: Added intent filters for both custom scheme (`joplates://`) and domain links (`https://joplates.com`)
✅ **iOS Configuration**: Added URL schemes and associated domains in Info.plist
✅ **Flutter Integration**: Added `app_links` package for platform integration
✅ **AutoRoute Configuration**: Set up proper route paths with parameters for automatic URL matching

## Supported Deep Link Formats

### Custom Scheme Links (joplates://)
- `joplates://` → Home page
- `joplates://plates` → Plates listings
- `joplates://plates/123` → Specific plate details
- `joplates://phones` → Phone listings  
- `joplates://phones/123` → Specific phone details
- `joplates://requests` → Requests page
- `joplates://profile` → User profile
- `joplates://profile/user123` → Specific user profile
- `joplates://plans` → Plans page
- `joplates://my-numbers` → My numbers page
- `joplates://my-requests` → My requests page
- `joplates://notifications` → Notifications page
- `joplates://favorites` → Favorites page
- `joplates://feed` → Feed page

### Domain Links (https://joplates.com)
- `https://joplates.com/` → Home page
- `https://joplates.com/plates` → Plates listings
- `https://joplates.com/plates/123` → Specific plate details
- `https://joplates.com/phones` → Phone listings
- `https://joplates.com/phones/123` → Specific phone details
- `https://joplates.com/requests` → Requests page
- `https://joplates.com/user/123` → Specific user profile
- `https://joplates.com/profile` → User profile
- `https://joplates.com/plans` → Plans page
- `https://joplates.com/my-numbers` → My numbers page
- `https://joplates.com/my-requests` → My requests page
- `https://joplates.com/notifications` → Notifications page
- `https://joplates.com/favorites` → Favorites page
- `https://joplates.com/feed` → Feed page
- `https://joplates.com/privacy-policy` → Privacy policy page
- `https://joplates.com/terms-and-conditions` → Terms and conditions page

## Testing on Android

### Using ADB (Android Debug Bridge)

1. **Connect your Android device** or start an emulator
2. **Open terminal** and run the following commands:

```bash
# Test custom scheme links
adb shell am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "joplates://plates"

adb shell am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "joplates://phones/123"

adb shell am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "joplates://profile/user123"

# Test domain links
adb shell am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "https://joplates.com/plates"

adb shell am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "https://joplates.com/phones/123"

adb shell am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "https://joplates.com/user/123"
```

### Using Android Studio

1. **Open Android Studio**
2. **Go to Tools → Device Manager**
3. **Select your device/emulator**
4. **Click on the three dots** and select "Cold Boot Now" if needed
5. **Use the Extended Controls** to simulate deep links

## Testing on iOS

### Using iOS Simulator

1. **Open iOS Simulator**
2. **Open Safari** in the simulator
3. **Type the deep link** in the address bar:
   - `joplates://plates`
   - `https://joplates.com/phones/123`
4. **Tap Go** - this should open your app

### Using Xcode

1. **Open Xcode**
2. **Go to Device and Simulators** (Window → Devices and Simulators)
3. **Select your simulator**
4. **Use the "Open URL" feature** to test deep links

### Using Terminal (for iOS Simulator)

```bash
# Test custom scheme links
xcrun simctl openurl booted "joplates://plates"
xcrun simctl openurl booted "joplates://phones/123"
xcrun simctl openurl booted "joplates://profile/user123"

# Test domain links  
xcrun simctl openurl booted "https://joplates.com/plates"
xcrun simctl openurl booted "https://joplates.com/phones/123"
xcrun simctl openurl booted "https://joplates.com/user/123"
```

## Testing on Physical Devices

### Android
1. **Send yourself a message** (SMS, email, chat app) with the deep link
2. **Tap the link** in the message
3. **Choose your app** when prompted

### iOS
1. **Send yourself a message** (iMessage, email, Notes app) with the deep link
2. **Tap the link** in the message
3. **Your app should open automatically**

## Debugging Deep Links

### Check Logs
The app logs deep link events with the tag `DeepLink`. You can filter logs to see:
- When deep links are received
- How URLs are parsed
- Navigation attempts

### Android Logs
```bash
adb logcat | grep "DeepLink"
```

### iOS Logs
Use Xcode's console or device logs to see deep link processing.

## Domain Verification (Production)

For production apps, you'll need to:

### Android App Links
1. **Upload `assetlinks.json`** to `https://joplates.com/.well-known/assetlinks.json`
2. **Verify the file** is accessible and contains correct app signatures
3. **Test with Google's verification tool**

### iOS Universal Links  
1. **Upload `apple-app-site-association`** to `https://joplates.com/.well-known/apple-app-site-association`
2. **Verify the file** is accessible and contains correct app identifiers
3. **Test with Apple's verification tools**

## Troubleshooting

### Common Issues
1. **Links not opening app**: Check intent filters and URL schemes
2. **App opens but doesn't navigate**: Check route parsing logic
3. **iOS links not working**: Verify associated domains in entitlements
4. **Android links not working**: Check intent filter configuration

### Verification Steps
1. **Check app installation**: Ensure app is installed on device
2. **Check URL format**: Ensure URLs match expected patterns
3. **Check device logs**: Look for deep link processing messages
4. **Test different scenarios**: Cold start, warm start, app in background

## Next Steps

1. **Implement proper navigation**: Currently deep links are parsed but navigation is not fully implemented
2. **Add parameter extraction**: Extract IDs and other parameters from URLs
3. **Add error handling**: Handle malformed or invalid deep links
4. **Add analytics**: Track deep link usage and success rates 