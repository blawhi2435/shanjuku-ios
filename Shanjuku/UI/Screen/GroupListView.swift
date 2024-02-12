//
//  GroupView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/6.
//

import SwiftUI

struct GroupView: View {
    @Environment(\.injected) private var injected: DIContainer
    @State var groups: [Group] = []
    @State private var showCreateGroup: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groups) { group in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: GroupDetailView(group: group)) {
                            EmptyView()
                        }
                        .opacity(0)
                        HStack(alignment: .center, spacing: 15) {
                            Image("happy")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(20)
                            Text(group.name)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("My Groups")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.showCreateGroup = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .tint(.darkGreen)
                }
            }
            .fullScreenCover(isPresented: $showCreateGroup) {
                CreateGroupView()
            }
        }
        .onAppear {
            injected.interactors.groupInteractor.loadGroups(userID: "1", groups: $groups)
        }
    }
}

#Preview {
    GroupView()
        .inject(AppEnvironment.bootstrap().container)
}
