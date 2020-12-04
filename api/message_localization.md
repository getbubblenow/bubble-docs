# Message Localization

Bubble supports internationalization/localization in a straightforward way.

Bubble relies on the client having some notion of the locale that the end user wishes to use.

If the user does not specify a locale, the Bubble itself has a default locale that will be used.

If all else fails, Bubble will fall back to the `en_US` locale as a last resort.

## Message Bundles

Bubble's localized strings are grouped into a few different message bundles:

  * `pre_auth`: messages that may need to be displayed before a user session has begun. As such, the API call to retrieve these does not require a user session.
  * `post_auth`: messages that would only be displayed for a logged-in user. A valid session is required.
  * `countries`: localized names of all countries in the world. Does not require a session.
  * `timezones`: localized names of all time zones in the world. Does not require a session.
  * `apps`: localized names for various app-specific messages. Each Bubble App contains its own localized messages. The `app` message bundle contains all messages for all apps for a given locale. A valid session is required.

### Retrieving a Message Bundle
To retrieve a message bundle, use the API endpoint `messages/{locale}/{bundle}`. For example:

    GET messages/en_US/pre_auth

The response will be JSON object where each property is a message key, and the corresponding value is the locale-specific translation.

If the client does not know the current locale, the string `detect` can be sent instead. In this case, the Bubble server
will guess the client's locale based on the IP address of the client. The server will try to determine which country that IP address is located within,
and use the default locale for that country.

## Locale-specific Formats
Formats for things like dates, times, currency amounts and so on are also expressed as messages, but they use a special
Handlebars syntax where the client is required to perform variable substitution on parts that enclosed in `{{curly_braces}}`

### Date/Time Formats
Date and time formats can use the Handlebars variables shown below. For each field, an example in English is shown

  * `YYYY`: full 4-digit year: `2021`
  * `YY`: last 2 digits of year: `21` could be `1921` or `2021`
  * `MMMM`: full month name: `January`
  * `MMM`: short month name: `Jan`
  * `MM`: two-digit month number, zero-padded if less than 10: `01` for January
  * `M`: month number, only one digit if less than 10: `1` for January
  * `EEE`: full day of week name: `Monday`
  * `E`: short day of week name: `Mon`
  * `dd`: two-digit day of month, zero-padded if less than 10: `01` for the first day of a month
  * `d`: day of month, only one digit if less than 10: `1` for the first day of a month
  * `H`: hour of day, using 24-hour clock: `23` for 11pm
  * `h`: hour of day, using 12-hour clock: `11` could be 11am or 11pm
  * `A`: AM/PM string, uppercase: `AM`
  * `a`: AM/PM string, lowercase: `am`
  * `m`: minutes, always zero-padded if less than 10: `01` to indicate one minute past the start of the hour
  * `s`: seconds, always zero-padded if less than 10: `01` to indicate one second past the start of the minute

For example, in the `post_auth` message bundle, the `en_US` string list contains:

    date_format_ssh_key_expiration={{E}} {{MMM}} {{d}}, {{YYYY}}

In the API, dates are represented as epoch times (milliseconds since the UNIX epoch).
A client should define a method that accepts a UNIX epoch in milliseconds and formats it according to the locale-specific format.
In the `en_US` locale, the above example might result in the string: `Fri Jun 5, 2020`

For a JavaScript example, you can see how the above logic is implement in the [bubble-web](https://git.bubblev.org/bubblev/bubble-web/src/branch/master/src/_store/index.js#L83) frontend code.
    
### Currency Formats
Currency formats can use the Handlebars variables shown below.

  * `totalMajorUnits`: the number of whole units of the currency. For example, in `en_US`, this is the number of dollars
  * `totalMinorUnits`: the number of one-hundredth of one whole unit of the currency. For example, in `en_US`, this is the number of cents
  * `currency`: the 3-letter currency abbreviation, for example `USD`
  * `messages`: a map that is the union of all message bundles (primary used to translate the `currency` abbreviation into a currency symbol)

For example, in the `post_auth` message bundle, the `en_US` string list contains:

    label_bill_total_format={{messages['currency_symbol_'+currency.toUpperCase()]}}{{totalMajorUnits}}{{totalMinorUnits === 0 ? '' : totalMinorUnits < 10 ? '.0'+totalMinorUnits : '.'+totalMinorUnits}}

In the API, currency amounts are represented as an integer number of minor currency units.
A client should define a method that accepts a currency name and an integer number of minor currency units and formats it according to the locale-specific format.
In the `en_US` locale, with the currency `USD`, the above example would format the amount 1234 as: `$12.34`, and the amount 2500 as `$25` 

Note that the currency symbol is determined using `messages['currency_symbol_'+currency.toUpperCase()]` -- this is
looking up the localized value for `currency_symbol_USD` in the , which is found in the `pre_auth` message bundle, and returns the string `$`
