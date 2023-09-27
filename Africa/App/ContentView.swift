//
//  ContentView.swift
//  Africa
//
//  Created by Bartu Kara on 25.09.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive : Bool = false
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        
    // MARK: - Body
        NavigationView {
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }//:NavLink
                        }//: Loop
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//: NavLink
                            }//:Loop
                        }//: Lazygrid
                        .padding(10)
                        .animation(.easeIn)
                    }//: Scroll
                }//: Condition
            }//: Group
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16){
                        //List
                        Button(action: {
                            print("List view is actived")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //Grid
                        Button(action: {
                            print("Grid view is Actived")
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//:Htsack
                }//: Buttons
            }//: Toolbar
        }//: NavigationView
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
