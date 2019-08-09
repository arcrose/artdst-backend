<a href="apispec.md">Back to table</a>
<a name="colladd"> </a>
# Adding collections
**https://api.artdst.com/v1/collections/add**

Creates a new collection inside a project.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
projectId | 8872 | **required** The ID of the project to add the collection to.
name | chapter 3 | A name for the chapter/album/... being created.
description | The villain makes their appearance! | A description for the collection contents.
visibility | false | Whether or not to make the collection visible to others.

## Response fields

Name | Description
-----|------------
collection | The newly created [collection object](../models.md/#collectionmodel).

<a name="colllist"> </a>
# List collections in a project
**https://api.artdst.com/v1/collections/list**

Gets a list of the collections in a project

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
projectId | 42 | **required** The ID of the project to list the collections of.
limit | 15 | The number of results to return. Maximum 15
offset | Used to page through results.

## Response fields

Name | Description
-----|------------
collections | An array of [collection objects](../models.md/#collectionmodel).

<a name="collupdate"> </a>
# Updating collections
**https://api.artdst.com/v1/collections/{cid}/update**

Sets descriptors belonging to a collection.

HTTP Method | Requires OAuth ID
------------|------------------
PUT         | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
name | A new rival | The new name for the collection.
description | An intense battle begins! | The new description for the collection.
visibility | true | Whether or not the collection is visible to others.

## Response fields

Name | Description
-----|------------
updated | A boolean set to true when the update was successful.
collection | The [collection object](../models.md/#collectionmodel) with updated fields.

<a name="colldelete"> </a>
# Delete a collection
**https://api.artdst.com/v1/collections/{cid}**

Deletes a collection in a project belonging to the active user and its items.

HTTP Method | Requires OAuth ID
------------|------------------
DELETE      | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
deleted | A boolean set to true when the deletion was successful.
