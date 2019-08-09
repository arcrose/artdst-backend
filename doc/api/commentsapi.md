<a href="apispec.md">Back to table</a>
<a name="commadd"> </a>
# Adding comments to items
**https://api.artdst.com/v1/comments/add**

Creates a new comment on an item by the active user.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
itemId | 3287 | **required** The ID of the item to post the comment on.
content | This is beautiful! | **required** The contents of the comment to post.

## Response fields

Name | Description
-----|------------
posted | A boolean set to true when the comment was successfully posted.
comment | The [comment object](../models.md/#commentmodel) created on the item in question.

<a name="commlist"> </a>
# List comments under an item
**https://api.artdst.com/v1/comments/list**

Gets a list of the comments on an item.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
itemId | 7612 | **required** The ID of the item to get the comments from.
limit | 10 | The number of results to return. Maximum 30.
offset | 35 | Used to page through results

## Response fields

Name | Description
-----|------------
comments | An array of [comment objects](../models.md/#commentmodel).

<a name="commdelete"> </a>
# Delete a comment
**https://api.artdst.com/v1/comments/{cid}**

Deletes a comment owned by the comment owner or project owner.

HTTP Method | Requires OAuth ID
------------|------------------
DELETE      | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
deleted | A boolean set to true when the deletion was successful.
