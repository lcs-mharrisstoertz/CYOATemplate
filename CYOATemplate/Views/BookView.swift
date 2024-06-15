//
//  GameView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import Supabase
import SwiftUI

struct BookView: View {
    
    // MARK: Stored properties
    
    // Tracks overall state as the reader reads the book
    @State private var book = BookStore()
    
    // Whether the statistics view is being shown right now
    @State private var showingStatsView = false
    
    // Whether the settings view is being shown right now
    @State private var showingSettingsView = false
    
    //Auto Font
    @State private var currentFont: String = "System"
    
    //Auto Font
    @State private var currentColour: String = "primary"
    
    //Auto Size
    @State private var currentSize: Int = 20
    
    //Image opacity
    @State private var sliderValue: Double = 0.5
    
    
    // Track when app is foregrounded, backgrounded, or made inactive
    @Environment(\.scenePhase) var scenePhase
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            VStack {
                
                if book.isBeingRead {
                    
                    HStack {
                        Text("\(book.currentPageId!)")
                            .font(.custom(book.reader.currentFont ?? "System", fixedSize: CGFloat(book.reader.currentSize ?? 20)))
                            .foregroundColor(book.reader.color)
                        Spacer()
                    }
                    .padding()
                    
                    PageView(
                        sliderValue: $sliderValue, viewModel: PageViewModel(book: book)
                    )
                    
                } else {
                    CoverView()
                }
                
            }
            // Add our object to track state into the environment
            // so it is accessible to the other views in the app
            .environment(book)
            // Toolbar to show buttons for various actions
            .toolbar {
                
                // Show the statistics view
                ToolbarItem(placement: .automatic) {
                    Button {
                        showingStatsView = true
                    } label: {
                        Image(systemName: "chart.pie.fill")
                    }
                    
                }
                
                // Show the settings view
                ToolbarItem(placement: .automatic) {
                    Button {
                        showingSettingsView = true
                    } label: {
                        Image(systemName: "gear")
                    }
                    
                }
                
            }
            // Show the statistics view
            .sheet(isPresented: $showingStatsView) {
                StatsView(showing: $showingStatsView)
            }
            // Show the settings view
            .sheet(isPresented: $showingSettingsView) {
                SettingsView(sliderValue: $sliderValue, showing: $showingSettingsView)
                    .environment(book)
                    .presentationDetents([.fraction(0.7)])
            }
            // Respond when app is backgrounded, foregrounded, or made inactive
            .onChange(of: scenePhase) {
                if scenePhase == .inactive {
                    print("Active")
                    Task {
                        try await book.saveState()
                        print("Reader's state for this book has been restored.")
                    }
                } else if scenePhase == .active {
                    print("Active")
                    Task {
                        try await book.restoreState()
                        print("Reader's state for this book has been restored.")
                    }
                } else if scenePhase == .background {
                    print("Background")
                }
            }
            
        }
        // Dark / light mode toggle
        .preferredColorScheme(book.reader.prefersDarkMode ? .dark : .light)
        
    }
}

#Preview {
    BookView()
}
