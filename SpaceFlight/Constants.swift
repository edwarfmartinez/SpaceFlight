//
//  Constants.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import Foundation

struct K {
    
    static let regsPerPage = 20 // Number of regs per page

    struct tabs {
        static let titleArticles = "Articles"
        static let titleBlogs = "Blogs"
        static let titleNasaReports = "Nasa Reports"
    }
    
    
    struct url {
        static let base = "https://api.spaceflightnewsapi.net/v3/articles?_limit=&_start="
        
        static let pathArticles = "/v3/articles"
        static let pathBlogs = "/v3/blogs"
        static let pathNasa = "/v3/reports"
        
        
    }

}
