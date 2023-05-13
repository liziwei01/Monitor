//
//  ContentView.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var items: [Item] = []
    @State var count: Int = 0
    
    @State var pageIdx: Int = 1
    
    private static let initialColumns = 3

    @State private var isEditing = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private var numColumns = initialColumns
    @State var isNavPush = false
    
    private var columnsTitle: String {
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                ColumnStepper(title: columnsTitle, range: 1...8, columns: $gridColumns)
                .padding()
            }
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach($items) { $item in
                        NavigationLink(destination: DetailView(item: $item)) {
                            Rectangle()
                                .overlay {
                                    GridItemView(item: item)
                                }
                        }
                        .cornerRadius(8.0)
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding()
                
                // Enable horizontal scrolling for page navigation buttons
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.fixed(50))]) {
                        ForEach(0..<count, id: \.self) { index in
                            Button(action: {
                                (items, count) = GetItemList(pageIdx: index + 1)
                                pageIdx = index + 1
                            }) {
                                Text("\(index + 1)")
                                    .foregroundColor(pageIdx == index + 1 ? .white : .blue)
                                    .padding(.horizontal, 10)
                                    .background(pageIdx == index + 1 ? Color.blue : Color.white)
                                    .cornerRadius(8.0)
                            }
                        }
                        // Add a text field to input the page index
                        VStack {
                            Spacer()
                            TextField("Page Index", value: $pageIdx, formatter: NumberFormatter(), onCommit: {
                                // Fetch the items for the new page index
                                (items, count) = GetItemList(pageIdx: pageIdx)
                            })
                                .frame(width: 60, height: 30)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Spacer()
                        }
                    }
                    .padding(.horizontal) // Add some padding to the sides
                }
            }
        }
        .navigationBarTitle("监控")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "完成" : "编辑") {
                    withAnimation { isEditing.toggle() }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("设置") { SettingsView() }
            }
        }
        .refreshable {
            (items, count) = GetItemList(pageIdx: 1)
        }
    }
}



