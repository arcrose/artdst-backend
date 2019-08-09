# Authentication Scheme

Because artdst is fundamentally being designed as a RESTful service, we cannot use the tried-and-true session-based authentication schemes used by other kinds of web applications. However, because artdst is not *just* an API either, but also a full-fledged web service (which simply uses the API to do work), we need to consider secure means of authentication and  registration that fit into our model.

## Resource Server

At the core of artdst is the resource server, which exposes and handles requests made to the artdst API. The resource server will also store, along with other resources, user credentials. This means that all consumers of the API, including the artdst site itself, will have to forward authentication to the resource server. The resource server will handle four user actions:

1. Registering a new user account.
2. Verifying the authenticity of user credentials.
3. Providing identifier tokens for authenticated users.
4. Deleting user account data.

## Consumers

Consumers of the artdst API will be expected to sign requests using the resource server's public key using RSASSA using SHA-512 hash algorithm, and to decode responses using the same algorithm.  Responses will be signed with the resource server's private key. The resource server uses [JSON Web Tokens](https://github.com/auth0/node-jsonwebtoken) to accomplish the signing of responses and verification of signatures over requests.

### Application

Owners of consumer services will have to [send a request](https://api.artdst.com/consumers) to be granted access to restricted parts of the API. After being approved, consumers will be able to forward users of their service onto the resource server's [authentication page](https://api.artdst.com/authenticate).

A consumer's keys are recommended to be 4096-bit RSA keys.  Such a key pair can be generated with the command

	ssh-keygen -t rsa -b 4096

When applying to become a consumer, it is not the public key that is uploaded directly, but a signed certificate, created with the following command:

	openssl req -new -x509 -key <private key> -out cert.pem -days 365

Where the private key is your private RSA key that the consumer application will be signing requests with.

### Using the API

Accepted consumers can use the following process to obtain an access token for a user who has granted permission to the consumer service:

1. Redirect the user to `https://api.artdst.com/authenticate`.
2. The request should have the `Referrer` header set to the page the user will be redirected to after loggin in.
3. The request should also set a `callbackURL` field, which the resource server will make a request to to provide the access token.

Note that the URL can include query parameters to help the consumer determine the identity of the user who has authenticated.  For example, the following callback URL might be used:

	https://artdstconsumer.com/authcallback?sessionID=97123

# User Account Interface

## Registration

### Request

To register a user, a `POST` request to `/register` **must** contain the following fields:

1. `username` - the username that will uniquely identify the user during login.
2. `password` - the password that a registered user will supply to be authenticated for access.
3. `email`    - a contact email address that can be used to send information directly to the account owner.

Also, the following fields **may optionally** be provided:

1. `referrer`    - a URL to redirect the user to after they have registered and logged in.
2. `callbackURL` - a URL to send a request containing a newly created authentication token to the consumer.

### Response

A **successful** registration will return the following fields:

1. `referrer`    - the referrer that was provided in the request, to be passed onto the login phase.
2. `callbackURL` - the callbackURL that was provided in the request, to be passed onto the login phase.
3. `message`     - a simple message stating that registration was successful.

A **failed** registration will respond with the `referrer` and `callbackURL` fields, but in place of the
`message` field, an `error` field containing a simple description of whatever problem occurred will be
provided.

## Login

### Request

To login a user, a `POST` request to `/login` **must** contain the following fields:

1. `username`    - the username that identifies the user.
2. `password`    - the password required to authenticate the user.
3. `referrer`    - the URL to redirect the user to after they log in.
4. `callbackURL` - a URL to to send a request to containing a newly created authentication token to the consumer.

### Response

#### Response to login caller

In response to a **successful** request to `/login`, the following fields will be provided:

1. `referrer` - the referrer URL provided in the request to `/login`.
2. `response` - the data in the response from the consumer callback request.

A **failed** request will provide the same `referrer` field, but in place of `response`, an `error` field
containing a simple explanation of the error that occurred will be provided.

#### Response to the consumer

In making the `POST` request the the `callbackURL` provided, the only information that will be sent as the
data will be the signed authentication token.
