//
//  RealmManager.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/25.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()

    private init() { }

    private let realm = try! Realm()

    func fetchTodos() -> [ProjectModel] {
        let todoModels = realm.objects(TodoModelObject.self)
        var todoList: [ProjectModel] = []

        for todo in todoModels {
            let todoModel = ProjectModel(id: todo.id, title: todo.title, body: todo.body, date: todo.date)
            todoList.append(todoModel)
        }
        return todoList
    }

    func fetchDoings() -> [ProjectModel] {
        let doingModels = realm.objects(DoingModelObject.self)
        var doingList: [ProjectModel] = []

        for doing in doingModels {
            let doingModel = ProjectModel(id: doing.id, title: doing.title, body: doing.body, date: doing.date)
            doingList.append(doingModel)
        }
        return doingList
    }

    func fetchDones() -> [ProjectModel] {
        let doneModels = realm.objects(DoneModelObject.self)
        var doneList: [ProjectModel] = []

        for done in doneModels {
            let doingModel = ProjectModel(id: done.id, title: done.title, body: done.body, date: done.date)
            doneList.append(doingModel)
        }
        return doneList
    }
}
