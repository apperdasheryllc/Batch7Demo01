//
//  ViewController.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    func configureView(){
        self.view.backgroundColor = .systemBackground
        
        let point = CGPoint.zero
        let size = CGSize(width: 100, height: 50)
        let rect = CGRect(origin: point, size: size)
        let textLabel = UILabel(frame: rect)
        textLabel.center = view.center
        textLabel.text = "Hello World"
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .secondarySystemBackground
        view.addSubview(textLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }


}

