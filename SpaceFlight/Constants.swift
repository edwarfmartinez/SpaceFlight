//
//  Constants.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import Foundation
import SwiftUI
struct K {
    
    struct Colors{
        static let brandLightPurple =  Color("BrandLightPurple")
        static let brandDarkBlue =  Color("BrandDarkBlue")
        static let brandPurple =  Color("BrandPurple")
    }
    
    static let regsPerPage = 20 // Number of regs per page
    static let imageLoadingPlaceholder = "apple"
    static let allowedUrlCharacters = ":/.-_?"
    static let dateExtraChars = ".000Z"
    static let textDetailLink = "Read more..."
        
    struct tabs {
        static let titleArticles = "Articles"
        static let titleBlogs = "Blogs"
        static let titleNasaReports = "Nasa Reports"
        
        static let imageArticles = "list.dash"
        static let imageBlogs = "person.3.fill"
        static let imageNasaReports = "doc.on.doc.fill"
    }
    
    struct url {
        static let base = "https://api.spaceflightnewsapi.net/v3/articles?_limit=&_start="
        static let pathArticles = "/v3/articles"
        static let pathBlogs = "/v3/blogs"
        static let pathNasaReports = "/v3/reports"
        
        
    }

}
