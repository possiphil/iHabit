//
//  Habit.swift
//  iHabit
//
//  Created by Philipp Sanktjohanser on 08.02.23.
//

import SwiftUI

struct Habit: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var image: String
    var colorString: String
    var streak = 0
    
    var color: Color {
        
        return .red
    }
    
    static func ==(lhs: Habit, rhs: Habit) -> Bool {
        lhs.id == rhs.id
    }
}
