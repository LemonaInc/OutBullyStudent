//
//  TeacherViewController.swift
//  OutBullyStudent
//
//  Created by Jaxon Stevens on 9/7/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import Foundation
import WebKit

class TeacherViewController: UIViewController, UIWebViewDelegate   {

    @IBOutlet weak var teacherWebView: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TIMER
        let teacherTimer = Timer.scheduledTimer(
            timeInterval: 2.0, target: self, selector: #selector(TeacherViewController.viewDidAppear(_:)),
            userInfo: nil, repeats: true)
        // TIMER
        
        // Set the webview delgate to self
        teacherWebView.delegate = self
        
        
        self.teacherWebView.scalesPageToFit = false
        self.teacherWebView.isMultipleTouchEnabled = false
        
        
        let urlPath:String = "https://app.outbully.com/admin"
        let theURL = URLRequest(url:URL(string: urlPath)!)
        
        
        self.teacherWebView.loadRequest(theURL)
        
    }
    
    // Webview did load
    func webViewDidFinishLoad(webView: UIWebView) {
      //  print("webview did finish load!")
        
       /* let alert = UIAlertController(title: "Alert", message: "Web View Did Finish Load", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil) */
    }
    
    
    // Webview did fail to load with error
    func webView(webView: UIWebView, didFailLoadWithError error: Error) {
       // print("webview did fail load with error: \(error)")
       // print ("Failed")
    }
    
    // VIEW DID APPEAR METHOD -- USE THIS FOR SHOWING ALERT VIEWS
    override func viewDidAppear(_ animated: Bool) {
        
        
        // If the network connection is true the do
        if NetworkReachability.isConnectedToNetwork() == true
        {
            
            /* print("Network Reached")
             
             let alert = UIAlertController(title: "You are connected to a network", message:"Thanks", preferredStyle: UIAlertControllerStyle.alert); alert.addAction(UIAlertAction(title:"Okay",style:UIAlertActionStyle.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
             */
            
        }
            
            // If the network conenction cannot be reached or fails then do
        else
        {
            
            let alert = UIAlertController(title: "Network Error", message:"Unfortunatly you dont have a connection at this time", preferredStyle: UIAlertControllerStyle.alert); alert.addAction(UIAlertAction(title:"Retry",style:UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            //   }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
