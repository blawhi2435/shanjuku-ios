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
        
        init(groupRepository: GroupRepository, userRepository: UserRepository) {
            self.groupRepository = groupRepository
            self.userRepository = userRepository
        }
    }
}
