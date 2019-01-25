//
//  safariViewController.swift
//  ABCEngineering
//
//  Created by Daniel  on 25/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import UIKit
import WebKit

class safariViewController: UIViewController {

    var href :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSafari()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func loadSafari(){
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(webView)
        let url = URL(string: href!)
        webView.load(URLRequest(url: url!))
    }
  

}
