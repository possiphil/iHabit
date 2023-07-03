//
//  HabitView.swift
//  iHabit
//
//  Created by Philipp Sanktjohanser on 19.12.22.
//

import SwiftUI

struct HabitView: View {
    @EnvironmentObject var habitTracker: HabitTracker
    @State private var isAddingHabit = false
    @State private var isEditingHabit = false
    @State private var isCompleted = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color("Background 1"), Color("Background 2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // Content
            ScrollView {
                ForEach(habitTracker.habits) { habit in
                    HabitRowView(habit: habit, completed: isCompleted)
                        .padding(.bottom, 8)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                if isCompleted == false {
                                    habitTracker.complete(habit)
                                } else {
                                    habitTracker.undo(habit)
                                }
                                isCompleted.toggle()
                            }
                        }
                        .onLongPressGesture {
                            isEditingHabit.toggle()
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.vertical, 4)
            
            // Floating Button
            Button {
                isAddingHabit.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .frame(width: 60, height: 60)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding(.horizontal, 24)
                    .padding(.vertical)
                    .shadow(radius: 3)
            }
        }
        .sheet(isPresented: $isAddingHabit) {
            AddHabitView()
        }
        .sheet(isPresented: $isEditingHabit) {
//            EditHabitView(habit: habit)
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView()
            .preferredColorScheme(.dark)
            .environmentObject(HabitTracker())
    }
}
