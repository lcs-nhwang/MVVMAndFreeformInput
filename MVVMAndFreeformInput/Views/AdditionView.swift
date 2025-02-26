//
//  AdditionView.swift
//  MVVMAndFreeformInput
//
//  Created by Nicholas Hwang on 25/2/2025.
//


import SwiftUI
 
struct AdditionView: View {
    
    // MARK: Stored properties
    
    // Holds the view model, to track current state of
    // data within the app
    @State var viewModel = SumViewModel()
 
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Extra space at top
            Spacer()
            
            if let sum = viewModel.sum {
                
                
                HStack(alignment: .center) {
                    HStack(alignment: .top) {
                        
                        
                        
                        Text("\(sum.num1.formatted())")
                            .font(.system(size: 96))
                        
                        
                        Text("+")
                            .font(.system(size: 96))
                        
                        Text("\(sum.num2.formatted())")
                            .font(.system(size: 96))
                        
                    }
                    HStack {
 
                        Text("=")
                            .font(.system(size: 96))
 
                        Text("\(sum.sumResult.formatted())")
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
                    "Unable to evaluate sum",
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
    AdditionView()
}
