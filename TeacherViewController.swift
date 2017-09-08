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
    

    
}
