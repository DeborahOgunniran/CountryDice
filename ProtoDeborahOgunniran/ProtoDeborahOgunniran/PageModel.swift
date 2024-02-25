//
//  PageModel.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 22/02/2024.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title", description: "just a simple description", imageUrl: "logo", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to CountryDice", description: "The best app that randomly pick a country for you to visit.", imageUrl: "logo", tag: 0),
        
        Page(name: "Discover New Destinations", description: "Browse through a vast collection of countries and explore their unique attractions and activities.", imageUrl: "plane", tag: 1),
        
        Page(name: "Plan Your Next Adventure", description: "Create your travel itinerary and find the perfect accommodations with CountryDice.", imageUrl: "plane", tag: 2)
        
    ]
    
    
}
