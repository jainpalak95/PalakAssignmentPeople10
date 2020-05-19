//
//  WebViewViewController.swift
//  AssignmentPeople
//
//  Created by Palak jain on 19/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
  
  //MARK: IBOutlets
  let webview = WKWebView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setWebview()
    
  }
  
  func setWebview(){
    webview.translatesAutoresizingMaskIntoConstraints = false
    if let url = URL(string: "https://www.bottlerocketstudios.com"){
      webview.load(URLRequest(url: url))
      self.view.addSubview(webview)
      NSLayoutConstraint.activate([
        self.webview.leftAnchor.constraint(equalTo: self.view.leftAnchor),
        self.webview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        self.webview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        self.webview.topAnchor.constraint(equalTo: self.view.topAnchor),
      ])
    }
    let undoBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(goBackward))
    let redoBarButtonItem = UIBarButtonItem(image: UIImage(named: "next"), style: .plain, target: self, action: #selector(goForward))
    let rotateBarButtonItem = UIBarButtonItem(image: UIImage(named: "rotate"), style: .plain, target: self, action: #selector(reloadWebview))
    self.navigationItem.setLeftBarButtonItems([undoBarButtonItem,rotateBarButtonItem,redoBarButtonItem], animated: true)
    
  }
  @objc func goForward(){
    if webview.canGoForward{
      
      
    }
    
  }
  @objc func goBackward(){
    if webview.canGoBack{
      
      
    }
    
    
  }
  @objc func reloadWebview(){
    webview.reload()
  }
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    self.view.layoutIfNeeded()
    webview.reload()
    
  }
  
  
  
  
}
