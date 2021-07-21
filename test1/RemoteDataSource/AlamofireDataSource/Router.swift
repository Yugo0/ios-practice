//
//  Router.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit
import Alamofire

struct Router {
    
    public static var baseUrl: URL = URL(string: "https://jsonplaceholder.typicode.com")!
    
    enum Photos: URLRequestConvertible {
        case getPhotos
        case getPhotoById(photoId: Int)
        
        var resource: String {
            switch self {
            case .getPhotos: return "/photos"
            case .getPhotoById: return "/photos/%d"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getPhotos: return .get
            case .getPhotoById: return .get
            }
        }
        
        var path: String {
            switch self {
            case .getPhotos: return resource
            case let .getPhotoById(photoId): return String(format: resource, photoId)
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            var request = URLRequest(url: baseUrl.appendingPathComponent(path))
            request.method = method
            
            switch self {
            case .getPhotos:
                break
            case .getPhotoById:
                break
            }
            
            return request
        }
    }
}
