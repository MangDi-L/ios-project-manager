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

    func fetchProjects(kind: KindOfCollectionView) -> [ProjectModel] {
        switch kind {
        case .todoCollectionView:
            let todoModels = realm.objects(TodoModelObject.self)
            var todoList: [ProjectModel] = []

            for todo in todoModels {
                let todoModel = ProjectModel(id: todo.id, title: todo.title, body: todo.body, date: todo.date)
                todoList.append(todoModel)
            }
            return todoList
        case .doingCollectionView:
            let doingModels = realm.objects(DoingModelObject.self)
            var doingList: [ProjectModel] = []

            for doing in doingModels {
                let doingModel = ProjectModel(id: doing.id, title: doing.title, body: doing.body, date: doing.date)
                doingList.append(doingModel)
            }
            return doingList
        case .doneCollectionView:
            let doneModels = realm.objects(DoneModelObject.self)
            var doneList: [ProjectModel] = []

            for done in doneModels {
                let doingModel = ProjectModel(id: done.id, title: done.title, body: done.body, date: done.date)
                doneList.append(doingModel)
            }
            return doneList
        }
    }

    func insertProject(kind: KindOfCollectionView, projectModel: ProjectModel) {
        switch kind {
        case .todoCollectionView:
            try! realm.write {
                let todoModelObject = TodoModelObject()
                todoModelObject.id = projectModel.id
                todoModelObject.title = projectModel.title
                todoModelObject.body = projectModel.body
                todoModelObject.date = projectModel.date
                realm.add(todoModelObject)
            }
        case .doingCollectionView:
            try! realm.write {
                let doingModelObject = DoingModelObject()
                doingModelObject.id = projectModel.id
                doingModelObject.title = projectModel.title
                doingModelObject.body = projectModel.body
                doingModelObject.date = projectModel.date
                realm.add(doingModelObject)
            }
        case .doneCollectionView:
            try! realm.write {
                let doneModelObject = DoneModelObject()
                doneModelObject.id = projectModel.id
                doneModelObject.title = projectModel.title
                doneModelObject.body = projectModel.body
                doneModelObject.date = projectModel.date
                realm.add(doneModelObject)
            }
        }
    }

    func updateProject(projectModel: ProjectModel) {
        let predicate = NSPredicate(format: "id == %@", projectModel.id as CVarArg)
        let todoModelObject = realm.objects(TodoModelObject.self).filter(predicate).first
        try! realm.write {
            todoModelObject?.title = projectModel.title
            todoModelObject?.body = projectModel.body
            todoModelObject?.date = projectModel.date
        }
    }

    func deleteProject(kind: KindOfCollectionView, projectID: UUID) {
        let predicate = NSPredicate(format: "id == %@", projectID as CVarArg)

        switch kind {
        case .todoCollectionView:
            try! realm.write {
                realm.delete(realm.objects(TodoModelObject.self).filter(predicate))
            }
        case .doingCollectionView:
            try! realm.write {
                realm.delete(realm.objects(DoingModelObject.self).filter(predicate))
            }
        case .doneCollectionView:
            try! realm.write {
                realm.delete(realm.objects(DoneModelObject.self).filter(predicate))
            }
        }
    }
}
