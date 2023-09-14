//
//  AddRecipeView.swift
//  Recipe-List-App
//
//  Created by Carmen Lucas on 12/9/23.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    @State private var highlights = [String]()
    @State private var directions = [String]()
    var body: some View {
        VStack{
            HStack{
                Button("Clear"){
                    
                }
                Spacer()
                Button("Add"){
                    
                }
            }
            ScrollView(showsIndicators: false){
                VStack{
                    HStack{
                        Text("Name: ")
                            .bold()
                        TextField("Tuna Casserole", text: $name)
                    }
                    HStack{
                        Text("Summary: ")
                            .bold()
                        TextField("A delicious meal for the whole family", text: $summary)
                    }
                    HStack{
                        Text("Prep Time: ")
                            .bold()
                        TextField("1 hour", text: $prepTime)
                    }
                    HStack{
                        Text("Cook Time: ")
                            .bold()
                        TextField("2 hours", text: $cookTime)
                    }
                    HStack{
                        Text("Total Time: ")
                            .bold()
                        TextField("3 hours", text: $totalTime)
                    }
                    HStack{
                        Text("Servings")
                            .bold()
                        TextField("6", text: $servings)
                    }




                }
            }
        }
    }
}

#Preview {
    AddRecipeView()
}
