//
//  UserRepository.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/7.
//

import Foundation

protocol UserRepository {
    func fetchUserActivities(userID: String) -> [Activity]
}

struct UserRepositoryImpl: UserRepository{
    
    
}

extension UserRepositoryImpl {
    func fetchUserActivities(userID: String) -> [Activity] {
        let activities: [Activity] = [
            Activity(id: "1", name: "name1", coverPhoto: "tree", startDate: "2024/01/01", endDate: "2024/01/03"),
            Activity(id: "2", name: "name2", coverPhoto: "tree", startDate: "2024/02/01", endDate: "2024/02/03"),
            Activity(id: "3", name: "name3", coverPhoto: "tree", startDate: "2024/03/01", endDate: "2024/03/03"),
            Activity(id: "4", name: "name4", coverPhoto: "tree", startDate: "2024/03/01", endDate: "2024/03/03")
        ]
        
        return activities
    }
}
