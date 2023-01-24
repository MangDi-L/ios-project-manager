//
//  DoneModelObject.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/25.
//

import Foundation
import RealmSwift

class DoneModelObject: Object {
    @Persisted var id: UUID = UUID()
    @Persisted var title: String = ""
    @Persisted var body: String = ""
    @Persisted var date: String = ""
}
