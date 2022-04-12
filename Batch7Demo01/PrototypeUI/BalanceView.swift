//
//  BalanceView.swift
//  ReduxTest01
//
//  Created by Graham Diehl on 4/12/22.
//

import SwiftUI

struct BalanceView: View {
    var body: some View {
        HStack {
            Text("Balance")
            Spacer()
            Text("$100.00")
        }
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
