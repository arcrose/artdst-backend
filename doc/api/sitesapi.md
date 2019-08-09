<a href="apispec.md">Back to table</a>
<a name="siteadd"> </a>
# Add a site
**https://api.artdst.com/v1/sites/add**

Creates a new site, which houses groups of projects, for the active user.

HTTP Method | Requires OAuth ID
------------|------------------
POST        | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
name | magequest | **required** A name for the site.

## Response fields

Name | Description
-----|------------
site | A minimal [site object](../models.md/#sitemodel).

<a name="sitesearch"> </a>
# Search sites
**https://api.artdst.com/v1/sites/search**

HTTP Method | Requires OAuth ID
------------|------------------
GET         | No

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
inname | bunny | A substring to find in the names of sites.
categories | 1,2 or literature,comic | An array of category names or IDs to look for projects in.
tags | 1,3 or horror,dragons | An array of tag names or IDs to look for projects described by.
limit | 20 | Number of results to return. Maximum 30.
offset | 40 | Used to page through results.

## Response fields

Name | Description
-----|------------
sites | An array of [site models](../models.md/#sitemodel).

<a name="sitelist"> </a>
# Listing sites
**https://api.artdst.com/v1/sites**

Gets the sites owned by the active user.

HTTP Method | Requires OAuth ID
------------|------------------
GET         | Yes

## Parameters

All parameters are optional unless specified otherwise.

Name | Example | Description
-----|---------|------------
limit | 10 | The number of results to return. Maximum 20.
offset | 30 | Used to page through results.

## Response fields

Name | Description
-----|------------
sites | An array of [site models](../models.md/#sitemodel) owned by the active user.
