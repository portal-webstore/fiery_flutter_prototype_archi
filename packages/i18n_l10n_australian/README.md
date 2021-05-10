# i18n_l10n_australian

To set up our locali***z***ations for our app, plug in delegates and locales as part of MaterialApp initialisation, similar to below

```dart
MaterialApp(
  // Documentation does not explicitly indicate whether order matters here.
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    // Add the newly created delegate
    AustralianAppLocalisationDelegate(), 
    // <-- we should probably follow the .dot access getter convention /shrug
    // Internally does not appear to have a difference in behaviour.
  ],

  // The order of the list matters per 
  // https://api.flutter.dev/flutter/material/MaterialApp/supportedLocales.html
  // The default locale resolution algorithm, basicLocaleListResolution,
  // attempts to match by the following priority:
  //   Locale.languageCode, Locale.scriptCode, and Locale.countryCode
  //   Locale.languageCode and Locale.scriptCode only
  //   Locale.languageCode and Locale.countryCode only
  //   Locale.languageCode only
  //   Locale.countryCode only when all preferred locales fail to match
  //   Returns the first element of supportedLocales as a fallback
  supportedLocales: [
    const Locale('en', 'AU'), // English (Australia)
    const Locale('en', 'US'),
  ],
)
```
