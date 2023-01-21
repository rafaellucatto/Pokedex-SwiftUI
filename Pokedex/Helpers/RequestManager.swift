//
//  RequestManager.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation

/// An enum for custom errors
enum RequestError: Error {
    case didReceiveErrorFromAPI(error: Error)
    case didNotGetJSONFromData
    case didNotReceiveData
    case didNotBuildURL
}

/// A class created to handle requests
class RequestManager {
    /// Private initializer
    private init() {}
    /// Singleton
    static let shared: RequestManager = .init()
    /// Makes request to the API and returns the expected data in JSON format
    /// - Parameters:
    ///   - url: The URL that the data will be received from
    ///   - expectedType: Type of object to get the JSON for
    ///   - completion: Completion to handle success and failure
    func request<T: Decodable>(url: String, expectedType: T.Type, completion: @escaping (Result<T, RequestError>) -> Void) {
        guard let url: URL = .init(string: url) else {
            completion(.failure(.didNotBuildURL))
            return
        }
        let urlRequest: URLRequest = .init(url: url)
        printRequest(urlRequest: urlRequest)
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, urlResponse, error in
            self?.printResponse(urlResponse: urlResponse)
            if let error: Error = error {
                completion(.failure(.didReceiveErrorFromAPI(error: error)))
                return
            }
            guard let data: Data = data else {
                completion(.failure(.didNotReceiveData))
                return
            }
            guard let t: T = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.didNotGetJSONFromData))
                return
            }
            completion(.success(t))
        }
        .resume()
    }

    /// Prints request method and its URL
    /// - Parameter urlRequest: request to get the method and the URL from
    private func printRequest(urlRequest: URLRequest) {
        if let httpMethod: String = urlRequest.httpMethod?.description, let stringUrl: String = urlRequest.url?.absoluteString {
            print("RM | ------------------------------------------")
            print("RM | \(httpMethod.uppercased()) \(stringUrl)")
        }
    }

    /// Prints response status code, URL, and its headers
    /// - Parameter urlResponse: response to get the status code, the URL and the headers from
    private func printResponse(urlResponse: URLResponse?) {
        if let response: HTTPURLResponse = urlResponse as? HTTPURLResponse, let stringURL: String = urlResponse?.url?.absoluteString {
            print("RM | ------------------------------------------")
            print("RM | \(response.statusCode.description) \(stringURL)")
            print("RM | Headers: [")
            let sortedKeys: [Dictionary<AnyHashable, Any>.Keys.Element] = response.allHeaderFields.keys.sorted { $0.description < $1.description }
            for k in sortedKeys {
                print("RM |     \(k.description)", terminator: ": ")
                print(response.value(forHTTPHeaderField: k.description)?.description ?? "No value for this key.")
            }
            print("RM | ]")
        }
    }

}
