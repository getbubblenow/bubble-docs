# Bubble Environment File

The Bubble API loads environment variables from the `~/.bubble.env` file.

When running tests, the file `~/bubble-test.env` file is used.

The settings in this file are used to populate variables in the [bubble-config.yml](https://git.bubblev.org/bubblev/bubble/src/branch/master/bubble-server/src/main/resources/bubble-config.yml) file
(for tests, the [test-bubble-config.yml](https://git.bubblev.org/bubblev/bubble/src/branch/master/bubble-server/src/test/resources/test-bubble-config.yml) file is used).

These yaml config files are loaded from within the Bubble JAR file itself, so if you change them, you'll need to rebuild the Bubble JAR file.
Generally you won't usually have to change this file directly, since most of the interesting configuration options are set via environment variables,
which are read from `~/.bubble.env` or `~/.bubble-test.env`.

To simplify development, it is often easiest to set `~/bubble-test.env` to be a symlink to `~/.bubble.env`:

   `cd ${HOME} && ln -s .bubble.env .bubble-test.env`

## Environment Variables

Variable            | Required | Description
--------------------|----------|----------------------------------
PUBLIC_BASE_URI     | ALL      | URLs that refer back to the current bubble node will use this base URI
LETSENCRYPT_EMAIL   | ALL      | Email address to use when performing one-time registration with LetsEncrypt, for creating SSL certificates
