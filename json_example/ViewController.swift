//
//  ViewController.swift
//  json_example
//
//  Created by Jason Shultz on 11/9/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.telize.com/geoip")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if let urlContent = data {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    let country = jsonResult["country"]! as! NSString
                    print(country)
                } catch {
                    print("JSON serialization failed")
                }
            }
        }
        task.resume()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

