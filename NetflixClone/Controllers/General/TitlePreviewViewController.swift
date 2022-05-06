//
//  TitlePreviewViewController.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 6.05.2022.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22,weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    
    private let overviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18,weight: .regular)
        label.numberOfLines = 0
        label.text = "Lorem ipsumlaksdjlaskjdasdlkajsdlaskdj"
        return label
    }()
    
    
    private let downloadButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let webView : WKWebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        
        
        configureConstraints()
        
    }
    

    func configureConstraints(){
        let webviewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.topAnchor , constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 20),
        ]
        
        let overviewTitleConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 20),
        ]
        
        let downloadButtonConstraints = [
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.topAnchor , constant: 20),
            downloadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 20),
        ]
        
        NSLayoutConstraint.activate(webviewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overviewTitleConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }

}
