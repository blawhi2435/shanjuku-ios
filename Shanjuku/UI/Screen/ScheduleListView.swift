//
//  ScheduleListView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/11.
//

import SwiftUI

struct ScheduleListView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.injected) private var injected: DIContainer
    
    @State private var schedules: [Schedule] = []
    
    var activity: Activity
    var users: [User]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("guideAvatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(activity.name)
                    
                    if !users.isEmpty {
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

struct ScheduleList: View {
    var schedules: [Schedule]
    var timeInterval: String?
    var body: some View {
        List {
            ForEach(schedules) { schedule in
                HStack() {
                    VStack(spacing: 3) {
                        Text(schedule.startTime)
                            .timeStyle()
                        Text("l")
                        Text(schedule.endTime)
                            .timeStyle()
                    }
                    .frame(width: 60)
                    Color.white
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(
                            color: .secondary,
                            radius: CGFloat(1),
                            x: CGFloat(2), y: CGFloat(2))
                        .overlay {
                            HStack() {
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("\(getTimeIntervalString(start: schedule.startTime, end: schedule.endTime, format: "HH:mm"))")
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(.darkGreen)
                                        .padding(.leading)
                                    
                                    
                                    Text(schedule.name)
                                        .font(.title3)
                                        .bold()
                                        .padding(.leading)
                                }
                                Spacer()
                                HStack {
                                    ForEach(schedule.touristGuides) { user in
                                        Image(user.avatar)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 35, height: 35)
                                            .clipShape(Circle())
                                    }
                                }
                                .padding()
                            }
                            
                            Button {
                            } label: {
                                Image(systemName: "ellipsis")
                            }
                            .buttonStyle(.plain)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                            .padding()
                        }
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.lightGray)
            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 30))
        }
        .listStyle(.plain)
        
        
    }
    
    func getTimeIntervalString(start: String, end: String, format: String) -> String {
        let timeDifference = TimeDifferenceHelper(startTime: start, endTime: end, format: format)
        
        if let interval = timeDifference.IntervalToString() {
            return interval
        }
        
        return ""
    }
}

#Preview {
    ScheduleListView(activity: Activity(id: "1", name: "name1", coverPhoto: "tree", startDate: "2024/01/02", endDate: "2024/01/03"), users: [User(id: "1", account: "account1", name: "name1", avatar: "student"),User(id: "2", account: "account2", name: "name2", avatar: "student"),User(id: "3", account: "account3", name: "name3", avatar: "student")])
        .inject(AppEnvironment.bootstrap().container)
}

#Preview {
    ScheduleListView(activity: Activity(id: "1", name: "name1", coverPhoto: "tree", startDate: "2024/01/02", endDate: "2024/01/03"), users: [])
        .inject(AppEnvironment.bootstrap().container)
}

#Preview {
    ScheduleList(schedules: [Schedule(id: "1", name: "活動名稱1", location: "台北市中正區重慶南路一段122號", comment: "description", date: "2024-01-01", startTime: "09:00", endTime: "11:00", touristGuides: [User(id: "1", account: "account1", name: "name1", avatar: "student")]), Schedule(id: "2", name: "活動名稱2", location: "台北市中正區重慶南路一段122號", comment: "description",  date: "2024-01-01", startTime: "11:00", endTime: "12:30", touristGuides: [User(id: "1", account: "account1", name: "name1", avatar: "student"),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 User(id: "2", account: "account2", name: "name2", avatar: "student")])])
}
