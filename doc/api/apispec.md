# API Endpoints

<table>
	<tr>
		<th>Resource</th>
		<th>General</th>
		<th>Aspects</th>
		<th>Actions</th>
	</tr>
	<tr>
		<td>users</td>
		<td>
		</td>
		<td>
			<ul>
				<li><a href="usersapi.md/#userstatuses">statuses</a></li>
			</ul>
		</td>
		<td>
			<ul>
				<li><a href="usersapi.md/#userupdate">update</a></li>
				<li><a href="usersapi.md/#usercommission">commission</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>sites</td>
		<td>
 			<ul>
				<li><a href="sitesapi.md/#siteadd">add</a></li>
				<li><a href="sitesapi.md/#sitelist">list</a></li>
        <li><a href="sitesapi.md/#sitesearch">search</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td>projects</td>
		<td>
			<ul>
				<li><a href="projectsapi.md/#projectadd">add</a></li>
				<li><a href="projectsapi.md/#projectsearch">search</a></li>
				<li><a href="projectsapi.md/#projectpopular">popular</a></li>
				<li><a href="projectsapi.md/#projectnew">new</a></list>
				<li><a href="projectsapi.md/#projlist">projects</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
			<ul>
				<li><a href="projectsapi.md/#projectupdate">update</a></li>
        <li><a href="projectsapi.md/#projectaddrating">rate</a></li>
				<li><a href="projectsapi.md/#projectdelete">delete</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>categories</td>
		<td>
			<ul>
				<li><a href="categoriesapi.md/#categorylist">list</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td>collections</td>
		<td>
			<ul>
				<li><a href="collectionsapi.md/#colladd">add</a></li>
				<li><a href="collectionsapi.md/#colllist">collections</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
			<ul>
				<li><a href="collectionsapi.md/#collupdate">update</a></li>
				<li><a href="collectionsapi.md/#colldelete">delete</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>items</td>
		<td>
			<ul>
				<li><a href="itemsapi.md/#itemadd">add</a></li>
        <li><a href="itemsapi.md/#itemlist">list</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
			<ul>
				<li><a href="itemsapi.md/#itemdelete">delete</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>comments</td>
		<td>
			<ul>
				<li><a href="commentsapi.md/#commadd">add</a></li>
        <li><a href="commentsapi.md/#commlist">list</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
			<ul>
				<li><a href="commentsapi.md/#commdelete">delete</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>milestones</td>
		<td>
			<ul>
				<li><a href="milestonesapi.md/#milestoneadd">add</a></li>
				<li><a href="milestonesapi.md/#milestonelist">list</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
			<ul>
				<li><a href="milestonesapi.md/#milestoneupdate">update</a></li>
				<li><a href="milestonesapi.md/#milestonedelete">delete</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>subscriptions</td>
		<td>
			<ul>
				<li><a href="subscriptionsapi.md/#subadd">add</a></li>
				<li><a href="subscriptionsapi.md/#sublist">list</a></li>
			</ul>
		</td>
		<td>
			<ul>
				<li><a href="subscriptionsapi.md/#subexpired">expired</a></li>
			</ul>
		</td>
		<td>
			<ul>
				<li><a href="subscriptionsapi.md/#subpayment">makepayment</a></li>
				<li><a href="subscriptionsapi.md/#subdelete">delete</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>tags</td>
		<td>
			<ul>
				<li><a href="tagsapi.md/#tagadd">add</a></li>
				<li><a href="tagsapi.md/#taglist">list</a></li>
			</ul>
		</td>
		<td>
		</td>
		<td>
		</td>
	</tr>
</table>

# Response format

*Throughout this document, any errors resulting from a request are returned in the following format:*

~~~javascript
{
	"success": false,
	"error": <message>
}
~~~

*Successful actions/requests will return JSON of the format:*
~~~javascript
{
	"success": true,
	"data": <data>
}
~~~
*The API spec concerns itself with the data field when describing return values.*

# Notes

Anywhere an OAuth token is required, the token must be provided as a parameter in the URL with the name "token".
So, for example, the URL you would POST to to create a new project will look like the following:

    https://api.artdst.com/v1/projects/add?token=MYLONGOAUTHTOKEN

Some API calls allow for either GET or POST to be used.  In such cases, using GET is meant for retrieving
minimal information about some object(s), and will not require an authentication token.  Using POST in
these cases is for retrieving more detailed information, which requires authentication.
