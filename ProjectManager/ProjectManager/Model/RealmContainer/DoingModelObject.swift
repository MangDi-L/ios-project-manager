//
//  DoingModelObject.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/25.
//

import Foundation
import RealmSwift

class DoingModelObject: Object {
    @Persisted var id: UUID = UUID()
    @Persisted var title: String = ""
    @Persisted var body: String = ""
    @Persisted var date: String = ""
}
