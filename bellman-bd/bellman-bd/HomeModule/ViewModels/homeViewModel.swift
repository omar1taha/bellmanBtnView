//
//  videosViewModel.swift
//  ProgrammingTask
//
//  Created by Apple on 5/2/20.
//  Copyright © 2020 uaebarq. All rights reserved.
//

import UIKit
import SwiftyJSON

class homeViewModel: NSObject {

    @IBOutlet var homeDataClient : homeDataClient!
    
    var hotspotsArr : [homeModel] = []
    var attractionsArr : [homeModel] = []
    var eventsArr : [homeModel] = []

    func getDataFromApi(onSuccess: @escaping (Bool)->(), onFailure: @escaping (String?)->()) {
        

        self.homeDataClient.getHomeDataFromApi(onSuccess: { (responseSuccess) in
                if responseSuccess != JSON.null{
                    
                    homeParser().parseAttractions(fromResponse: responseSuccess, completion: { (attraction_Arr) in
                        self.attractionsArr = attraction_Arr
                    })
                    
                    homeParser().parseEvents(fromResponse: responseSuccess, completion: { (events_Arr) in
                        self.eventsArr = events_Arr
                    })
                    
                    
                    homeParser().parseHotspots(fromResponse: responseSuccess, completion: { (hotspot_Arr) in
                        self.hotspotsArr = hotspot_Arr
                    })
                    
                    

                    onSuccess(true)
                }else{
                    onSuccess(false)
                }

            
        }) { (responseFailure) in
            //onFailure error message from server
            let error = "We encountered error. Try again later"
            onFailure(error)
        }
        
    }
    
}
