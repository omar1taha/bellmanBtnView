//
//  parentClient.swift
//  ProgrammingTask
//
//  Created by Apple on 5/2/20.
//  Copyright © 2020 uaebarq. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class parentClient: NSObject {

    
    let headers: HTTPHeaders?
    let urlHeaders : HTTPHeaders?
    
    
    override init() {
        
        self.headers = [:]
        
        self.urlHeaders = [:]
    }
    
    func communicateWithApi(url: String?, pagingUrl:String?, method: HTTPMethod, parameters: [String:String]?, onSuccess: @escaping (JSON) -> Void, onFailure: @escaping (JSON) -> Void) {
        
        
        var apiURL: URL?
        if url != nil {
            apiURL = URL(string: url!)
        }else{
            apiURL = URL(string: pagingUrl!)
        }
        
        //print(self.headers as Any)
        //print(parameters as Any)
        Alamofire.request(apiURL!, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers).responseJSON { (response) in
            
            
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            
            if response.response?.statusCode == 200 {
                
                do{
                    let responseJson = try JSON(data: response.data!)
                    //print(responseJson)
                    onSuccess(responseJson)
                }catch _{
                    //print(error)
                    onSuccess(JSON.null)
                }
                
            }else if response.response?.statusCode == 400{
                //status code is 400
                
            }else{
                //status code not 200 or 400
            }
        }
        
        
    }
    
}
