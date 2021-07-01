//
//  ViewController.swift
//  appboundsbug
//
//  Created by Julio Cesar Sanchez on 01/07/2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    var webView: WKWebView!
    var contentController = WKUserContentController()
    override func viewDidLoad() {
    super.viewDidLoad()
        let request = URLRequest(url: URL(string: "app://localhost/index.html")!)
        _ = webView?.load(request)
    }
    override func loadView() {
        let webViewConfiguration = WKWebViewConfiguration()
        webViewConfiguration.setURLSchemeHandler(WebViewHander(), forURLScheme: "app")
        let data = "document.body.style.background = 'red';"
        let userScript = WKUserScript(source: data, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(userScript)
        webViewConfiguration.userContentController = contentController
        webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
}

