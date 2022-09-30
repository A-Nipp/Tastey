# Tastey
Apprenticeship Spring 2022 - Final Project Repository

### Project description
*Tastey* is a media taste recommendation app built using SwiftUI. The user enters any musical artists, shows, movies, etc. they're interested in. *Tastey* then uses the TasteDive API to fetch recommendations according to the user's queries. 

![](https://github.com/A-Nipp/Tastey/blob/main/search_clip.gif)

The user can enter any number of search items. When they're ready, they can fetch the recommendations from the API. The API returns the names and Wikipedia URLs of the recommended items. *Tastey* then uses the SwiftSoup library to scrape the Wikipedia page for a relevant image URL. 

![](https://github.com/A-Nipp/Tastey/blob/main/artist_details.gif)

The user can then click on each artist for a more detailed view. They can also save artists to the machine's CoreData for later!
