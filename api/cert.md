# Bubble CA Certificate

In order to use Bubble Apps, a client must download and install the Bubble CA Certificate.

## Downloading the CA Certificate by Device Type
To download the CA Certificate:

    GET auth/cacert?deviceType={deviceType}

Where `{device-type}` is one of: `windows`, `macosx`, `ios`, `android`, `linux` or `other`.
The API will return the certificate in the response body.
The API will look at `deviceType` and return the certificate in the appropriate format for that device type.

## Downloading the CA Certificate by Specific Format
If the client knows exactly the certificate format that is desired:

    GET auth/cacert?type={certFormat}

Where `{certFormat}` is one of: `pem`, `p12`, `cer`, or `crt`
