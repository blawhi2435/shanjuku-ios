//
//  ActivityList.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/7.
//

import SwiftUI

struct ActivityList: View {
    
    @State private var isExpanded = false
    var activities: [Activity]
    @State private var testAlert: Bool = false
    
    var body: some View {
        
        List {
            ForEach(activities) { activity in
                VStack() {
                    Image(activity.coverPhoto)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay {
                            VStack {
                                Button {
                                    testAlert = true
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .frame(width: 20, height: 25)
                                }
                                .buttonStyle(.plain)
                                .alert("ddd", isPresented: $testAlert) {
                                    Button("OK") {}
                                }
                                .foregroundStyle(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                
                                VStack(alignment: .leading) {
                                    Text(activity.name)
                                        .foregroundStyle(.white)
                                        .bold()
                                        .font(.body)
                                    
                                    Text("\(activity.startDate) - \(activity.endDate)")
                                        .foregroundStyle(.white)
                                        .bold()
                                        .font(.footnote)
                                }
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                            }
                        }
                }
                
            }
            .listRowSeparator(.hidden)
            HStack{
                Spacer()
                ShowExpireActivityButton()
                Spacer()
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ShowExpireActivityButton: View {
    @State private var test: Bool = false
    var body: some View {
        Button {
            test = true
        } label: {
            Text("Show completed activities")
                .padding()
                .foregroundStyle(Color.darkGreen)
        }
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.darkGreen, lineWidth: 2)
        }.alert("test", isPresented: $test) {
            Button("OK") {}
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ActivityList(activities: [Activity(id: "1", name: "name1", coverPhoto: "tree", startDate: "2024/01/02", endDate: "2024/01/03"), Activity(id: "2", name: "name2", coverPhoto: "tree", startDate: "2024/01/02", endDate: "2024/01/03"), Activity(id: "3", name: "name3", coverPhoto: "tree", startDate: "2024/01/02", endDate: "2024/01/03"),Activity(id: "4", name: "name4", coverPhoto: "tree", startDate: "2024/01/02", endDate: "2024/01/03")])
}
