# Bubble Management
Launch and manage Bubbles.

Before launching a Bubble you must first [create an Account Plan](plans.md).

## Launch a Bubble
The simplest way to launch a Bubble is:

    POST me/networks/{plan}/actions/start

Where `{plan}` is the `name` of an Account Plan. Note that you *cannot* use the Account Plan `nickname` here.

To launch the Bubble in a specific location:

    POST me/networks/{plan}/actions/start?cloud={cloud}&region={region}

 * `{cloud}` must be the `name` or `uuid` of a valid compute cloud.
 * `{region}` must be a valid `internalName` for the selected `{cloud}`(see "List Regions" below).

If the Bubble cannot be launched in the specified region, it will be launched in the next closest region.

If you want to launch in a specific region and fail to launch if that region is unavailable (instead of retrying in another region),
then pass the URL parameter `exactRegion=true`, for example:

    POST me/networks/{plan}/actions/start?cloud=Vultr&region=Atlanta&exactRegion=true

## List Regions
To list regions in order from closest to farthest:

    GET me/networks/{plan}/closest

The end user's latitude and longitude will be based on their IP address.

The return value is an array of CloudRegionRelative objects. The `distance` property indicates the estimated distance
(in meters) from the end user to that region.

An example response:

    [
      {
        "uuid": "c02e3625-9db6-47a0-9870-723d87e70d16",
        "cloud": "33ad51f6-f2f0-40e3-8416-17c3a3f4e7a1",
        "name": "Vultr - Atlanta",
        "internalName": "Atlanta",
        "location": {
          "country": "US",
          "region": "GA",
          "city": "Atlanta",
          "lat": "33.755",
          "lon": "-84.39"
        },
        "distance": 335191.9754014563
      },
      {
        "uuid": "b5ae7ad6-eeb8-4c60-bc07-8959bf3d2a43",
        "cloud": "33ad51f6-f2f0-40e3-8416-17c3a3f4e7a1",
        "name": "Vultr - New Jersey",
        "internalName": "New Jersey",
        "location": {
          "country": "US",
          "region": "NJ",
          "city": "Newark",
          "lat": "40.72",
          "lon": "-74.17"
        },
        "distance": 881332.0427683354
      },
      ...
    ]

To list the regions closest to a specific latitude and longitude:

    GET me/networks/{plan}/closest?lat={lat}&lon={lon}

## Restore Keys
In order to restore a Bubble from a backup, the user must have the Restore Key for that Bubble.
Before downloading a Restore Key, the user must first request the Restore Key.

The APIs for starting/stopping a Bubble are always performed against a Sage.
Conversely, the Restore Key APIs are always performed against a running Bubble.

### Request Restore Key
To request the Restore Key for a Bubble:

    GET me/networks/{plan}/keys

If this call succeeds it returns an empty JSON object, and a verification message is sent to the end user.
Usually this verification message will be an email, unless the user has also registered a phone number.

The message will contain a code that can then be used to download the Restore Key.

### Download Restore Key
To download the Restore Key for a Bubble:

     POST me/networks/{plan}/keys/{uuid}
     {
       "name": "password",
       "value": "{encryptionPassword}"
     }

The `{uuid}` field comes from the verification message that the end user received.
The `{encryptionPassword}` is specified by the end user, the Restore Key will be encrypted with this password.

The return value will look like this:

    {
      "data": "base64-encoded-encrypted-data...",
      "password": "encryptionPassword-from-above"
    }

The `data` is the important thing to save. The `password` is returned for confirmation purposes.

## Stop a Bubble

    POST me/networks/{plan}/actions/stop

This will stop the Bubble. Backups will be retained until the [Account Plan](plans.md) is deleted.

## Restore a Bubble

    POST me/networks/{plan}/actions/restore

This will launch a Bubble in restore mode. After it successfully launches, the first time the user tries to login
they will also enter their Restore Key. The Bubble will then download its most recent backup and restore itself.

Just like launching a Bubble for the first time, the `/restore` API endpoint also accepts `cloud`, `region` and `exactRegion` parameters.
