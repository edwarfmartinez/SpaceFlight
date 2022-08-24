//
//  NetworkManager.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var fieldsArticles = Fields()
    @Published var fieldsBlogs = Fields()
    @Published var fieldsNasaReports = Fields()
    @Published var startIndex: Int = 0
    @Published private var _isLoading: Bool = false
    var isLoading: Bool {
        get { return _isLoading}
    }
    let dateFormatter = DateFormatter()

    
    
    func fetchData(start: Int, urlPath: String) {
        
        _isLoading = true
        
        var urlComponents = URLComponents(string: K.url.base)
        urlComponents?.path = urlPath
        urlComponents?.queryItems![0].value = String(K.regsPerPage) // Add parameters
        urlComponents?.queryItems![1].value = String(start)
        guard let url = urlComponents?.url else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            let decoder = JSONDecoder()
            guard let safeData = data else { return }
            do {
                var results = try decoder.decode(Fields.self, from: safeData)
                DispatchQueue.main.async {
                    
                    // Avoid crash because of special characters in Url: Allowed chars setting
                    var allowed = CharacterSet()
                    allowed.formUnion(.lowercaseLetters)
                    allowed.formUnion(.uppercaseLetters)
                    allowed.formUnion(.decimalDigits)
                    allowed.insert(charactersIn: K.allowedUrlCharacters)
                    
                    //Iteration to avoid special chars in ImageUrl
                    for (index, _) in results.enumerated() {
                        results[index].imageURL = results[index].imageURL.addingPercentEncoding(withAllowedCharacters: allowed)!
                        if let range = results[index].publishedAt.range(of: K.dateExtraChars) {
                            results[index].publishedAt.removeSubrange(range)
                        }
                    }
                    
                    //Add registers of Articles/Blogs/Reports
                    switch urlPath{
                    case K.url.pathArticles:
                        self.fieldsArticles.append(contentsOf: results)
                    case K.url.pathBlogs:
                        self.fieldsBlogs.append(contentsOf: results)
                    default:
                        self.fieldsNasaReports.append(contentsOf: results)
                    }
                    
                    print("imageUrl: \(results.map{$0.imageURL})")
                    self._isLoading = false
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func infiniteScrollValidation(fieldId: Int, urlPath: String){
        var fieldIdScrollLimit = 0
        
        switch urlPath{
        case K.url.pathArticles:
            fieldIdScrollLimit = fieldsArticles[fieldsArticles.count - 2].id
        case K.url.pathBlogs:
            fieldIdScrollLimit = fieldsBlogs[fieldsBlogs.count - 2].id
        default:
            fieldIdScrollLimit = fieldsNasaReports[fieldsNasaReports.count - 2].id
        }
        
        if fieldId == fieldIdScrollLimit {
            startIndex += K.regsPerPage
            fetchData(start: startIndex, urlPath: urlPath)
        }
    }
}



