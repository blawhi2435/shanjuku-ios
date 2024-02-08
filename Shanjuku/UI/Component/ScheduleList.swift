//
//  ScheduleList.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/8.
//

import SwiftUI

struct ScheduleList: View {
    @State var schedules: [Schedule] = []
    var timeInterval: String?
    var body: some View {
        List {
            ForEach(schedules) { schedule in
                HStack() {
                    VStack() {
                        Text(schedule.startTime)
                            .timeStyle()
                        Text("|")
                        Text(schedule.endTime)
                            .timeStyle()
                    }
                    .frame(width: 60)
                        Color.white
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(
                                color: .secondary,
                                radius: CGFloat(3),
                                x: CGFloat(3), y: CGFloat(3))
                            .overlay {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("\(getTimeIntervalString(start: schedule.startTime, end: schedule.endTime, format: "HH:mm"))")
                                            .font(.subheadline)
                                            .bold()
                                            .foregroundColor(.darkGreen)
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                                            .padding()
                                        
                                        Text(schedule.name)
                                            .font(.subheadline)
                                            .bold()
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                                            .padding(.leading)
                                        
                                        
                                        Text(schedule.location)
                                            .font(.caption)
                                            .lineLimit(1)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .foregroundColor(.gray)
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
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
            }
            .padding([.top, .bottom], 10)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.lightGray)
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
    ScheduleList(schedules: [Schedule(id: "1", name: "名稱1", location: "台北市中正區重慶南路一段122號", comment: "description", touristGuideName: "ㄘㄨㄚˋ英文", touristGuideAvatar: "guideAvatar", date: "2024-01-01", startTime: "09:00", endTime: "11:00"), Schedule(id: "2", name: "名稱2", location: "台北市中正區重慶南路一段122號", comment: "description", touristGuideName: "ㄘㄨㄚˋ英文", touristGuideAvatar: "guideAvatar", date: "2024-01-01", startTime: "11:00", endTime: "12:30")])
}
