//
//  ContentView.swift
//  iHabit
//
//  Created by Philipp Sanktjohanser on 19.12.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitTracker = HabitTracker()
    
    var body: some View {
        HabitView()
            .environmentObject(habitTracker)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habitTracker: HabitTracker())
    }
}
