//
//  RepositoryContainer.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/6.
//

import Foundation

extension DIContainer {
    struct Repositories {
        let groupRepository: GroupRepository
        let userRepository: UserRepository
        let activityRepository: ActivityRepository
        
        init(groupRepository: GroupRepository, userRepository: UserRepository, activityRepository: ActivityRepository) {
            self.groupRepository = groupRepository
            self.userRepository = userRepository
            self.activityRepository = activityRepository
        }
    }
}
