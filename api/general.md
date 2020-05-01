# General Conventions

## API Base URI
Throughout these documents, specific endpoints are shown in their "minimal" form. When actually making API calls,
these minimal forms will be prefixed with some "API Base URI".

For a given hostname `foo.example.com`, the standard API Base URI would be `https://foo.example.com:1443/api/`

So if you see a reference like this:

    GET me

The actual API call you would make would be an HTTP GET to `https://foo.example.com:1443/api/me`

In this particular example, the API call would return the Account object for the currently logged-in user. 

## HTTP Request Methods

The Bubble API loosely adheres to REST standards.

Generally speaking:
 * `GET` is used to retrieve data; a `GET` request will not change any persistent data and is safe to call multiple times
 * `PUT` is used to create a new object
 * `POST` is used to update an existing object
 * `DELETE` is used to delete an existing object

## HTTP Request Body
For `GET` and `DELETE` requests, do not send any request body.

For `PUT` and `POST` requests, with a few exceptions, the request body will be a JSON object.

## HTTP Response Codes

### `200 OK`
This indicates that a request was successfully processed. Depending on the type of request, the response may or may not
contain a body.

A `GET` request will always have a body in the response.

The response body, with a few exceptions, will be either a JSON object or a JSON array.

### `422 Unprocessable Entity`
This usually indicates a validation error. The request itself was valid, but some data within the request body was invalid.

In this case, the response body will be a JSON array containing validation error objects. For example:

    [
      {"messageTemplate": "err.someField.someReason", "message": "There was someReason wrong about someField"},
      {"messageTemplate": "err.otherField.otherReason", "message": "There was otherReason wrong about otherField"},
      {"messageTemplate": "err.majorError.descriptionOfBadness", "message": "A majorError occurred, it was descriptionOfBadness"}
    ]

Within each validation error object:
 * `messageTemplate` is a symbolic name for the error
 * `message` is a default, English-language string for the error

A client application should know the user's locale, and should try to display the localized string for the `messageTemplate`.
A list of localized strings for a given locale can be retrieved from the API.
Read the [Message Localization](message_localization.md) section for more details.

If there is no localized message for the `messageTemplate`, or the client application does not yet support localization,
then the client should display the default English language string found in the `message` property.

### `401 Unauthorized`
This response means that the API call requires an authenticated user session, and no session token was sent, or the
session has expired. In this case, the client application should display a login screen so that the user can log in
again and start a new session.

### `403 Forbidden`
This response means that the user associated with the session does not have sufficient permissions to call the API
endpoint they were trying to call. Certain API calls are restricted to admin users. When a non-admin user tries
to call an API endpoint that is restricted to admin users, the caller will receive a 403 error.

### `404 Not Found`
This response usually means that the REST object that the caller was trying to read, update or delete does not exist.
It could also mean that the API endpoint itself does not exist, and could not be found.

### `500 Server Error`
This response means that something bad happened on the server. It wasn't the caller's fault. This is usually a bug
and indicates that something within the API must be fixed.

