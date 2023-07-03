//
//  HabitIcons.swift
//  iHabit
//
//  Created by Philipp Sanktjohanser on 19.12.22.
//

import SwiftUI

enum HabitIcons: String, CaseIterable {
    case exercise = "figure.strengthtraining.traditional"
    case relaxation = "figure.mind.and.body"
    case computer = "laptopcomputer"
    case food = "fork.knife"
}

enum HabitIconColor: CaseIterable {
    case systemBlue
    case systemBrown
    case systemCyan
    case systemGreen
    case systemIndigo
    case systemMint
    case systemOrange
    case systemPink
    case systemPurple
    case systemRed
    case systemTeal
    case systemYellow
    
    var colorName: String {
        switch self {
            case .systemBlue:   return "Blue"
            case .systemBrown:  return "Brown"
            case .systemCyan:   return "Cyan"
            case .systemGreen:  return "Green"
            case .systemIndigo: return "Indigo"
            case .systemMint:   return "Mint"
            case .systemOrange: return "Orange"
            case .systemPink:   return "Pink"
            case .systemPurple: return "Purple"
            case .systemRed:    return "Red"
            case .systemTeal:   return "Teal"
            case .systemYellow: return "Yellow"
        }
    }
    
    var color: Color {
        switch self {
        case .systemBlue:
            return Color(.systemBlue)
        case .systemBrown:
            return Color(.systemBrown)
        case .systemCyan:
            return Color(.systemCyan)
        case .systemGreen:
            return Color(.systemGreen)
        case .systemIndigo:
            return Color(.systemIndigo)
        case .systemMint:
            return Color(.systemMint)
        case .systemOrange:
            return Color(.systemOrange)
        case .systemPink:
            return Color(.systemPink)
        case .systemPurple:
            return Color(.systemPurple)
        case .systemRed:
            return Color(.systemRed)
        case .systemTeal:
            return Color(.systemTeal)
        case .systemYellow:
            return Color(.systemYellow)
        }
    }
}
