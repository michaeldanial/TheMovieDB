//
//  GenresDTO.swift
//  Web Service Mapper
//
//  Created by Michael.Magdy on 11/20/18.
//  Copyright © 2018 Michael.Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class GenresDTO: Mappable{
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
    
    var name: String?
}
