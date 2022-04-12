//
//  PrototypeUserInterface.swift
//  ReduxTest01
//
//  Created by Graham Diehl on 4/12/22.
//

import SwiftUI

struct PrototypeUserInterface: View {
    var body: some View {
        NavigationView{
            VStack {
                BalanceView()
                    .frame(height: 70)
                TransactionView()
                    .frame(height: 100)
                TransactionListView()
            }
            .padding()
            .navigationTitle("Transactions")
        }
    }
}

struct PrototypeUserInterface_Previews: PreviewProvider {
    static var previews: some View {
        PrototypeUserInterface()
    }
}
