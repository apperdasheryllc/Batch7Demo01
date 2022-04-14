//
//  ViewController+TransactionList.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/14/22.
//

import Foundation
import UIKit

extension ViewController {
    
    func configureTransactionList(){
        
        addTransactionListView()
        configureDataSource()
    }

    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    private func configureDataSource() {
        
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Transaction> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item.title)"
            if let formattedAmount = self.formatter.string(from: NSNumber(value: item.amount)) {
                content.secondaryText = "$\(formattedAmount)"
            }
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Transaction>(collectionView: transactionListView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Transaction) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }

    }
    
    
    func performQuery(transactions: [Transaction]){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Transaction>()
        snapshot.appendSections([.main])
        snapshot.appendItems(transactions)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func addTransactionListView(){
        
        transactionListView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        
        view.addSubview(transactionListView)
        
        transactionListView.delegate = self
        
        transactionListView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transactionListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            transactionListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            transactionListView.topAnchor.constraint(equalTo: transactionView.bottomAnchor),
            transactionListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt")
    }
}
