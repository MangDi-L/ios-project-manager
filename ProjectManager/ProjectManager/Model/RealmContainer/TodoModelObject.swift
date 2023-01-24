//
//  Todo.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/24.
//

import Foundation
import RealmSwift

class TodoModelObject: Object {
    @Persisted var id: UUID
    @Persisted var title: String = ""
    @Persisted var body: String = ""
    @Persisted var date: String = ""
}
