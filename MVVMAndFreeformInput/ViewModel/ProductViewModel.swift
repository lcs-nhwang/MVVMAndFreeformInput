//
//  ProductViewModel.swift
//  MVVMAndFreeformInput
//
//  Created by Nicholas Hwang on 26/2/2025.
//

import Foundation

// VIEW MODEL
@Observable
class ProductViewModel {
    
    // MARK: Stored properties
    
    // Holds whatever the user has typed in the text fields
    var providedNum1: String
    var providedNum2: String
    
    // Holds an appropriate error message, if there was a
    // problem with input provided by the user
    var recoverySuggestion: String = ""
    
    // MARK: Computed properties
    // Holds the evaluated product, when the input provided is valid
    var product: Product? {
        // First check that the string in num1 can
        // be converted into a number
        guard let num1 = Double(providedNum1) else {
            recoverySuggestion = "Please provide a number."
            
            return nil
        }
        
        // Now check that the string in num2 can be
        // converted into an number
        guard let num2 = Double(providedNum2) else {
            recoverySuggestion = "Please provide a number."
            
            return nil
        }
        
        // Now that we know the num1 and num2 have valid values, return the evaluated product
        recoverySuggestion = "" // No error message
        return Product(num1: num1, num2: num2)
        
    }
    
    
    //MARK: INITIALIZERS
    init(
        providedNum1: String = "",
        providedNum2: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedNum1 = providedNum1
        self.providedNum2 = providedNum2
        self.recoverySuggestion = recoverySuggestion
    }

}
