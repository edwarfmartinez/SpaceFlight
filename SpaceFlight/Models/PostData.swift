//
//  PostData.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import Foundation


// MARK: - Field
struct Field: Codable, Identifiable {
    var objectId: Int {
        return id
    }
    
    let id: Int
    let title: String
    let url: String
    let imageURL: String
    let newsSite, summary, publishedAt, updatedAt: String
    //let featured: Bool
    //let launches: [Launch]
    //let events: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id, title, url
        case imageURL = "imageUrl"
        case newsSite, summary, publishedAt, updatedAt //, featured
             //, launches, events
    }
}

// MARK: - Launch
struct Launch: Codable {
    let id, provider: String
}

typealias Fields = [Field]
