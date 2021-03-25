//
//  getVideosClient.swift
//  ProgrammingTask
//
//  Created by Apple on 5/2/20.
//  Copyright © 2020 uaebarq. All rights reserved.
//

import Foundation
import SwiftyJSON

class homeDataClient: parentClient{
    
    func getHomeDataFromApi(onSuccess: @escaping (JSON) -> (), onFailure: @escaping (JSON) -> ()){
        //videosURL
        self.communicateWithApi(url: getHomeURL, pagingUrl: nil, method: .get, parameters: nil, onSuccess: onSuccess, onFailure: onFailure)
    }
    
}
