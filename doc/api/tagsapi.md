<a href="apispec.md">Back to table</a>
<a name="tagadd"> </a>
# Creating a tag
**https://api.artdst.com/v1/tags/add**

Creates a new tag that can be used to describe collections and projects.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
name | dragons | **required** A simple descriptive name.

## Response fields

Name | Description
-----|------------
tag  | A newly created [tag object](../models.md/#tagmodel).

<a name="taglist"> </a>
# Listing tags
**https://api.artdst.com/v1/tags**

Gets a list of all existing tags.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
limit | 100 | The number of results to return. Maximum 200.
offset | 300 | Used to page through results.

## Response fields

Name | Description
-----|------------
tags | An array of [tag objects](../models.md/#tagmodel).
