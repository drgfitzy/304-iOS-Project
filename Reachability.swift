//
//  Reachability.swift
//  304#
//
//  Created by Greg Fitzgibbon on 10/12/2015.
//  Copyright © 2015 Greg Fitzgibbon. All rights reserved.
//

import Foundation
import SystemConfiguration

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var status: Bool = false
        
        let url = NSURL(string: "https://google.com")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "HEAD"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response:URLResponse?
        
        do {
            let _ = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response) as NSData?
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                status = true
                
            }
        }
        return status
        
       



}
            
       /*
        var status:Bool = false
        

        
        let url = NSURL(string: "https://google.com")
        let request = NSMutableURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "HEAD"
        
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        
        //var params = ["username":"username", "password":"password"] as Dictionary<String, String>
        
        //var errors: NSError?
        //request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
      
        
        
        
        
        let _ = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")})
        
            
        
        let response = NSURLResponse()
        let error = NSError?()
        let httpResponse =  NSHTTPURLResponse(response)

        
             if error != nil {
                
            print(error?.localizedDescription)
            
            }
        
        else if httpResponse.statusCode == 200 {
                
                print("connection found")
               status = true
                
            }
        
        
        return status
        
            
        
        
            
}
        
      



}

        
   */
        

        /*
        let url = NSURL(string: "https://google.com")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response:NSURLResponse?
        
        do {
            let _ = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response) as NSData?
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
        if let httpResponse = response as? NSHTTPURLResponse {
            if httpResponse.statusCode == 200 {
                status = true

            }
        }
        return status
    }

*/



}
