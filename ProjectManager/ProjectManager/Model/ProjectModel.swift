//
//  TodoModel.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/24.
//

import Foundation

struct ProjectModel: Identifiable {
    var id: UUID
    var title, body, date: String

    init(id: UUID = UUID(), title: String, body: String, date: String) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
    }
}
