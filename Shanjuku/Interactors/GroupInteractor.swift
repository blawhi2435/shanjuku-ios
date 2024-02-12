//
//  GroupInteractor.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/6.
//

import Foundation
import SwiftUI

protocol GroupInteractor {
    func loadGroups(userID: String, groups: Binding<[Group]>)
    func loadUsersAndActivities(groupID: String, users: Binding<[User]>, activities: Binding<[Activity]>)
    func loadUsers(by groupID: String, users: Binding<[User]>)
}

struct GroupInteractorImpl: GroupInteractor {

    private let appState: AppState
    private let groupRepository: GroupRepository
    
    init(appState: AppState, groupRepository: GroupRepository) {
        self.appState = appState
        self.groupRepository = groupRepository
    }
}

extension GroupInteractorImpl {
    
    func loadGroups(userID: String, groups: Binding<[Group]>) {
        
        var fetchedGroups: [Group]
        fetchedGroups = groupRepository.fetchGroups()
        groups.wrappedValue = fetchedGroups
    }
    
    func loadUsersAndActivities(groupID: String, users: Binding<[User]>, activities: Binding<[Activity]>) {
        
        var fetchedUsers: [User]
        var fetchedActivities: [Activity]
        
        (fetchedUsers, fetchedActivities) = groupRepository.fetchUsersAndActivitiesInGroup(by: groupID)
        users.wrappedValue = fetchedUsers
        activities.wrappedValue = fetchedActivities
    }
    
    func loadUsers(by groupID: String, users: Binding<[User]>) {
        
        var fetchedUsers: [User]
        
        fetchedUsers = groupRepository.fetchUsersInGroup(by: groupID)
        users.wrappedValue = fetchedUsers
    }
}

struct StubGroupInteractorImpl: GroupInteractor {
    func loadGroups(userID: String, groups: Binding<[Group]>) {}
    func loadUsersAndActivities(groupID: String, users: Binding<[User]>, activities: Binding<[Activity]>) {}
    func loadUsers(by groupID: String, users: Binding<[User]>) {}
}
