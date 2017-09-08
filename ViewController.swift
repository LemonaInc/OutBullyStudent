//
//  ViewController.swift
//  Roxa
//
//  Created by Jaxon Stevens on 9/7/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate   {
    
    // Student Web view for reports
    @IBOutlet weak var studentWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the webview delgate to self
        studentWebView.delegate = self
        
        
        self.studentWebView.scalesPageToFit = false
        self.studentWebView.isMultipleTouchEnabled = false
        
        
        let urlPath:String = "https://app.outbully.com/student"
        let theURL = URLRequest(url:URL(string: urlPath)!)
        
        
        self.studentWebView.loadRequest(theURL)
        
    }
    
    // Webview did load
    func webViewDidFinishLoad(webView: UIWebView) {
        print("webview did finish load!")
    }
    
    
    // Webview did fail to load with error
    func webView(webView: UIWebView, didFailLoadWithError error: Error) {
        print("webview did fail load with error: \(error)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Did fail to load webview function
    
    /* func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
     let myAlert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
     self.present(myAlert, animated: true, completion: nil)
     } */

    
}
