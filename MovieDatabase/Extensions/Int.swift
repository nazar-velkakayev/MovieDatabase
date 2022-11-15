//
//  Int.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 15/11/2022.
//

import Foundation


extension Int{
    
    func minutesToHoursAndMinutes() -> String {
        let hours = self / 60
        let minutes  = self % 60
        
        return "\(hours) h \(minutes) min"
    }
}
