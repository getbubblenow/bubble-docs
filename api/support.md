# Support

Support options are available to users who need help.

## Retrieve System Configuration
Call `GET auth/configs` on the sage API to get the system configuration options.

If you have started a session with a sage already, use that sage's base URI.

If you have not yet started any session, try each sage listed in the [boot.json](boot.md) file in order.

The JSON response to the above API call will look something like:

    {
      ...
      "support": {
        "site": "https://support.example.com",
        "email": "support@example.com"
      }
      ...
    }

## Display Support Options
For the `site` support option, use the [localized message](message_localization.md) for `support_site_link`
as the web link text. For example, for `en_US`, this might be "Visit our Support Website".

For the `email` support option, use the [localized message](message_localization.md) for `support_email_link`
as the mailto link text. For example, for `en_US`, this might be "Send us an email".
