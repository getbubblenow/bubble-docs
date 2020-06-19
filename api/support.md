# Support

Support options are available to users who need help.

## Retrieve System Configuration
Call `GET auth/support` on the sage API to get the support information.

If you know the user's locale, you can call `GET auth/support/{locale}` instead. For example `{locale}` might be `en_US`.
It is always safe to send a locale: if locale-specific support information is not available, the default support information will be returned. 

If you have started a session with a sage already, use that sage's base URI.

If you have not yet started any session, try each sage listed in the [boot.json](boot.md) file in order.

The JSON response to the above API call will look something like:

    {
      "site": "https://support.example.com",
      "email": "support@example.com"
    }

## Display Support Options
For the `site` support option, use the [localized message](message_localization.md) for `support_site_link`
as the web link text. For example, for `en_US`, this might be "Visit our Support Website".

For the `email` support option, use the [localized message](message_localization.md) for `support_email_link`
as the mailto link text. For example, for `en_US`, this might be "Send us an email".
