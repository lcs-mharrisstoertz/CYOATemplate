//
//  SettingsView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Stored properties
    @Binding var sliderValue: Double
    
    @State private var currentFont: String = "System"
    
    @State private var currentBackground: String = "none"
    
    @State private var currentSize: Int = 20
    
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
                    
                    HStack{
                        
                        Spacer()
                        
                        VStack{
                            // user can select a font type
                            Text("Select Font")
                                .bold()
                                .underline()
                            
                            
                            Button("Font 1"){
                                book.reader.currentFont = "Superclarendon-Light"
                                currentFont = "Superclarendon-Light"
                            }
                            .font(.custom("Superclarendon-Light", size: 25))
                            .foregroundColor(.primary)
                            
                            
                            Button("Font 2"){
                                book.reader.currentFont = "Chalkduster"
                                currentFont = "Chalkduster"
                            }
                            .font(.custom("Chalkduster", size: 25))
                            .foregroundColor(.primary)
                            
                            
                            Button("Font 3"){
                                book.reader.currentFont = "TimesNewRomanPSMT"
                                currentFont = "TimesNewRomanPSMT"
                            }
                            .font(.custom("TimesNewRomanPSMT", size: 25))
                            .foregroundColor(.primary)
                            
                            Button("Font 4"){
                                book.reader.currentFont = "SnellRoundhand-Bold"
                                currentFont = "SnellRoundhand-Bold"
                            }
                            .font(.custom("SnellRoundhand-Bold", size: 25))
                            .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        VStack{
                            // user can select a font size
                            Text("Select Font Size")
                                .bold()
                                .underline()
                            
                            Spacer()
                            
                            Button("Aa"){
                                book.reader.currentSize = 15
                                currentSize = 15
                            }
                            .font(.custom("System", size: 15))
                            .foregroundColor(.primary)
                            
                            
                            Button("Aa"){
                                book.reader.currentSize = 20
                                currentSize = 20
                            }
                            .font(.custom("System", size: 20))
                            .foregroundColor(.primary)
                            
                            
                            Button("Aa"){
                                book.reader.currentSize = 25
                                currentSize = 25
                            }
                            .font(.custom("System", size: 25))
                            .foregroundColor(.primary)
                            
                            Button("Aa"){
                                book.reader.currentSize = 35
                                currentSize = 35
                            }
                            .font(.custom("System", size: 35))
                            .foregroundColor(.primary)
                            
                            Spacer()
                            
                        }
                        
                        Spacer()
                    }
                    
                    Text("Select Font Colour")
                        .bold()
                        .underline()
                    
                    HStack{
                        Button(" "){
                            book.reader.currentColour = "red"
                        }
                        .padding()
                        .background(Color(.red))
                        .clipShape(Circle())
                        
                        Button(" "){
                            book.reader.currentColour = "orange"
                        }
                        .padding()
                        .background(Color(.orange))
                        .clipShape(Circle())
                        
                        
                        Button(" "){
                            book.reader.currentColour = "yellow"
                        }
                        .padding()
                        .background(Color(.yellow))
                        .clipShape(Circle())
                        
                        
                        Button(" "){
                            book.reader.currentColour = "green"
                        }
                        .padding()
                        .background(Color(.green))
                        .clipShape(Circle())
                        
                        Button(" "){
                            book.reader.currentColour = "blue"
                        }
                        .padding()
                        .background(Color(.blue))
                        .clipShape(Circle())
                        
                        Button(" "){
                            book.reader.currentColour = "purple"                        }
                        .padding()
                        .background(Color(.purple))
                        .clipShape(Circle())
                        
                        
                    }
                    
                   Spacer()
                    
                    Text("Select Background")
                        .bold()
                        .underline()

                    
                    HStack{
                        //wallpaper 1
                        Button(action: {
                            book.reader.currentBackground = "wallpaper1"
                            currentFont = "wallpaper1"
                                }) {
                                    Image("wallpaper1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                                .buttonStyle(PlainButtonStyle())
                    //wallpaper 2
                        Button(action: {
                            book.reader.currentBackground = "wallpaper2"
                            currentFont = "wallpaper2"
                                }) {
                                    Image("wallpaper2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                                .buttonStyle(PlainButtonStyle())
                        
                        
                    //wallpaper 3
                        Button(action: {
                            book.reader.currentBackground = "wallpaper3"
                            currentFont = "wallpaper3"
                                }) {
                                    Image("wallpaper3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                                .buttonStyle(PlainButtonStyle())
                    }
                    
                    
                    //slider
                    Slider(value: $sliderValue, in: 0...1, step: 0.1)
                                    .padding()
                    Text(String(format: "Opacity: %.1f", sliderValue))
                        .bold()
                                  .padding()
                    
                    
                    Spacer()
                    
                    
                }
            }
            
            .padding()
            .navigationTitle("Settings")
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
    SettingsView(sliderValue: .constant(0.5), showing: Binding.constant(true))
}
