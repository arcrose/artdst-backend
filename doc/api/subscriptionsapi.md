<a href="apispec.md">Back to table</a>
<a name="subadd"> </a>
# Subscribing to projects
**https://api.artdst.com/v1/subscriptions/add**

Creates a new subscription for the active user to a project.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
projectId | 32912 | **required** The ID of the project to subscribe to.
updateMethod | email | **required** The method to use to update the user one of (email, notification, both).

## Response fields

Name | Description
-----|------------
subscription | The newly created subscription object.

<a name="sublist"> </a>
# Listing user subscriptions
**https://api.artdst.com/v1/subscriptions**

Gets the list of subscriptions owned by the currenlty active user.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
limit | 10 | The number of results to return. Maximum 50.
offset | 150 | Used to page through results.

## Response fields

Name | Description
-----|------------
subscriptions | An array of subscription objects with minimal project objects.

<a name="subexpired"> </a>
# Testing for subscription expiration
**https://api.artdst.com/v1/subscriptions/{sid}/expired**

Determines whether a given subscription owned by the active user is still valid.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
expired | A boolean set to true when the subscription in question has expired.

<a name="subpayment"> </a>
# Make a payment
**https://api.artdst.com/v1/subscriptions/{sid}/pay**

Opens a channel to confirm a subscription payment through for the active user.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
paymentURL | A URL that can be POSTed to to confirm a payment has been made.

<a name="subdelete"> </a>
# Delete a subscription
**https://api.artdst.com/v1/subscriptions/{sid}**

Deletes a subscription owned by the active user.

HTTP Method | Requires OAuth ID
------------|------------------
DELETE      | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
deleted | A boolean set to true when the deletion was successful.
