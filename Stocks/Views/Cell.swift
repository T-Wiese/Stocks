//
//  Cell.swift
//  Stocks
//
//  Created by Torin Wiese (Work) on 4/14/23.
//

import SwiftUI

struct Cell: View {
    let value: String
    let header: Bool
    
    var body: some View {
        VStack() {
            Text(value).bold(header)
        }.frame(maxWidth: .infinity)

    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(value: "CELL", header: false)
    }
}
