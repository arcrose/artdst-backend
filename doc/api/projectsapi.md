<a href="apispec.md">Back to table</a>
<a name="projectadd"> </a>
# Create a new project
**https://api.artdst.com/v1/projets/add**

Creates a new project for the active user.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
siteId | 3 | **required** the ID of the site to add the project to. Can use siteName instead.
category | 3 | The ID of the category within which the project belongs.
name | Rocky Mountains | **required** The name or title of the project.
description | A mystery about Canadians. | A description of what the project is about.
fee | 5.25 | **required** The monthly subscription fee for access to the project.
optional | true | **required** Whether or not the fee is optional.
tags | 1,4,5 | An array of tags describing the project.

## Response fields

Name | Description
-----|------------
project | The newly created [project object](../models.md/#projectmodel], containing the ID for future use.

<a name="projectsearch"> </a>
# Search for projects
**https://api.artdst.com/v1/projects/search**

Finds projects a user might be interested in.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
inname | mystery | Used to find projects with provided text in their names.
categories | 1,3 or literature,film | An array of category names or IDs to look for projects in.
tags | 1,4 or mystery,detectives | An array of tag names or IDs to look for posts described by.
limit | 10 | The number of results to return. Maximum 20.
offset | 100 | Used to page through results.

## Response fields

Name | Description
-----|------------
projects | An array of [project objects](../models.md/#projectmodel).

<a name="projectpopular"> </a>
# Popular projects
**https://api.artdst.com/v1/projects/popular**

Gets a list of currently popular or trending projects.

HTTPS Method | Requires OAuth ID
-------------|------------------
GET          | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
limit | 10 | The number of results to return. Maximum 20.
offset | 30 | Used to page through results.

## Response fields

Name | Description
-----|------------
projects | An array of [project objects](../models.md/#projectmodel).

<a name="projectnew"> </a>
# New projects
**https://api.artdst.com/v1/projects/new**

Gets a list of recently created projects.

HTTP Method | Requires OAuth ID
-------------|------------------
GET          | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
limit | 15 | The number of results to return. Maximum 20.
offset | 25 | Used to page through results.

## Response fields

Name | Description
-----|------------
projects | An array of [project objects](../models.md/#projectmodel).

<a name="projlist"> </a>
# List projects in a site
**https://api.artdst.com/v1/projects/list**

Gets a list of projects in a site.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
siteId | 328 | **required** The ID of the site to get the projects from.
limit | 10 | The number of results to return. Maximum 20.
offset | 30 | Used to page through results.

## Response fields

Name | Description
-----|------------
projects | An array of [project objects](../models.md/#projectmodel).

<a name="projectupdate"> </a>
# Update project descriptors
**https://api.artdst.com/v1/projects/{pid}/update**

Updates project description fields.

HTTP Method | Requires OAuth ID
------------|------------------
PUT         | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
name | Turtles on a boat | The new name of the project.
description | An epic thriller about turtles. | A new description for the project.
fee | 3.14 | The new monthly fee to charge for subscriptions.
optional | false | Whether or not to make the fee optional.
visibility | true | Whether or not to make the project visible to other users.

## Response fields

Name | Description
-----|------------
updated | A boolean set to true if the update was successful.
project | The [project object](../models.md/#projectmodel) with updated fields.

<a name="projectaddrating"> </a>
# Add a user rating
**https://api.artdst.com/v1/projects/{pid}/rate**

Updates project description fields.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
rating | 4.0 | **required** The rating to add- must be between 0.0 and 5.0 inclusive.

## Response fields

Name | Description
-----|------------
updated | A boolean set to true if the update was successful.
rating | The new average rating of the project.

<a name="projectdelete"> </a>
# Delete project
**https://api.artdst.com/v1/projects/{pid}**

Deletes a project belonging to the active user.

HTTP Method | Requires OAuth ID
------------|------------------
DELETE      | Yes

## Parameters

All parameters are optional unless specified otherwise.

## Response fields

Name | Description
-----|------------
deleted | A boolean set to true if the deletion was successful.
