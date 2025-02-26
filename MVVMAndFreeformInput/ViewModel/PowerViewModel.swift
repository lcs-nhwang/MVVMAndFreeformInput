//
//  PowerViewModel.swift
//  MVVMAndFreeformInput
//
//  Created by Nicholas Hwang on 24/2/2025.
//

import Foundation

// VIEW MODEL
@Observable
class PowerViewModel {
    
    // MARK: Stored properties
    
    // Holds whatever the user has typed in the text fields
    var providedBase: String
    var providedExponent: String
    
    // Holds an appropriate error message, if there was a
    // problem with input provided by the user
    var recoverySuggestion: String = ""
    
    // MARK: Computed properties
    // Holds the evaluated power, when the input provided is valid
    var power: Power? {
        
        // First check that the string in providedBase can
        // be converted into a number
        guard let base = Double(providedBase) else {
            recoverySuggestion = "Please provide a number for the base of the power."
            
            return nil
        }
        
        // Now check that the string in providedExponent can be
        // converted into an number
        guard let exponent = Int(providedExponent) else {
            recoverySuggestion = "Please provide an integer for the exponent."
            
            return nil
        }
        
        // Now that we know the base and exponent have valid values, return the evaluated power
        recoverySuggestion = "" // No error message
        return Power(base: base, exponent: exponent)
        
    }
    
    
    //MARK: INITIALIZERS
    init(
        providedBase: String = "",
        providedExponent: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedBase = providedBase
        self.providedExponent = providedExponent
        self.recoverySuggestion = recoverySuggestion
    }

}


