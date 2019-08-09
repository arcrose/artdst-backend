<a href="apispec.md">Back to table</a>
<a name="milestoneadd"> </a>
# Add a milestone
**https://api.artdst.com/v1/milestones/add**

Creates a new milestone for the active user to encourage support.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
goal | 102.00 | **required** The amount of money to be earned for the milestone to be met.
description | I will draw penguins | A description of what will be done when the milestone is met.

## Response fields

Name | Description
-----|------------
milestone | The [milestone object](../models.md/#milestonemodel) for the newly created milestone.

<a name="milestonelist"> </a>
# Listing milestones
**https://api.artdst.com/v1/milestones**

Gets a list of the milestones of artist- optionally one or several in particular.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
users | 1,2 or redwire,jrmiller | The IDs or usernames of users to get the milestones of.
limit | 20 | The number of results to return. Maximum 50.
offset | 300 | Used to page through results.

## Response fields

Name | Description
-----|------------
milestones | An array of [milestone objects](../models.md/#milestonemodel).

<a name="milestoneupdate"> </a>
# Updating milestone fields
**https://api.artdst.com/v1/milestones/{mid}/update**

Updates the descriptor fields of a milestone owned by the active user.

HTTP Method | Requires OAuth ID
------------|------------------
PUT         | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
goal | 40000.00 | The new goal amount for the milestone.
description | I will draw penguins and dragons! | A new description for the milestone.

## Response fields

Name | Description
-----|------------
updated | A boolean set to true when the update is succesful.
milestone | A [milestone object](../models.md/#milestonemodel) containing the newly updated data.

<a name="milestonedelete"> </a>
# Delete a milestone
**https://api.artdst.com/v1/milestones/{mid}**

Deletes a milestone owned by the active user.

HTTP Method | Requires OAuth ID
------------|------------------
DELETE      | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
deleted | A boolean set to true when the deletion was successful.
