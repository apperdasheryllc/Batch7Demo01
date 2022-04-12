//
//  TransactionListView.swift
//  ReduxTest01
//
//  Created by Graham Diehl on 4/12/22.
//

import SwiftUI

struct TransactionListView: View {
    var body: some View {
        List{
            ForEach(0...25, id: \.self){ value in
                TransactionListCell()
            }
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
