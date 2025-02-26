//
//  SumViewModel.swift
//  MVVMAndFreeformInput
//
//  Created by Nicholas Hwang on 25/2/2025.
//


import Foundation

// VIEW MODEL
@Observable
class SumViewModel {
    
    // MARK: Stored properties
    
    // Holds whatever the user has typed in the text fields
    var providedNum1: String
    var providedNum2: String
    
    // Holds an appropriate error message, if there was a
    // problem with input provided by the user
    var recoverySuggestion: String = ""
    
    // MARK: Computed properties
    // Holds the evaluated power, when the input provided is valid
    var sum: Sum? {
        
        // First check that the string in providedBase can
        // be converted into a number, then check that the
        // value is more than 0
        guard let num1 = Double(providedNum1) else {
            recoverySuggestion = "Please provide a number."
            
            return nil
        }
        
        // Now check that the string in providedExponent can be
        // converted into an integer, and that the value is
        // more than or equal to 1
        guard let num2 = Double(providedNum2) else {
            recoverySuggestion = "Please provide a number."
            
            return nil
        }
        
        // Now that we know the base and exponent have valid values, return the evaluated power
        recoverySuggestion = "" // No error message
        return Sum(num1: num1, num2: num2)
        
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


