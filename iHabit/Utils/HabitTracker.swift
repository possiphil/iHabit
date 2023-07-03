//
//  HabitTracker.swift
//  iHabit
//
//  Created by Philipp Sanktjohanser on 19.12.22.
//

import SwiftUI

class HabitTracker: ObservableObject {
    private let saveKey = "Habits"
    
    @Published var habits = [Habit]()
    
    init() {
        load()
    }
    
    func load() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
                habits = decoded
            }
        }
    }
    
    func add(_ habit: Habit) {
        habits.append(habit)
        save()
    }
    
    func edit(_ habit: Habit) {
        guard let index = habits.firstIndex(where: { $0 == habit }) else { return }
        habits[index] = habit
        save()
    }
    
    func complete(_ habit: Habit) {
        guard var habit = habits.first(where: {$0 == habit}) else { return }
        habit.streak += 1
        save()
    }
    
    func undo(_ habit: Habit) {
        guard var habit = habits.first(where: {$0 == habit}) else { return }
        habit.streak -= 1
        save()
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
}
