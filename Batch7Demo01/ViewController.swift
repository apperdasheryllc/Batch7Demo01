//
//  ViewController.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/11/22.
//

// A ViewController that demonstrates Redux and VIPER

import UIKit

class ViewController: UIViewController, StoreSubscriber {
    
    var balanceView = UIView()
    var balanceTextLabel = UILabel()
    var balanceValueLabel = UILabel()
    
    var transactionView = UIView()
    var transactionTitleField = UITextField()
    var transactionAmountField = UITextField()
    
    var addButton = UIButton()
    var deleteButton = UIButton()
    var updateButton = UIButton()
    let presenter = Presenter(interactor: Interactor(model: DataModel()))
    
    // Handle the State
    func newState(state: State) {
        guard let appState = state as? AppState else {return}
        let balance = presenter.calculateBalance(transactions: appState.transactions)
        balanceValueLabel.text = "\(balance)"
        transactionTitleField.text = ""
        transactionAmountField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupButtons()
        addBalanceView()
        addTransactionView()
        presenter.store.subscribe(self)
    }
    func setupButtons() {
        addButton.setTitle("Deposit", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .semibold)
        addButton.backgroundColor = .darkGray
        addButton.layer.cornerRadius = 5.0
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
        deleteButton.setTitle("Withdrawal", for: .normal)
        deleteButton.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .semibold)
        deleteButton.backgroundColor = .red
        deleteButton.layer.cornerRadius = 5.0
        deleteButton.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)

        updateButton.setTitle("UPDATE", for: .normal)
        updateButton.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .semibold)
        updateButton.backgroundColor = .blue
        updateButton.layer.cornerRadius = 5.0
        updateButton.addTarget(self, action: #selector(updateButtonClicked), for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        transactionView.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: transactionView.leadingAnchor, constant: 40.0),
            addButton.bottomAnchor.constraint(equalTo: transactionView.bottomAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        /*
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        transactionView.addSubview(updateButton)
        NSLayoutConstraint.activate([
            updateButton.centerXAnchor.constraint(equalTo: transactionView.centerXAnchor),
            updateButton.bottomAnchor.constraint(equalTo: transactionView.bottomAnchor),
            updateButton.heightAnchor.constraint(equalToConstant: 30),
            updateButton.widthAnchor.constraint(equalToConstant: 75)
        ])
        */
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        transactionView.addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: transactionView.trailingAnchor, constant: -40.0),
            deleteButton.bottomAnchor.constraint(equalTo: transactionView.bottomAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    @objc func addButtonClicked() {
        
        // throw an error here?
        guard let transactionTitle = transactionTitleField.text, let transactionAmount = transactionAmountField.text else {
            return
        }
        
        guard let amountValue = Int(transactionAmount) else {
            return
        }
        presenter.add(with: transactionTitle, amount: amountValue, type: .deposit)
        print("\(presenter.balance) --- \(presenter.transactions.count)" )
    }
    
    // not deleting, inserting withdrawals, swipe on item list to delete
    @objc func deleteButtonClicked() {
        // hardcoded for time-being
        
        // throw an error here?
        guard let transactionTitle = transactionTitleField.text, let transactionAmount = transactionAmountField.text else {
            return
        }
        
        guard let amountValue = Int(transactionAmount) else {
            return
        }
        presenter.add(with: transactionTitle, amount: amountValue, type: .withdrawl)
        
        print("\(presenter.balance) --- \(presenter.transactions.count)" )
    }
    
    @objc func updateButtonClicked() {
        // hardcoded for time-being
        presenter.update(at: 0, title: "new title", amount: 10)
        print("\(presenter.balance) --- \(presenter.transactions.count)" )
    }
}

