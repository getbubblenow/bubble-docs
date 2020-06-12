# Booting

Using one special hard-coded URL, apps can bootstrap themselves to use the appropriate API endpoints.

## Determining the Sage Base URI
First, request the bootstrap URL: https://raw.githubusercontent.com/getbubblenow/bubble-config/master/boot.json

The contents of this JSON file look something like this:

    {
      "sages": [
        "https://beta.bubblev.com"
      ]
    }

The `sages` property is an array of Bubble Sage nodes. The base URI for a sage can be created by appending `/api` to
the URL.

When authenticating, try each URL listed under `sages` in order. For example, from the above JSON, the app
should try using `https://beta.bubblev.com/api` as the base URI; the login request would be a `POST` to `https://beta.bubblev.com/api/auth/login`

For more information on the authentication process, see the [Authentication](auth.md) documentation.

If a login is successful, cache the sage URL locally and reuse that if a login is required in the future, for example
because the current session is no longer valid.

Only re-fetch the `boot.json` file if the login fails with the cached URL. If there are new URLs listed
in the `boot.json` file, try to login using those. If there are not any new URLs listed in the `boot.json` file,
then the login has failed, and the app should display the appropriate error message to the user.

## Determining the Node Base URI
Once you have established an authenticated session with the sage, you can then determine the API URL to use
for communicating with the bubble. To do this, call:

    GET me/networks

The response will be a JSON array of bubble objects, for example:

    [ {
      "uuid" : "ef1c60d8-47da-4960-9880-54ea176f43aa",
      "related" : null,
      "name" : "zork",
      "account" : "abd051dc-01d6-46d9-9191-e0ed7f5ba81a",
      "domain" : "b918925d-7812-4b69-9a3b-8c3eb6c6147f",
      "domainName" : "bubv.net",
      "sslPort" : 1443,
      "installType" : "node",
      "sshKey" : null,
      "computeSizeType" : "small",
      "footprint" : "9190eef9-fb5b-44b2-bdc3-321ddd8c9d79",
      "storage" : "7c8f4045-91f3-4584-94b3-a95345ecc46e",
      "description" : null,
      "locale" : "en_US",
      "timezone" : "America/New_York",
      "sendMetrics" : true,
      "tags" : null,
      "forkHost" : null,
      "state" : "running",
      "shortId" : "ef1c60d8"
    } ]

Disregard any objects where `state` is not `running`.

If there is exactly one bubble object in the results with `"state": "running"`, then this will be the bubble to use
for node requests.

If there are multiple bubble objects in the results with `"state": "running"`, then present a list to the user and ask
them which bubble they would like to connect to. In the list of bubbles shown to the user, combine the `name` and
`domainName` fields. In the above example, this would result in `zork.bubv.net`.

If there zero bubble objects in the results with with `"state": "running"`, then present a screen that tells the
user they have no bubble currently running. This screen should have a button to "Launch a New Bubble". When this
button is tapped, open a URL by appending `/new_bubble` to the sage URL that was used to login.

For example, based on the `boot.json` shown above, this would be `https://beta.bubblev.com/new_bubble`.

## Determine the Node Base URI
Once a node is selected (automatically if there is only one, or by user selection if more than one), then
determine the node base URI by combining the `name` and `domainName` properties of the node object
as `https://<node>.<domainName>:1443/api`. In the above example, this would be `https://zork.bubv.net:1443/api`

## Start a Node Session
Using the Node Base URI, authenticate against the `/auth/login` API endpoint for the node. Use the same username
and password that was used to authenticate against the sage.

If the login was not successful, present the login screen with the "username" field pre-populated with the username,
and allow the user to enter their password and login. Usually this step will not be required, because by default
we will keep the sage password and the node password in sync. However, it is possible for advanced users to have separate
passwords for their sage login versus their node login.

## Cache session tokens separately
Note that the API session with the sage is distinct and separate from the API session with the node. As such,
each token should be cached separately.
