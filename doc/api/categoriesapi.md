<a href="apispec.md">Back to table</a>
<a name="categorylist"> </a>
# List categories
**https://api.artdst.com/v1/categories**

Gets a list of all the categories projects can fit under.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
categories | An array of all the [category objects](../models.md/#categorymodel).
