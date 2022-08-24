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
    var imageURL, publishedAt: String
    let newsSite, summary,  updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, title, url
        case imageURL = "imageUrl"
        case newsSite, summary, publishedAt, updatedAt 
    }
}

// MARK: - Launch
struct Launch: Codable {
    let id, provider: String
}

typealias Fields = [Field]
