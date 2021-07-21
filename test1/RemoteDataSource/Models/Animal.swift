//
//  Animal.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit

class Animal: NSObject, Codable {
    
    var name: String
    var age: Int
    var imageUrl: String
    
    init(name: String, age: Int, imageUrl: String) {
        self.name = name
        self.age = age
        self.imageUrl = imageUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case imageUrl = "image_url"
    }
}
