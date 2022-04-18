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
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.leadingSwipeActionsConfigurationProvider = { [weak self] (indexPath) in
            guard let self = self else { return nil }
            guard let item = self.dataSource.itemIdentifier(for: indexPath) else { return nil }
            return self.leadingSwipeActionConfigurationForListCellItem(item)
        }
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    
    func leadingSwipeActionConfigurationForListCellItem(_ item: Transaction) -> UISwipeActionsConfiguration? {
        print("swipe")
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            [weak self] (_, _, completion) in
            guard let self = self else { return }
            // trigger the action with a reference to the model
            self.deleteItem(item)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    func deleteItem(_ item: Transaction){
        if let firstObjectIndex = presenter.transactions.firstIndex(of: item){
            deleteHandler(index: firstObjectIndex)
        }
    }
    
    private func configureDataSource() {
        
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Transaction> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item.title)"
            if let formattedAmount = self.formatter.string(from: NSNumber(value: item.amount)) {
                content.secondaryText = "$\(formattedAmount)"
            }
            cell.contentConfiguration = content
            
            let disclosure = UICellAccessory.disclosureIndicator()
            //let delete = UICellAccessory.delete(displayed: .whenEditing) {
            //    self.deleteHandler(indexPath: indexPath)
            //}
            cell.accessories = [disclosure]
            
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Transaction>(collectionView: transactionListView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Transaction) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }

    }
    
    func deleteHandler(index: Int){
        print("deleteHandler")
        presenter.delete(at: index)
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
        let transaction = presenter.transactions[indexPath.row]
        print(transaction.description)
    }
}
