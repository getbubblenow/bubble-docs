# Error Reporting

Bubble uses [errbit](https://errbit.com/docs/master/) for error reporting.

Errbit is API-compatible with Airbrake.io. Use the appropriate [Airbrake client library](https://airbrake.io/docs/installing-airbrake/)
for your application platform.

## Errbit Configuration
There are three pieces of information needed to send an error report:

  * URL: the API endpoint where the app will send HTTP POST requests with error information
  * API Key: the API key to authenticate the error report
  * Environment: identifies the environment that the error occurred in

### Errbit URL and API Key
To retrieve the URL and API Key, after [authenticating](auth.md) send an HTTP GET to `me/errorApi`.

The `me/errorApi` endpoint should return a JSON object like the one shown below:

    {
      "url": "https://errbit.example.com/notifier_api/v2/notices",
      "key": "6bcec42bb53e752d734e9b846example"
    }

NOTE
 * There is no way to send error reports if a user is not authenticated.
 * If the response to `me/errorApi` does not return status 200 (OK), then error reporting should not be enabled.

### Errbit Environment
For the Environment, use a string in the form:

    appVersion-osType-osVersion-deviceModel

The entire string should be lowercase, with any spaces replaced by underscores.

The `appVersion` is the version of the app, as determined by the app.

The `osType` should be the operating system, usually be `ios`, `android`, `macos`, `windows`, or `linux`.
If the operating system is not one of these, choose something that is indicative of the platform, for example `router`

The `osVersion` should be the version of the OS, as reported by the OS.

The `deviceModel` should indicate the make and model of the device.
For Windows, `deviceModel` should be `x86` for 32-bit Windows, or `x86_64` for 64-bit Windows.

Some example Environment strings:

  `1.0.0-ios-13.4.1-iphone_x`

  `1.0.0-android-8.0.0-samsung_galaxy_s7`

  `1.0.0-windows-1607-x86_64`

  `1.0.0-macos-10.15.5-macbook_air`

## Sending Error Reports
Refer to the documentation for the appropriate [Airbrake client library](https://airbrake.io/docs/installing-airbrake/)
for information on how to configure the client library to use the URL, API Key and Environment and
how to send error reports.
