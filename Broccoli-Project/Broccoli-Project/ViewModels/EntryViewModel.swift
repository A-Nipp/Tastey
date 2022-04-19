//
//  EntryViewModel.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/16/22.
//

import Foundation
import CoreData.NSManagedObjectID

/// View model for a search entry. Accepts a `TDItem` as a parameter, from which it derives most if its data. These objects are essentially wrappers for the `TDItem` data returned by the
/// TasteDiveService. This view model helps the application fetch the image URL of the described media item for the views. It also specifies the method for adding an item to the saved list.
class EntryViewModel: ObservableObject {
    let data: TDItem
    @Published var imgURLString: String?
    var entryID: NSManagedObjectID?
    
    init(data: TDItem) {
        self.data = data
        imgURLString = nil
    }
     
    func fetchImageURL() {
        guard let url = data.wUrl else {
            print("No wURL available")
            DispatchQueue.main.async {
                self.imgURLString = ""
            }
            return
        }
        let imgURL = HTMLParser.getImageURLString(wURLString: url)
        DispatchQueue.main.async {
            self.imgURLString = imgURL
        }
    }
    
    func addToWatchlist() {
        guard data.name != "", data.type != "", imgURLString != "" else {
            return
        }
        
        let entry = EntryData(context: CoreDataManager.shared.viewContext)
        entry.type = data.type
        entry.name = data.name
        entry.yID = data.yID
        entry.wTeaser = data.wTeaser
        entry.wUrl = data.wUrl
        entry.yUrl = data.yUrl
        entry.imageUrl = imgURLString
        CoreDataManager.shared.save()
        entryID = entry.objectID
    }
    
    func deleteFromWatchlist() {
        guard let entryID = entryID else {
            return
        }
        
        let existingEntryData = CoreDataManager.shared.getEntryDataBy(id: entryID)
        if let existingEntryData = existingEntryData {
            CoreDataManager.shared.delete(entry: existingEntryData)
        }
    }
}
