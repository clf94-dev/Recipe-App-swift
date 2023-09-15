//
//  AddListData.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 14/9/23.
//

import SwiftUI

struct AddListData: View {
    @Binding var list: [String]
    
    @State private var item: String = ""
    
    var title: String
    var placeholderText: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(title): ")
                    .bold()
                TextField(placeholderText, text: $item)
                Button("Add") {
                    if item.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                        list.append(item.trimmingCharacters(in: .whitespacesAndNewlines))
                        item = ""
                    }
                    
                }
            }
            ForEach(list, id: \.self){ listItem in
                Text(listItem)
            }
        }
    }
}

