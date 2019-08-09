<a href="apispec.md">Back to table</a>
<a name="userstatuses"> </a>
# User statuses
**https://api.artdst.com/v1/users/{uid}/statuses**

Used to find out what other users are interested in or working on.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|----------|------------
limit | 10 | Number of results to return, up to 25.
offset | 35 | Used to page through results.

## Response fields

Name | Description
-----|------------
statuses | An array of [status objects](../models.md/#statusmodel).

<a name="userupdate"> </a>
# Update user fields
**https://api.artdst.com/v1/users/{uid}/update**

Changes the information associated with a user.

HTTP Method | Requires OAuth ID
------------|-----------------
PUT         | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
email | jane@smith.com | The email of the user.
biography | I once was a unicorn | The new biography of the user.
displayname | too_cool4sch00l | The new display name for the user.

## Response fields

Name | Description
-----|------------
updated | A boolean set to true when the update completed successfully.
user | The [user object](../models.md/#usermodel) with updated fields.

<a name="usercommission"> </a>
# Commission an artist
**https://api.artdst.com/v1/users/{uid}/commission**

Commission an artist to work on something.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
subject | Please work on this! | The subject of the message to send.
message | I want to make a comic about vampires. | **required** The project description.

## Response fields

Name | Description
-----|------------
sent | A boolean set to true if the message was sent (may be false if user rejects commissions).
