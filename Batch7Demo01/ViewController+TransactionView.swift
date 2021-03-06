//
//  ViewController+Transaction.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/14/22.
//

import Foundation

import UIKit

extension ViewController {
    
    
    func addTransactionAmountField(){
        
        transactionView.addSubview(transactionAmountField)
        
        transactionAmountField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transactionAmountField.leadingAnchor.constraint(equalTo: transactionView.leadingAnchor),
            transactionAmountField.trailingAnchor.constraint(equalTo: transactionView.trailingAnchor),
            transactionAmountField.topAnchor.constraint(equalTo: transactionTitleField.bottomAnchor),
            transactionAmountField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        transactionAmountField.placeholder = "Amount"
        transactionAmountField.delegate = self
        transactionAmountField.keyboardType = .decimalPad
    }
    
    func addTransactionTitleField(){
        
        transactionView.addSubview(transactionTitleField)
        
        transactionTitleField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transactionTitleField.leadingAnchor.constraint(equalTo: transactionView.leadingAnchor),
            transactionTitleField.trailingAnchor.constraint(equalTo: transactionView.trailingAnchor),
            transactionTitleField.topAnchor.constraint(equalTo: transactionView.topAnchor),
            transactionTitleField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        transactionTitleField.placeholder = "Transaction Name"
        transactionTitleField.delegate = self
        
    }
    
    func addTransactionView(){
        
        view.addSubview(transactionView)
        
        transactionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transactionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            transactionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            transactionView.topAnchor.constraint(equalTo: balanceView.bottomAnchor),
            transactionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        addTransactionTitleField()
        addTransactionAmountField()
    }
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
