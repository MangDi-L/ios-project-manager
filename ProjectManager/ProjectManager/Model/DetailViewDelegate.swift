//
//  DetailViewControllerDelegate.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/15.
//

import Foundation

protocol DetailViewDelegate: AnyObject {
    func addTodo(todoModel: ProjectModel)
    func editTodo(todoModel: ProjectModel)
}
