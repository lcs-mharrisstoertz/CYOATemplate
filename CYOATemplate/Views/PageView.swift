//
//  PageView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-06-01.
//

import SwiftUI

struct PageView: View {

    // MARK: Stored properties
    @Binding var sliderValue: Double
    
    @State private var currentFont: String = "System"
    
    @State private var currentBackground: String = "none"
    
    @State private var currentColour: String = "primary"
    
    @State private var currentSize: Int = 20

    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    // The view model for the page view
    //
    // Making the view model a constant means
    // when the page number changes in the BookStore class
    // (which is fed to the initializer of PageViewModel)
    // then PageView will be re-loaded, updating the text
    let viewModel: PageViewModel
    
    // MARK: Computed properties
    var body: some View {
      
        
        ZStack{
            
            //background
            Image(book.reader.currentBackground ?? "none")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .opacity(sliderValue)
            
        ScrollView {
            
          
                
                VStack(spacing: 10) {
                                              
                    // Has the page loaded yet?
                    if let page = viewModel.page {
                        
                        // DEBUG
                        let _ = print("Text for this page is:\n\n\(page.narrative)\n\n")
                        let _ = print("Image for this page is:\n\n\(page.image ?? "(no image for this page)")\n\n")

                        Text(
                            try! AttributedString(
                                markdown: page.narrative,
                                options: AttributedString.MarkdownParsingOptions(
                                    interpretedSyntax: .inlineOnlyPreservingWhitespace
                                )
                            )
                        )
                            //.font(.title2)
                        .font(.custom(book.reader.currentFont ?? "System", fixedSize: CGFloat(book.reader.currentSize ?? 20)))
                        .foregroundColor(book.reader.color)
                        
                        
                        if let image = page.image {
                            
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .border(.black, width: 1)
                                .padding(.vertical, 10)

                        }

                        Divider()
                        
                        if page.isAnEndingOfTheStory {

                            // Page is an ending, so tell the user,
                            // and allow book to be re-started
                            Text("The End")
                                .bold()
                                .onTapGesture {
                                    book.showCoverPage()
                                }

                        } else {
                            
                            // Page is not an ending, so show available edges
                            EdgesView(
                                viewModel: EdgesViewModel(book: book)
                            )
                            
                        }
                        
                        
                        Spacer()

                    } else {
                        
                        // Page still loading from database
                        ProgressView()
                    }
                    
                }
                .padding()
            }
            
        }

    }
}

#Preview {
    PageView(
        sliderValue: .constant(0.5), viewModel: PageViewModel(book: BookStore())
    )
}
