# Plans and Payment
Create and manage plans and payment methods.

## Open Source Bubbles
A Bubble launched using the Bubble open source code will still have plans, because a plan determines a lot
of things (compute instance size, apps, etc). However, all plans will have a price of zero
and any payment steps during registration or launch are skipped.

## List Bubble Plans

    GET plans

Returns an array of BubblePlan objects.

## List Payment Methods

    GET me/paymentMethods

Returns an array of AccountPaymentMethod objects.

## Add a Payment Method

    PUT me/paymentMethods
    {
        "paymentMethodType": "credit",
        "paymentInfo": "{stripeToken}"
    }

Create the `{stripeToken}` value by tokenizing a credit card using the Stripe client libraries. In order to use the Stripe
client libraries, you'll need a Stripe public key.

### Loading the Stripe Public Key
Call:

    GET paymentMethods

This returns an array of PaymentMethods supported by the Sage. Walk the array and find the object with `"driverClass" : "bubble.cloud.payment.stripe.StripePaymentDriver"`.
Within this object, the public key is the value of the `driverConfig.publicApiKey` property. It starts with `pk_`.

## List Account Plans

    GET me/plans

Returns an array of AccountPlan objects.

## Add a New Account Plan
Before a Bubble can be launched, an AccountPlan must be created.
After successfully creating an Account Plan, you can then [launch a Bubble](bubbles.md) for the plan. 

The simplest way to create a new Account Plan is:

    PUT me/plans
    {}

The above call will create a plan using all the default values. Note that you must pass an empty JSON object as
the entity body.

To create a fully specified Account Plan:

    PUT me/plans
    {
        "nickname": "{nick}",
        "domain": "{domain}",
        "locale": "{locale}",
        "timezone": "{timezone}",
        "plan": "{plan}",
        "footprint": "{footprint}",
        "sshKey": "{sshKeyUuid}",
        "paymentMethodObject": {
            "paymentMethodType": "credit",
            "paymentInfo": "{stripeToken}"
        }
    }

Notes:
 * `{nick}` can be any nickname for the plan, this will become the nickname of the Bubble. Max 100 chars.
 * `{domain}` must be the `name` or `uuid` of a valid BubbleDomain.
   * List domains with `GET me/domains`
 * `{locale}` must be a supported locale, or `detect` to detect locale.
   * To list locales: call `GET auth/configs`, the returned JSON object contains a `locales` property, which is an array of strings, each representing a supported locale.
   * To display the name of a locale, show the value of the `locale_{locale}` [message resource](message_localization.md). For example, in the `en_US` locale, the message resource `locale_en_US` is "English (US)".
 * `{timezone}` must be a valid time zone, or `detect` to detect time zone.
   * To list time zones: call `GET timezones`. Use the `timeZoneId` property when creating an Account Plan.
   * To display the name of a time zone, show the value of the `tz_name_{timeZoneId}` [message resource](message_localization.md), with any spaces in `timeZoneId` replaced with underscores. For example, in the `en_US` locale, the message resource `tz_name_America/New_York` is "America/New York".
 * `{plan}` must be the `name` or `uuid` of a BubblePlan (see "List Bubble Plans" above)
 * `{footprint}` must be the `name` or `uuid` of a BubbleFootprint.
   * To list footprints: call `GET me/footprints`
   * To display the name of a footprint, show the value of the `footprint_name_{footprint}` [message resource](message_localization.md). For example, in the `en_US` locale, the message resource `footprint_name_Worldwide` is "World-wide".
   * To display the description for a footprint, show the value of the `footprint_description_{footprint}` [message resource](message_localization.md). For example, in the `en_US` locale, the message resource `footprint_description_Worldwide` is "Your Bubble can run anywhere in the world".
 * `{sshKey}` must be the `uuid` of a valid SSH Key.
   * To list SSH Keys: call `GET me/keys`
 * `{paymentMethodObject}` must be a valid JSON object as described above in "Add a Payment Method"

## Delete an Account Plan

    DELETE me/plans/{uuid}

This will also stop and delete any Bubble associated with the Account Plan.
All backups for the Bubble will also be deleted.
