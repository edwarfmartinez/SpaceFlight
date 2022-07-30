//
//  NetworkManager.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var fields = Fields()
    @Published private var _isLoading: Bool = false
    
    func fetchData(start: Int, urlPath: String) {
        print("getting", start)
        _isLoading = true
        var urlComponents = URLComponents(string: K.url.base)
        print("urlComponents?.path: \(urlComponents?.path as Any)")
        urlComponents?.path = urlPath
        
        urlComponents?.queryItems![0].value = String(K.regsPerPage) // Add parameters
        urlComponents?.queryItems![1].value = String(start)
          
        if let url = urlComponents?.url{
            print("url: \(url)")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Fields.self, from: safeData)
                            DispatchQueue.main.async {
                                //self.fields = results
                                self.fields.append(contentsOf: results)
                                //sleep(2)
                            }
                            
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
            
        }
        _isLoading = false

    }
    
    var isLoading: Bool {
            get { return _isLoading}
        }
}
