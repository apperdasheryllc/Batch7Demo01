//
//  ViewController+BalanceView.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/13/22.
//

import Foundation
import UIKit

extension ViewController {
    
    func addBalanceTextLabel(){
        
        balanceTextLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceView.addSubview(balanceTextLabel)
        
        NSLayoutConstraint.activate([
            balanceTextLabel.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            balanceTextLabel.widthAnchor.constraint(equalToConstant: 100),
            balanceTextLabel.topAnchor.constraint(equalTo: balanceView.topAnchor),
            balanceTextLabel.bottomAnchor.constraint(equalTo: balanceView.bottomAnchor)
        ])
        
        balanceTextLabel.font = .preferredFont(forTextStyle: .title1, compatibleWith: .current)
        balanceTextLabel.text = "Balance"
        
    }
    
    func addBalanceValueLabel(){
        
        balanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceView.addSubview(balanceValueLabel)
        
        NSLayoutConstraint.activate([
            balanceValueLabel.leadingAnchor.constraint(equalTo: balanceTextLabel.trailingAnchor),
            balanceValueLabel.trailingAnchor.constraint(equalTo: balanceView.trailingAnchor),
            balanceValueLabel.topAnchor.constraint(equalTo: balanceView.topAnchor),
            balanceValueLabel.bottomAnchor.constraint(equalTo: balanceView.bottomAnchor)
        ])
        
        balanceValueLabel.font = .preferredFont(forTextStyle: .title1, compatibleWith: .current)
        balanceValueLabel.text = "0"
        balanceValueLabel.textAlignment = .right
    }
    
    func addBalanceView(){
        view.addSubview(balanceView)
        
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            balanceView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            balanceView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            balanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            balanceView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addBalanceTextLabel()
        addBalanceValueLabel()
    }
    
}
