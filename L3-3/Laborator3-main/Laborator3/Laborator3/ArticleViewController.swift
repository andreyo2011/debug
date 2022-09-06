//
//  ArticleViewController.swift
//  Laborator3
//
//  Created by user216460 on 9/1/22.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController{
    //@IBOutlet weak var textView: UITextView!
    @IBOutlet weak var webView: WKWebView!
    var item: Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configure(){
        guard let item = item else {
            return
        }

        //textView.text = item.body
        title = item.title //title de navigationViewController
        webView?.loadHTMLString(item.body, baseURL: nil)
        
    }
}
