//
//  ActivityDetailView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/10.
//

import SwiftUI

struct ActivityDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.injected) private var injected: DIContainer
    
    @State private var schedules: [Schedule] = []
    
    var activity: Activity
    var users: [User]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("happy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 5) {
                    Text(activity.name)
                        .font(.headline)
                    
                    HStack {
                        ForEach(users) { user in
                            Image(user.avatar)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                                .padding(.leading, -15)
                        }
                        Image(systemName: "plus")
                    }
                    .padding(.leading, 15)
                    
                }
            }
            .padding([.leading, .top, .bottom])
            
            ScheduleList(schedules: schedules)
        }
        .onAppear {
            injected.interactors.activityInteractor.loadSchedules(activityID:activity.id, schedules: $schedules)
            
        }
        .navigationTitle("Schedules")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left"))")
                }
                .tint(.darkGreen)
            }
        }
    }
}

#Preview {
    ActivityDetailView(activity: Activity(id: "1", name: "name1", coverPhoto: "tree", startDate: "2024/01/02", endDate: "2024/01/03"), users: [User(id: "1", account: "account1", name: "name1", avatar: "student"),User(id: "2", account: "account2", name: "name2", avatar: "student"),User(id: "3", account: "account3", name: "name3", avatar: "student")])
        .inject(AppEnvironment.bootstrap().container)
}
