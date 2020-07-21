# Authentication

Most API calls require an authenticated user session.

Bubble uses an HTTP Header to pass the session identifier.

## Login
To start a new session, a client must first login. This is done by sending a `POST` request to the `auth/login` API endpoint. For example:

    POST auth/login
    {
      "name": "some-username",
      "password": "some-password"
    }

If the login is successful (and multifactor authentication is not enabled), the response body will be a JSON object representing the user account.

The session identifier can be read from the `token` property of this object.

If multifactor authentication is enabled, see the section below on how to send additional information to complete the login process.

If no user with the provided name exists, OR if the password is incorrect, the API will return a `404 Not Found` error.

## Authenticated Requests
To make an authenticated request, pass the session identifier in the `X-Bubble-Session` HTTP header.

## Retrieve Current User
To get the Account object for the currently logged-in user, issue a `GET` to the `me` API endpoint. 

## Logout
To end a session, send a `GET` request to `auth/logout`

To end ALL sessions (across all devices/clients), send a `POST` request to `auth/logout/{userid}` where `{userid}` is
the name or uuid of a user account.

Admin users can call this endpoint for any user. Regular users can only call this endpoint for themselves.

## Multifactor Authentication (MFA)
If a user has configured MFA, then the response to `auth/login` will be different, depending on what authentication
mechanisms are enabled.

### Only TOTP Authentication Enabled
If only TOTP authentication is enabled (and email/SMS authentication are not enabled, then the response to `auth/login`
will be HTTP status 422, and the response body will be `[ {"messageTemplate":"err.totpToken.required", ...} ]`

Thus, if the status code is 422 and the body is a JSON array containing a single object with the `messageTemplate` property
equal to `err.totpToken.required`, then TOTP authentication is required.

The end user should use their TOTP app (usually Google Authenticator) to view the current TOTP token.
The end user enters this token into the client application, which then retries the login request with an additional `totpToken` parameter:

    POST auth/login
    {
      "name": "some-username",
      "password": "some-password",
      "totpToken": "123456"
    }

The above request indicates that the user named `some-username` wishes to submit the code `123456` as the TOTP authentication factor.

  * If the code is incorrect, a 422 response will be returned with a validation error containing `"messageTemplate": "err.totpToken.invalid"`
  * If the code is correct and no further authentication factors are required, a new session is started. The response will be a JSON object representing the user account, and the `token` property will contain the new session identifier.
  * If the code is correct but further authentication factors are required, the response will be a JSON object with a `multifactorAuth` property that contains an array of JSON objects representing the remaining authentication factors that still must be satisfied.

### Other Authentication Methods Enabled
If email and/or SMS authentication is enabled (whether or not TOTP authentication is also enabled), then the response
to `auth/login` will be a JSON object with a `multifactorAuth` property,
which contains a JSON array of the additional authentication factors that are required to complete the login process.
For example:

    {
      "name": "some-username",
      "multifactorAuth": [
        {"type": "email": "info": "masked***@***example.com"},
        {"type": "sms": "info": "US:******1234"},
        {"type": "authenticator": "info": "{\"masked\": true}"}
      ]
    }

The above response indicates that to complete a login for the `some-username` user, the API will require additional
auth factors via email, SMS and an authenticator. When this response is received, it also means that:
  * An email message has been sent to the (real) email address represented by the masked value shown. This email message contains a code that can be used to satisfy the email authentication factor. 
  * An SMS message has been sent to the (real) phone number represented by the masked value shown. This SMS message contains a code that can be used to satisfy the SMS authentication factor.
  * A token generated via a TOTP system (for example Google Authenticator) is also required.

### Authentication Factor: Email and SMS 
The end user receives an email message or SMS containing an authentication code. The end user enters this code in the client application, which then calls

    POST auth/approve/123456
    [
        {"name": "account", "value": "some-username"}
    ]

The above request indicates that the user named `some-username` wishes to submit the code `123456` as the response to a requested authentication factor.

  * If the code is incorrect, a 422 response will be returned with a validation error containing `"messageTemplate": "err.approvalToken.invalid"`
  * If the code is correct and no further authentication factors are required, a new session is started. The response will be a JSON object representing the user account, and the `token` property will contain the new session identifier.
  * If the code is correct but further authentication factors are required, the response will be a JSON object with a `multifactorAuth` property that contains an array of JSON objects representing the remaining authentication factors that still must be satisfied.
