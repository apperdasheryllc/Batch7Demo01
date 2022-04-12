//
//  TransactionListCell.swift
//  ReduxTest01
//
//  Created by Graham Diehl on 4/12/22.
//

import SwiftUI

struct TransactionListCell: View {
    
    var body: some View {
        HStack{
            Text("4/12")
            Spacer()
            Text("Withdrawal to XYZ")
            Spacer()
            Text("-100.00")
        }
    }
}

struct TransactionListCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListCell()
    }
}
