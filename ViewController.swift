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
    
   var networkint = 1

    
    // VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        let timer = Timer.scheduledTimer(
            timeInterval: 2.0, target: self, selector: #selector(ViewController.viewDidAppear(_:)),
            userInfo: nil, repeats: true)
        
        // Set the webview delgate to self
        studentWebView.delegate = self
        
        self.studentWebView.scalesPageToFit = false
        self.studentWebView.isMultipleTouchEnabled = false
        
        let urlPath:String = "https://app.outbully.com/student"
        let theURL = URLRequest(url:URL(string: urlPath)!)
        
        self.studentWebView.loadRequest(theURL)
        
    }
    
    
    // VIEW DID APPEAR METHOD -- USE THIS FOR SHOWING ALERT VIEWS
    override func viewDidAppear(_ animated: Bool) {
        
    
        // If the network connection is true the do
        if NetworkReachability.isConnectedToNetwork() == true
        {
            networkint = 1

            print("Network Reached")
            
            let alert = UIAlertController(title: "You are connected to a network", message:"Thanks", preferredStyle: UIAlertControllerStyle.alert); alert.addAction(UIAlertAction(title:"Okay",style:UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
            
            // If the network conenction cannot be reached or fails then do
        else
        {
           // networkint = 0

          //  while networkint == 0 {
            
           // print("Network Error")
            
            let alert = UIAlertController(title: "Network Error", message:"Unfortunatly you dont have a connection at this time", preferredStyle: UIAlertControllerStyle.alert); alert.addAction(UIAlertAction(title:"Okay I Understand",style:UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
         //   }
        }

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

