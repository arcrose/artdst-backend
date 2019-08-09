<a href="apispec.md">Back to table</a>
<a name="itemadd"> </a>
# Adding items
**https://api.artdst.com/v1/items/add**

Adds an item to a collection in a project owned by the active user.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
collectionId | 32511 | **required** The ID of the collection to add the item to.
name | A starry sky | A title for the particular item.
index | 3 | **required** The zero-based index of the item in the collection.
type | image/gif | **required** The [content-type](https://en.wikipedia.org/wiki/Internet_media_type#List_of_common_media_types) of the item.

## Response fields

Name | Description
-----|------------
uploadURL | A URL to send POSTs to containing parts of the file upload.
item | An [item object](../models.md/#itemmodel) containing descriptors for the item being uploaded.

<a name="itemlist"> </a>
# List items in a collection
**https://api.artdst.com/v1/items/list**

Gets all of the items in a collection

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
collectionId | 1 | **required** The ID of the collection to get the items of.
limit | 20 | The number of results to return. Maximum 30.
offset | 15 | Used to page through results.

## Response fields

Name | Description
-----|------------
items | An array of [item objects](../models.md/#itemmodel).

<a name="itemdelete"> </a>
# Delete an item
**https://api.artdst.com/v1/items/{iid}**

Deletes an item from a collection in a project owned by the active user.

HTTP Method | Requires OAuth ID
------------|------------------
DELETE      | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
deleted | A boolean set to true when the deletion was successful.
