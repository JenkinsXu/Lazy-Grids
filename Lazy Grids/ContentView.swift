//
//  ContentView.swift
//  Lazy Grids
//
//  Created by Yongqi Xu on 2021-09-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            let adaptiveColumns: [GridItem] = [.init(.adaptive(minimum: 200, maximum: 400), spacing: 8, alignment: .center)]
            GridView(columns: adaptiveColumns)
                .tabItem {
                    Text("Adaptive")
                    Image(systemName: "square.grid.3x3.bottomright.fill")
                }
            
            let fixedColumns: [GridItem] = Array(repeating: .init(.fixed(200), spacing: 8, alignment: .center), count: 3)
            GridView(columns: fixedColumns)
                .tabItem {
                    Text("Fixed")
                    Image(systemName: "square.grid.3x2")
                }
            
            let flexibleColumns: [GridItem] = Array(repeating: .init(.flexible(minimum: 200, maximum: 400), spacing: 8, alignment: .center), count: 3)
            GridView(columns: flexibleColumns)
                .tabItem {
                    Text("Flexible")
                    Image(systemName: "square.grid.3x3.fill.square")
                }
        }
    }
}

struct GridView: View {
    let columns: [GridItem]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 30) { // checkout others
                ForEach(0..<99) { i in
                    color(fraction: Double(i) / 100)
                        .frame(height: 200)
                }
            }
        }
    }
    
    func color(fraction: Double) -> Color {
        Color(red: fraction, green: 1 - fraction, blue: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
