//
//  SettingsView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    // MARK: Computed properties
    var body: some View {
        
        // Make the connection to the book state a two-way binding
        // (By default when accessing through environment it is read-only)
        @Bindable var book = book
        
        // The user interface
        return NavigationStack {
            ScrollView{
                VStack {
                    Toggle(isOn: $book.reader.prefersDarkMode) {
                        Label {
                            Text("Dark Mode")
                        } icon: {
                            Image(systemName: "moonphase.first.quarter")
                        }
                    }
                    
                    .padding()
                    
                    
                // user can select a font type
                    Text("Select Font")
                        .bold()
                        .underline()
                    
                        .padding()
                    
                    Text("Font 1")
                        .font(.custom("Superclarendon-Light", size: 30))
                    
                    Text("Font 2")
                        .font(.custom("Chalkduster", size: 30))
                    
                    Text("Font 3")
                        .font(.custom("TimesNewRomanPSMT", size: 30))
                  
                    Text("Font 4")
                        .font(.custom("SnellRoundhand-Bold", size: 30))
                    
                    Spacer()
                    
                   
                }
            }
            
            .padding()
            .navigationTitle("Statistics")
            // Toolbar to show buttons for various actions
            .toolbar {
                
                // Hide this view
                ToolbarItem(placement: .automatic) {
                    Button {
                        showing = false
                    } label: {
                        Text("Done")
                            .bold()
                    }

                }
            }

        }
        // Dark / light mode toggle
        .preferredColorScheme(book.reader.prefersDarkMode ? .dark : .light)

    }
}

#Preview {
    SettingsView(showing: Binding.constant(true))
}
