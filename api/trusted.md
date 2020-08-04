# Trusted Devices
Trusted devices can login without MFA.

## Trust a device
To trust for a device, a user must have already logged in and (if MFA is enabled) successfully completed any required MFA steps.

    PUT auth/trust
    {
      "name": "some-account@example.com",
      "password": "some-password",
      "device": "{device-name-or-uuid}
    }

The above API call will return a JSON object like this:

    {
      "id": "a-trusted-token"
    }

The client should save the value of the `id` property as the trust token for future trusted-login requests.

The client should save this id within a context that includes the user name (email), because if the user
subsequently logs out and then logs in with a different name, the trust token will not be valid for the new user name.

## Login as a trusted device
First retrieve the server's time:

    GET auth/time

The above API call returns a numeric value representing the server time as 64-bit integer (epoch time in milliseconds).
Using the server time just retrieved and the trust token created before, send the trusted login request:

    POST auth/trust
    {
      "name": "some-account@example.com",
      "password": "some-password",
      "device": "{device-name-or-uuid}",
      "trustSalt": "{server-time}-{random-UUID}",
      "trustHash": "{trust-hash}"
    }

Note that you must still send the user name and password. The client may also store these on the device for trusted
devices, however if the user later logs out, the password should be cleared.

In the above API call:

  * The value of the `trustSalt` property is the result of concatenating the server time retrieved earlier with the 
trust token created above, with a hyphen (`-`) in between them. For example: `1596484025953-2183e316-d5c2-11ea-9510-17d33a3add99`
  * The value of the `trustHash` property is the result of applying the SHA-256 hash algorithm to the `trustSalt`
concatenated with the trust token, with a hyphen (`-`) in between them. For example, if the trust token was `a71e4f34-d5c2-11ea-8126-ffd0d0d430fc`
and the `trustSalt` was `1596484025953-2183e316-d5c2-11ea-9510-17d33a3add99`, then the `trustHash` would be
`sha256("1596484025953-2183e316-d5c2-11ea-9510-17d33a3add99-a71e4f34-d5c2-11ea-8126-ffd0d0d430fc")` == `1399776f54aa7b28a2546f49961c81dda672ad7af4323e1de8b53bc6e618faa6`

If the API is successful, the return value is an `Account` object with a `token` property representing the session ID
that has been created and can be used for subsequent API calls requiring a valid session token.

## Removing trust for a device
If the user desires to remove trust for a device, send the following API call:

    DELETE auth/trust/{device-name-or-uuid}

This will remove the trust token for the device. The current API session token remains valid (the user is not logged out).
