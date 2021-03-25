//
//  videoParser.swift
//  ProgrammingTask
//
//  Created by Apple on 5/2/20.
//  Copyright © 2020 uaebarq. All rights reserved.
//

import Foundation
import SwiftyJSON

class homeParser{
    
    
    func parseAttractions(fromResponse jsonResponse: JSON, completion: @escaping([homeModel]) -> ())  {
        
        
        var attractionsArr : [homeModel] = []
        
        for oneattraction in jsonResponse["data"]["attractions"].arrayValue{
            let attractionObj = self.parseOneItem(fromResponse: oneattraction)
            attractionsArr.append(attractionObj)
        }
        
        completion(attractionsArr)
    }
    
    func parseEvents(fromResponse jsonResponse: JSON, completion: @escaping([homeModel]) -> ())  {
        
        
        var eventsArr : [homeModel] = []
        
        for oneevent in jsonResponse["data"]["events"].arrayValue{
            let eventObj = self.parseOneItem(fromResponse: oneevent)
            eventsArr.append(eventObj)
        }
        
        completion(eventsArr)
    }
    

    
    func parseHotspots(fromResponse jsonResponse: JSON, completion: @escaping([homeModel]) -> ())  {
        
        
        var hotspotsArr : [homeModel] = []
        
        for onehotspot in jsonResponse["data"]["hot_spots"].arrayValue{
            let hotspotObj = self.parseOneItem(fromResponse: onehotspot)
            hotspotsArr.append(hotspotObj)
        }
        
        completion(hotspotsArr)
    }
    



    func parseOneItem(fromResponse jsonResponse: JSON) -> homeModel {
        
        let oneItem = homeModel()
        
        if let id = jsonResponse["id"].int {
            oneItem.id = id
        }
     
        if let name = jsonResponse["name"].string {
            oneItem.name = name
        }
        
        if let is_active = jsonResponse["is_active"].int {
            oneItem.is_active = is_active
        }
        
        if let description = jsonResponse["description"].string {
            oneItem.description = description
        }
        
        if let lat = jsonResponse["lat"].double {
            oneItem.lat = lat
        }
        
        if let lng = jsonResponse["lng"].double {
            oneItem.lng = lng
        }
        
        if let arabic_name = jsonResponse["arabic_name"].string {
            oneItem.arabic_name = arabic_name
        }
        
        if let facebook = jsonResponse["facebook"].string {
            oneItem.facebook = facebook
        }

        if let twitter = jsonResponse["twitter"].string {
            oneItem.twitter = twitter
        }

        if let instagram = jsonResponse["instagram"].string {
            oneItem.instagram = instagram
        }
        
        if let profile_photo = jsonResponse["profile_photo"].string {
            oneItem.profile_photo = profile_photo
        }

        return oneItem
    }
}
