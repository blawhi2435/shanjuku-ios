//
//  ActivityListView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/7.
//

import SwiftUI

struct ActivityListView: View {
    @Environment(\.injected) private var injected: DIContainer
    @State var activities: [Activity] = []
    var body: some View {
        NavigationStack {
            VStack {
                ActivityList(activities: activities)
                
            }
            .navigationTitle("My Activities")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //Todo action
                    } label: {
                        Image(systemName: "plus")
                    }
                    .tint(.brown)
                }
            }
        }
        .onAppear {
            injected.interactors.userInteractor.loadUserActivities(userID: "1", activities: $activities)
        }
    }
}

#Preview {
    ActivityListView()
        .inject(AppEnvironment.bootstrap().container)
}
