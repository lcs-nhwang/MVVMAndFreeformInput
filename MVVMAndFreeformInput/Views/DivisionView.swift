//
//  DivisionView.swift
//  MVVMAndFreeformInput
//
//  Created by Nicholas Hwang on 25/2/2025.
//


import SwiftUI
 
struct DivisionView: View {
    
    // MARK: Stored properties
    
    // Holds the view model, to track current state of
    // data within the app
    @State var viewModel = QuotientViewModel()
 
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Extra space at top
            Spacer()
            
            if let quotient = viewModel.quotient {
                
                
                HStack(alignment: .center) {
                    HStack(alignment: .top) {
                        
                        
                        
                        Text("\(quotient.num1.formatted())")
                            .font(.system(size: 96))
                        
                        
                        Text("÷")
                            .font(.system(size: 96))
                        
                        Text("\(quotient.num2.formatted())")
                            .font(.system(size: 96))
                        
                    }
                    HStack {
 
                        Text("=")
                            .font(.system(size: 96))
 
                        Text("\(quotient.result.formatted())")
                            .font(.system(size: 96))
                    }
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(height: 300)
 
            } else {
                
                // Show a message indicating that we are
                // awaiting reasonable input
                ContentUnavailableView(
                    "Unable to evaluate quotient",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                .frame(height: 300)
            }
            
            // INPUT
            TextField("Number 1", text: $viewModel.providedNum1)
                .textFieldStyle(.roundedBorder)
            
            TextField("Number 2", text: $viewModel.providedNum2)
                .textFieldStyle(.roundedBorder)
 
            // Extra space at bottom
            Spacer()
        }
        .padding()
    }
 
}
 
#Preview {
    DivisionView()
}
