//
//  WebVc.swift
//  ImoiveApp
//
//  Created by Elattar on 7/23/19.
//

import UIKit
import WebKit

class WebVc: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        webView.load(URLRequest(url: url!))
        
    }
    

    @IBAction func done_btn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
