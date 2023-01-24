//
//  TodoModel.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/24.
//

import Foundation

struct ProjectModel: Identifiable {
    let id: UUID
    var title, body, date: String
}
