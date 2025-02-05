# flutter_deeplinking_with_single_task

## app_links

Android App Links, Deep Links, iOS Universal Links and Custom URL schemes handler (desktop included linux, macOS, Windows).

This plugin allows you to:

catch HTTPS URLs to open your app instead of the browser (App Link / Universal Link).
catch custom schemes to open your app (Deep Link / Custom URL scheme).

## Android configuration
In AndroidManifest.xml

```xml
<!-- <meta-data android:name="flutter_deeplinking_enabled" android:value="true" /> -->

<!-- App Link sample -->
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" android:host="www.example.com" android:pathPrefix="/foo" />
</intent-filter>

<!-- Deep Link sample -->
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <!-- Add optional android:host to distinguish your app
          from others in case of conflicting scheme name -->
    <data android:scheme="sample" android:host="open.my.app" />
    <!-- <data android:scheme="sample" /> -->
</intent-filter>

```

## Testing in android by terminal

```
adb shell am start -a android.intent.action.VIEW \
  -d "sample://open.my.app/#/book/hello-world"
```

## iOS configuration

Add the associated domains entitlement to your app

To set up the entitlement in your app, open the target’s Signing & Capabilities tab in Xcode and add the Associated Domains capability. If they’re not already present, this step adds the Associated Domains Entitlement to your app and the associated domains feature to your app ID.

To add your domain to the entitlement, click Add (+) at the bottom of the Domains table to add a placeholder domain. Replace the placeholder with the appropriate prefix for the service your app supports and your site’s domain. Make sure to only include the desired subdomain and the top-level domain. Don’t include path and query components or a trailing slash (/).

<img width="718" alt="supporting-associated-domains-1~dark@2x" src="https://github.com/sumit-android-dev/flutter-deeplinking-with-single-task/assets/84369514/3b44fa07-0ebe-4199-b2f9-ea073800af22">

Add the domains that share credentials with your app. For services other than appclips, you can prefix a domain with *. to match all of its subdomains.

## Setup in swift file 

```swift
import app_links

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Retrieve the link from parameters
    if let url = AppLinks.shared.getLink(launchOptions: launchOptions) {
      // We have a link, propagate it to your Flutter app or not
      AppLinks.shared.handleLink(url: url)
      return true // Returning true will stop the propagation to other packages
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

## Testing in iOS by terminal

```
/usr/bin/xcrun simctl openurl booted "app://www.example.com/#/book/hello-world"
```


Demo

<img src="https://github.com/sumit-android-dev/flutter-deeplinking-with-single-task/assets/84369514/4724bf4a-83f9-4a1f-9fcb-d3114b43231a" height="700" width="300" alt="ezgif com-video-to-gif-converter" />



References:

- [App linking from flutter](https://pub.dev/packages/app_links)
