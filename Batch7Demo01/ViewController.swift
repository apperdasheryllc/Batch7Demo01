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
    
    let presenter = Presenter()
    
    // Send the Action
    @objc func handleTap(gesture: UITapGestureRecognizer){
        presenter.handleTap()
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    // Handle the State
    func newState(state: State) {
        guard let appState = state as? AppState else {return}
        let balance = presenter.calculateBalance(transactions: appState.transactions)
        balanceValueLabel.text = "\(balance)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        addBalanceView()
        
        addTapGesture()
        
        presenter.store.subscribe(self)
    }
    

}

