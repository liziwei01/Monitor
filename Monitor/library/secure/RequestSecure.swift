//
//  RequestSecure.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

func GetSecure(url: URL) -> [String: Any] {
    let headers = ["Code": GetHashedString(conf.PrivateKey, Date().truncatedToHalfMinuteUnix())]
    let response = GetRequest(url: url, headers: headers)
    if let data = response["data"] as? [String: Any] {
        return data
    }
    return [:]
}

func GetRequest(url: URL, headers: [String: String]) -> [String: Any] {
    var request = URLRequest(url: url)
    request.allHTTPHeaderFields = headers
    request.httpMethod = "GET"

    let session = URLSession.shared
    let semaphore = DispatchSemaphore(value: 0)

    var responseData: [String: Any] = [:]
    let task = session.dataTask(with: request) { (data, response, error) in
        defer { semaphore.signal() }

        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode != 200 {
                print("Invalid response status code: \(httpResponse.statusCode)")
                return
            }
        }

        if let data = data {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    responseData = json
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                return
            }
        }
    }

    task.resume()
    semaphore.wait()

    return responseData
}
