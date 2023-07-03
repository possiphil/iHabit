//
//  HabitRowView.swift
//  iHabit
//
//  Created by Philipp Sanktjohanser on 19.12.22.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let completed: Bool
    
    var body: some View {
        HStack {
            Image(systemName: habit.image)
                .foregroundColor(habit.color)
                .padding(.leading)
            
            Text(habit.title)
                .font(.title3.bold())
                .foregroundColor(.primary)
                .padding(.leading, 8)
                .padding(.vertical, 16)
            
            Spacer()
            
            Text(habit.streak == 0 ? "" : "🔥 \(habit.streak) Days")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.trailing)
        }
        .background(completed ? habit.color.opacity(0.25) : Color("Default Background"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal)
    }
}
