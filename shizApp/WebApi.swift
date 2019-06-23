//
//  WebApi.swift
//  shizApp
//
//  Created by Shizuka on 2019/06/23.
//  Copyright © 2019 shizuka. All rights reserved.
//

import Foundation

class URLSessionPostClient {
    
    func post(url urlString: String, parameters: [String : [String : [String : Any]]]) -> String {
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options:[])
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let response = response {
                print(response)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                } catch {
                    print("Serialize Error")
                }
            } else {
                print(error ?? "Error")
            }
        }
        task.resume()
        
        return "result"
    }
}

