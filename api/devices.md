# Device Management

All device management API calls require an authenticated user. Before calling the device APIs, [start an authenticated session](auth.md).

## List Devices

    GET me/devices

List devices for the current user. Returns a JSON array of device objects.

## Add a Device
To create a new device:

    PUT me/devices
    {
      "name": "some device name",
      "deviceType": "{device-type}"
    }

Where `{device-type}` is one of: `windows`, `macosx`, `ios`, `android`, `linux` or `other`.
If the API call is successful, the response will be a JSON object representing the device that was just added. It will have a unique `uuid` property that you can use to identify it.

## Update a Device
To update an existing device:

    POST me/device/{deviceId}
    {
      "name": "some different name",
      "deviceType": "{device-type}"
    }

Where `{deviceId}` is the name or uuid of an existing device.
If the API call is successful, the response will be a JSON object representing the device that was just updated.

## Delete a Device
To remove an existing device:

    DELETE me/devices/{deviceId}

If the API call is successful, the response will be a JSON object representing the device that was just deleted.

## Download the VPN configuration for a device
To retrieve the VPN configuration for a device:

    GET me/devices/{deviceId}/vpn/vpn.conf

The response will have a `Content-Type` HTTP header with the value `application/octet-stream` and the body
will contain the `vpn.conf` file that WireGuard can use to create a new tunnel.

Sometimes it is easier to retrieve the VPN configuration as a Base64-encoded string. For this, you can use the endpoint:

    GET me/devices/{deviceId}/vpn/vpn.conf.base64

The response will have a `Content-Type` HTTP header with the value `text/plain` and the body
will contain the `vpn.conf` file as a Base64-encoded string.


