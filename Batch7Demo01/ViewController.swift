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
    var addButton = UIButton()
    var deleteButton = UIButton()
    var updateButton = UIButton()
    let presenter = Presenter(interactor: Interactor(model: DataModel()))
    
    // Handle the State
    func newState(state: State) {
        guard let appState = state as? AppState else {return}
        let balance = presenter.calculateBalance(transactions: appState.transactions)
        balanceValueLabel.text = "\(balance)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupButtons()
        addBalanceView()
        
        presenter.store.subscribe(self)
    }
    func setupButtons() {
        addButton.setTitle("ADD", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .semibold)
        addButton.backgroundColor = .darkGray
        addButton.layer.cornerRadius = 5.0
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
        deleteButton.setTitle("DELETE", for: .normal)
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
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.0),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(updateButton)
        NSLayoutConstraint.activate([
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            updateButton.heightAnchor.constraint(equalToConstant: 30),
            updateButton.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.0),
            deleteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    @objc func addButtonClicked() {
        // hardcoded for time-being
        presenter.add(with: "default", amount: 10)
        print("\(presenter.balance) --- \(presenter.transactions.count)" )
    }
    @objc func deleteButtonClicked() {
        // hardcoded for time-being
        presenter.delete(at: 0)
        print("\(presenter.balance) --- \(presenter.transactions.count)" )
    }
    @objc func updateButtonClicked() {
        // hardcoded for time-being
        presenter.update(at: 0, title: "new title", amount: 10)
        print("\(presenter.balance) --- \(presenter.transactions.count)" )
    }
}

