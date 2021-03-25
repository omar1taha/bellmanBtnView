//
//  VideosModel.swift
//  ProgrammingTask
//
//  Created by Apple on 5/2/20.
//  Copyright © 2020 uaebarq. All rights reserved.
//

import Foundation

class homeModel{
    
    var id: Int?
    var name: String?
    var is_active: Int?
    var description: String?
    var lat: Double?
    var lng: Double?
    var arabic_name: String?
    var arabic_description: String?
    var facebook : String?
    var twitter : String?
    var instagram : String?
    var profile_photo : String?
    var categories : [category]?

}


class category{
    
    var id: Int?
    var name: String?
    var order: String?
    var ar_name: String?

}


