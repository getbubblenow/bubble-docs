# Certificate Status Notification
It is important for the native app to tell the Bubble API whether the Bubble CA certificate has been installed or not.

If the Bubble CA certificate has been installed, then VPN apps can be activated that perform SSL interception
to provide an enhanced Internet experience.

If the Bubble CA certificate has NOT been installed, then VPN apps will not be activated, to avoid SSL errors
when using the Internet.

## Start Sessions
Follow the [boot instructions](boot.md) to get the boot.json file and to [authenticate](auth.md) against both the
sage and the bubble node.

## Connect to VPN
Connect to the Bubble VPN, if not already connected. If needed, define the device and download and install
the vpn.conf file, as described in the [devices](devices.md) documentation.

## Request the validation hostname from the Bubble API
This API request will be against the bubble node (not the sage):

    GET auth/configs

This will return a dictionary of system configuration options. Find the property named `certValidationHost`, the
value of this property is the hostname you will use in the next step.

## Request the validation host
While connected to the VPN, issue a standard HTTPS `GET` request to: `https://certValidationHost/`

If the app succeeds in requesting the above URL, then all is good.

If the app receives an error performing the SSL handshake, either:
  * If automatic cert installation is possible for the device, [download and install the Bubble CA certificate](cert.md).
  * If automatic cert installation is not possible for the device, present a message to the user indicating that they still need to install the
Bubble CA certificate to get the most our of their bubble, and offer instructions on how to do so.

### What happens on the server during the validation request
When the app requests `https://certValidationHost/` the server detects if the SSL handshake succeeded.

If a handshake failure occurred, the server marks the device as "cert not installed", so other HTTPS requests will not be SSL-intercepted.

If the handshake was a success, the device is marked as "cert installed", and Bubble VPN apps will be enabled.
 