//
//  EditHabitView.swift
//  iHabit
//
//  Created by Philipp Sanktjohanser on 19.12.22.
//

import SwiftUI

struct EditHabitView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var habitTracker: HabitTracker
    @State private var habitTitle = ""
    @State private var habitIcon = HabitIcons.exercise
    @State private var habitColor = HabitIconColor.systemBlue
    
    let columns = [GridItem(.adaptive(minimum: 50))]
    
    var habit: Habit
    
    var body: some View {
        VStack(spacing: 32) {
            // Habit Title
            TextField("", text: $habitTitle)
                .placeholder("Habit Title", when: habitTitle.isEmpty)
                .frame(height: 44)
                .padding(.horizontal, 12)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("TextField Background")))
            
            Picker("Icon", selection: $habitIcon) {
                ForEach(HabitIcons.allCases, id: \.self) { icon in
                    Image(systemName: icon.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(HabitIconColor.allCases, id: \.self) { item in
                    Image(systemName: "square.fill")
                        .font(.title)
                        .foregroundColor(item.color)
                        .onTapGesture {
                            habitColor = item
                        }
                }
            }
            
            Button {
                editHabit()
                dismiss()
            } label: {
                Text("Confirm")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .background(habit.color)
                    .clipShape(Capsule())
            }
            .padding(.top, 24)

            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 24)
        .onAppear {
            habitTitle = habit.title
//            habitColor = habit.color
            
            switch habit.image {
            case "figure.mind.and.body":    habitIcon = .relaxation
            case "laptopcomputer":          habitIcon = .computer
            case "fork.knife":              habitIcon = .food
            default:                        habitIcon = .exercise
            }
        }
    }
    
    func editHabit() {
        let newHabit = Habit(id: habit.id, title: habitTitle, image: habitIcon.rawValue, colorString: habitColor.colorName, streak: habit.streak)
        habitTracker.edit(newHabit)
    }
}
