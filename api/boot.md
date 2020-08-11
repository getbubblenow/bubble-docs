# Booting

Using one special hard-coded URL, apps can bootstrap themselves to use the appropriate API endpoints.

## Determining the Sage Base URI
First, request the bootstrap URL: https://raw.githubusercontent.com/getbubblenow/bubble-config/master/boot.json

The contents of this JSON file look something like this:

    {
      "sages": [
        "https://example.bubv.net",
        "https://example.bubblev.com"
      ]
    }

The `sages` property is an array of Bubble Sage nodes. The base URI for a sage can be created by appending `/api` to
the URL.

When authenticating, try each URL listed under `sages` in order. For example, from the above JSON, the app
should try using `https://example.bubv.net/api` as the base URI; the login request would be a `POST` to `https://example.bubv.net/api/auth/login`.
If this login attempt fails, next try `https://example.bubblev.com/api` as the base URI; the second login request would be a `POST` to `https://example.bubblev.com/api/auth/login`

For more information on the authentication process, see the [Authentication](auth.md) documentation.

If a login is successful, cache the sage URL locally and reuse that if a login is required in the future, for example
because the current session is no longer valid.

The login screen should also include a "Sign Up" button for new users. This link should use the first sage URL
in the `boot.json` file to create a link to `/register`. For example, using the `boot.json` above, this
would be `https://example.bubv.net/register` 

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
      "nickname" : "my first bubble",
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

### Exactly one Bubble
If there is exactly one bubble object in the results with a `state` of `running`, `starting`, or `restoring`
then this will be the selected bubble.

### More than one Bubble
If there are multiple bubble objects in the results with `state` of `running`, `starting`, or `restoring` 
then present a list to the user and ask them which bubble they would like to select.

In the list of bubbles shown to the user, show a list the `nickname` field and the appropriate [localized message](message_localization.md) corresponding to the `state` field,
which is `msg_network_state_<<state>>`, for example the en_US locale defines `msg_network_state_running` as `running`

### No Bubbles
If there are zero bubble objects in the results with `state` of `running`, `starting`, or `restoring`
then present a screen that tells the user they have no bubble currently running.

#### Launch Bubble via Web
Implement this design first, because the alternative (described below) is more complex.

This screen should have a button to "Launch a New Bubble". This button opens a URL by appending `/new_bubble` to the sage URL that was used to login,
and using the "appLogin" scheme to automatically log the user in.

For example, based on the `boot.json` shown above, this would be `https://example.bubblev.com/appLogin?session=some-session-id&uri=/new_bubble`

#### Launch Bubble from App
It's more convenient for the user to be able to launch a Bubble directly from the app.

##### Payment Handling
First determine if the user has any payment methods defined. Call `GET me/paymentMethods`. This returns an array of AccountPaymentMethod objects.

Walk this array, skipping any objects with `"type": "promotion"`. For example, you might find an object with `"type": "credit"`.

If there are no objects found (or all objects have `"type": "promotion"`), then the user will need to enter payment information.

On mobile platforms (iOS and Android):
 * This screen should have a button to "Enter Payment Information". This button opens a URL by appending `/me/payment` to the sage URL that was used to login,
   and using the "appLogin" scheme to automatically log the user in.
 * When the user returns to the app, re-check `GET me/paymentMethods` to see if a valid account payment method has been added.

On desktop platforms
 * Use the Stripe client libraries to present a credit card entry screen and tokenize a credit card.
 * See the [Account Plans](plans.md) documentation for instructions on how to load the Stripe public key, which is required to use the Stripe client libraries.
 * After tokenizing the card, add the account payment method:
```
    PUT me/paymentMethods
    {
        "paymentMethodType": "credit",
        "paymentInfo": "{stripeToken}"
    }
```

When a valid account payment method exists, present a "Launch Bubble Now" button. When the user clicks or taps this button,
the app will create an Account Plan and launch a Bubble using that plan. 

##### Create Account Plan
Create a default Account Plan:

    PUT me/plans
    {}

This will return an Account Plan object. Save at least the `name` property, it will be needed in the next step.

##### Launch Bubble
Launch the Bubble:

    POST me/networks/{plan}/actions/start

At this point the Bubble is launching. You should call `GET me/networks` and verify that the `state` is now `starting`.
If the `state` is `created` then retry a few times, it should change to `starting` soon.

## Determine the Node Base URI
Once a node is selected (automatically if there is only one, or by user selection if more than one), then
determine the node base URI by combining the `name` and `domainName` properties of the node object
as `https://<node>.<domainName>:1443/api`. In the above example, this would be `https://zork.bubv.net:1443/api`

## When `state` is `running`: Start a Node Session
If the `state` of the selected bubble is `running`, then start a new API session with the bubble node.

Using the Node Base URI, authenticate against the `/auth/login` API endpoint for the node. Use the same username
and password that was used to authenticate against the sage.

If the login was not successful, present the login screen with the "username" field pre-populated with the username,
and allow the user to enter their password and login. Usually this step will not be required, because by default
we will keep the sage password and the node password in sync. However, it is possible for advanced users to have separate
passwords for their sage login versus their node login.

### Login failures
If the login results in a network error (does not return any HTTP response), retry the request every 5 seconds
until you have attempted the login request 5 times. If login is still unsuccessful, show an error message to the user
indicating that the bubble is unreachable, and that they can ask for help from our [support](support.md) group.

### Cache session tokens separately
Note that the API session with the sage is distinct and separate from the API session with the node. As such,
each token should be cached separately.

## When `state` is `starting` or `restoring`: Show Progress Meter
If the `state` of the selected bubble is `starting` or `restoring`, then the bubble is not ready yet, so you can't
(yet) start an API session with the bubble itself.

However, using the sage API, you can determine how far along the startup or restore process is, and display
a progress meter to the end user.

Every 5 seconds, poll `GET /users/${userId}/networks/${networkId}/actions/status` using the sage API, where:

  * `userId` is the user's login
  * `networkId` is the `uuid` field of the selected bubble

This API call returns an array of objects, each representing the launch status of a node within the bubble.
Today, every bubble has exactly one and only one node, so this array will always have only one object.

An example JSON response to the above API request:

    [ {
        "account": "abd051dc-01d6-46d9-9191-e0ed7f5ba81a",
        "network": "ef1c60d8-47da-4960-9880-54ea176f43aa",
        "percent": 63,
        "messageKey": "meter_tick_role_nginx"
    } ]

The above response is an array of progress meters. It should always have exactly one object.
If for some reason more than one object is in the array, always use the first object.
 
Given the above response, show a progress meter that is 63% full, and display the [localized message](message_localization.md) corresponding to the `messageKey`.

### Verify `state` is `running`, Continue with Login
When the `percent` reaches 100, request the `/me/networks` API endpoint and verify that the `state` is now `running`.

If the `state` is `running`, continue with login as described above in "Start a Node Session"

If the `state` is not `running`, show an error message to the user indicating that the bubble had problems starting,
and that they can ask for help from our [support](support.md) group.
