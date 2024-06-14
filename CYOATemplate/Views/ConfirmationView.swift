//
//import SwiftUI
//import Combine
//
//struct ConfirmationView: View {
//    
//
//    
//
//    @Environment(BookStore.self) var book
//    @StateObject private var bookStore = BookStore()
//
//    @Binding var showing: Bool
//
//    var body: some View {
//        VStack {
//                   Text("are you sure you want to continue to the cover you will be unable to get back to this page")
//                        .multilineTextAlignment(.center)
//                        .interactiveDismissDisabled()
//                        
//                
//                Text("yes im sure")
//                    .onTapGesture {
//                        book.showCoverPage()
//
//                    }
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(20)
//            
//            }
//        }
//        
//            }
//        
//    
//
//
//
