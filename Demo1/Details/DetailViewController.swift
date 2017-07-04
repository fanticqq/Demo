//
//  DetailViewController.swift
//  Demo1
//
//  Created by Igor Zarubin on 04/07/2017.
//  Copyright © 2017 BTC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var didSetupConstraints = false
    
    private lazy var layer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.black.cgColor
        return layer
    }()
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.imageview.layer.addSublayer(layer)
        self.view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layer.frame = CGRect(x: 0, y: self.imageview.bounds.height + 1, width: self.imageview.bounds.width, height: 1)
    }
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            self.nameLabel.bottomAnchor.constraint(equalTo: self.imageview.centerYAnchor, constant: -1).isActive = true
            self.nameLabel.leftAnchor.constraint(equalTo: self.imageview.rightAnchor, constant: 16).isActive = true
            self.nameLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 16).isActive = true
            
            self.detailsLabel.topAnchor.constraint(equalTo: self.imageview.centerYAnchor, constant: 1).isActive = true
            self.detailsLabel.leftAnchor.constraint(equalTo: self.imageview.rightAnchor, constant: 16).isActive = true
            self.detailsLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 16).isActive = true
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
}
