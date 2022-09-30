# Tastey
Apprenticeship Spring 2022 - Final Project Repository

### Project description
*Tastey* is a media taste recommendation app built using SwiftUI. The user enters any musical artists, shows, movies, etc. they're interested in. *Tastey* then uses the TasteDive API to fetch recommendations according to the user's queries. 

<div style="text-align: center;">
<img src="search_clip.gif" alt="drawing" width="200"/>
</div>

The user can enter any number of search items. When they're ready, they can fetch the recommendations from the API. The API returns the names and Wikipedia URLs of the recommended items. *Tastey* then uses the SwiftSoup library to scrape the Wikipedia page for a relevant image URL. 

<div style="text-align: center;">
<img src="artist_details.gif" alt="drawing" width="200"/>
</div>

The user can then click on each entry for a more detailed view. The user can also save entries to the machine's CoreData so they can view them later.
