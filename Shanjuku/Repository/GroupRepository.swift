//
//  GroupRepository.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/6.
//

import Foundation

protocol GroupRepository {
    func fetchGroups() -> [Group]
    func fetchUsersAndActivitiesByGroupID(by groupID: String) -> ([User], [Activity])
}

struct GroupRepositoryImpl: GroupRepository{
    
    
}

extension GroupRepositoryImpl {
    func fetchGroups() -> [Group] {
        let groups: [Group] = [
            Group(id: "1", creatorID: UUID().description, name: "group1"),
            Group(id: "2", creatorID: UUID().description, name: "group2"),
            Group(id: "3", creatorID: UUID().description, name: "group3")]
        
        return groups
    }
    
    func fetchUsersAndActivitiesByGroupID(by groupID: String) -> ([User], [Activity]) {
        let users: [User] = [
            User(id: "1", account: "account1", name: "name1", avatar: "student"),
            User(id: "2", account: "account2", name: "name2", avatar: "student"),
            User(id: "3", account: "account3", name: "name3", avatar: "student")
        ]
        
        let activities: [Activity] = [
            Activity(id: "1", name: "name1", coverPhoto: "tree", startDate: "2024/01/01", endDate: "2024/01/03"),
            Activity(id: "2", name: "name2", coverPhoto: "tree", startDate: "2024/02/01", endDate: "2024/02/03"),
            Activity(id: "3", name: "name3", coverPhoto: "tree", startDate: "2024/03/01", endDate: "2024/03/03"),
            Activity(id: "4", name: "name4", coverPhoto: "tree", startDate: "2024/03/01", endDate: "2024/03/03")
        ]
        
        return (users, activities)
    }
}
