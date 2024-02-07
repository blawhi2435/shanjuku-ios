//
//  GroupDetailView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/7.
//

import SwiftUI

struct GroupDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.injected) private var injected: DIContainer
    @State var users: [User] = []
    @State var activities: [Activity] = []
    
    var group: Group
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Image("happy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 5) {
                    Text(group.name)
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
            .padding([.leading, .top])
            
            ActivityList(activities: activities)
        }
        .onAppear {
            injected.interactors.groupInteractor.loadUsersAndActivities(groupID: group.id, users: $users, activities: $activities)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left"))")
                }
                .tint(.brown)
            }
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
}

#Preview {
    GroupDetailView(group: Group(id: "1", creatorID: "1", name: "my awesome group"))
        .inject(AppEnvironment.bootstrap().container)
}
