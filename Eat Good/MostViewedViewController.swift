//
//  MostViewedViewController.swift
//  Eat Good
//
//  Created by Malik Arachiche on 7/18/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class MostViewedViewController: UIViewController {
    
    
    @IBOutlet weak var yelpWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://www.yelp.com/")
        
        let request = URLRequest(url: url!)
        
    yelpWebView.load(request)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
