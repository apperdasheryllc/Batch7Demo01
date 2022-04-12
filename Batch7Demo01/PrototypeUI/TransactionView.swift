//
//  TransactionView.swift
//  ReduxTest01
//
//  Created by Graham Diehl on 4/12/22.
//

import SwiftUI

struct TransactionView: View {
    
    @SwiftUI.State private var withdrawalText = ""
    @SwiftUI.State private var depositText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add Transaction")
            
            HStack{
                TextField("Withdrawal", text: $withdrawalText)
                Spacer()
                TextField("Deposit", text: $depositText)
            }
            
            Button(action: doSomething){
                Label("Submit", systemImage: "plus")
            }
        }
    }
    
    func doSomething(){}
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
