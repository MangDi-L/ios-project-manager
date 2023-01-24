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

    func insertProject(kind: KindOfCollectionView, title: String, body: String, date: String) {
        switch kind {
        case .todoCollectionView:
            try! realm.write {
                let todoModelObject = TodoModelObject()
                todoModelObject.title = title
                todoModelObject.body = body
                todoModelObject.date = date
                realm.add(todoModelObject)
            }
        case .doingCollectionView:
            try! realm.write {
                let doingModelObject = DoingModelObject()
                doingModelObject.title = title
                doingModelObject.body = body
                doingModelObject.date = date
                realm.add(doingModelObject)
            }
        case .doneCollectionView:
            try! realm.write {
                let doneModelObject = DoneModelObject()
                doneModelObject.title = title
                doneModelObject.body = body
                doneModelObject.date = date
                realm.add(doneModelObject)
            }
        }
    }

    func updateProject(kind: KindOfCollectionView, projectModel: ProjectModel) {
        switch kind {
        case .todoCollectionView:
            let todoModelObject = realm.objects(TodoModelObject.self).filter("id == \(projectModel.id)").first
            try! realm.write {
                todoModelObject?.title = projectModel.title
                todoModelObject?.body = projectModel.body
                todoModelObject?.date = projectModel.date
            }
        case .doingCollectionView:
            let doingModelObject = realm.objects(DoingModelObject.self).filter("id == \(projectModel.id)").first
            try! realm.write {
                doingModelObject?.title = projectModel.title
                doingModelObject?.body = projectModel.body
                doingModelObject?.date = projectModel.date
            }
        case .doneCollectionView:
            let doneModelObject = realm.objects(DoneModelObject.self).filter("id == \(projectModel.id)").first
            try! realm.write {
                doneModelObject?.title = projectModel.title
                doneModelObject?.body = projectModel.body
                doneModelObject?.date = projectModel.date
            }
        }
    }

    func deleteProject(kind: KindOfCollectionView, projectMode: ProjectModel) {
        switch kind {
        case .todoCollectionView:
            try! realm.write {
                realm.delete(realm.objects(TodoModelObject.self).filter("id == \(projectMode.id)"))
            }
        case .doingCollectionView:
            try! realm.write {
                realm.delete(realm.objects(DoingModelObject.self).filter("id == \(projectMode.id)"))
            }
        case .doneCollectionView:
            try! realm.write {
                realm.delete(realm.objects(DoneModelObject.self).filter("id == \(projectMode.id)"))
            }
        }
    }
}
