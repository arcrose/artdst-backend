[Back to API table](api/apispec.md)

# Notes

In many cases it is impractical to produce an entire tree of data with all
the details filled out.  To handle this, API calls will often return minimal
versions of the models below.  This accomplishes three things:

1. It reduces the size of a lot of responses.
2. It separates requests for specific information into separate API calls.
3. It allows access to specific pieces of information to be restricted based on context.

Examples of sitations where this will occur:

1. When searching users, only basic information such as username, biography, etc. will be included.
2. When viewing a collection without an OAuth token, details about items will not be included.
3. When searching by tags or categories, only basic information about projects will be included.

<a name="usermodel"> </a>
# User Model

~~~js
{
  "id"            number,
  "username"      string,
  "joined"        date,
  "biography"     string,
  "displayName"   string,
  "lastActive"    date,
  "statuses"      []status,
  "projects"      []project,
  "subscriptions" []subscription,
  "comments"      []comment,
  "milestones"    []milestone
}
~~~

<a name="statusmodel"> </a>
# Status Model

~~~js
{
  "id"      number,
  "title"   string,
  "content" string,
  "posted"  date,
  "share"   project
}
~~~

<a name="sitemodel"> </a>
# Site Model

~~~js
{
  "id"       number,
  "name"     string,
  "projects" []project,
  "created"  date
}
~~~

<a name="projectmodel"> </a>
# Project Model

~~~js
{
  "id"             number,
  "name"           string,
  "description"    string,
  "rating"         number,
  "numRaters"      number,
  "created"        date,
  "monthlyFee"     number,
  "isFeeOptional"  boolean,
  "owner"          user,
  "mentioning"     []status,
  "categorization" category,
  "tags"           []tag,
  "collections"    []collection
}
~~~

<a name="categorymodel"> </a>
# Category Model

~~~js
{
  "id"   number,
  "name" string
}
~~~

<a name="tagmodel"> </a>
# Tag Model

~~~js
{
  "id"   number,
  "name" string
}
~~~

<a name="subscriptionmodel"> </a>
# Subscription Model

~~~js
{
  "id"           number,
  "updateMethod" string,
  "expires"      date,
  "project"      project,
  "owner"        user
}
~~~

<a name="collectionmodel"> </a>
# Collection Model

~~~js
{
  "id"          number,
  "name"        string,
  "description" string,
  "parent"      project,
  "items"       []item
  "tags"        []tag
}
~~~

<a name="itemmodel"> </a>
# Item Model

~~~js
{
  "id"        number,
  "index"     number,
  "location"  string,
  "mediaType" string,
  "created"   date,
  "parent"    collection,
  "comments"  []comment
}
~~~

<a name="commentmodel"> </a>
# Comment Model

~~~js
{
  "id"      number,
  "content" string,
  "posted"  date,
  "author"  user
}
~~~

<a name="milestonemodel"> </a>
# Milestone Model

~~~js
{
  "id"          number,
  "goal"        number,
  "earned"      number,
  "description" string,
  "owner"       user
}
~~~
