//
//  MultiplicationView.swift
//  MVVMAndFreeformInput
//
//  Created by Nicholas Hwang on 25/2/2025.
//

import SwiftUI

struct MultiplicationView: View {
    // MARK: Stored properties
       @State var base: Int = 1
       @State var base2: Int = 1
       
       // MARK: Computed properties
       var result: Int {
           return base * base2
       }
       
       var body: some View {
           VStack(alignment: .trailing) {
               
               Spacer()
               
               Text("\(base)")
                   .font(.system(size: 96))
               Stepper(value: $base, label: { Text("Select First Number")})
               HStack {
                   Text("X")
                       .font(.system(size:96))
                   Spacer()
                   Text("\(base2)")
                       .font(.system(size:96))
               }
               Stepper(value: $base2, label: { Text("Select Second Number")})
               Text("\(result)")
                   .font(.system(size:96))
               Spacer()
           }
           .padding()
       }
   }

#Preview {
    MultiplicationView()
}

