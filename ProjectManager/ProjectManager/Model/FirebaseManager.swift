//
//  FirebaseManager.swift
//  ProjectManager
//
//  Created by Mangdi on 2023/01/25.
//

import Foundation
import FirebaseDatabase

final class FirebaseManager {
    static let shared: FirebaseManager = FirebaseManager()
    private init() { }

    let ref: DatabaseReference = Database.database().reference()

//    private func convertDateToString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM dd, yyyy h:mm:ss a"
//        let date = formatter.string(from: Date())
//        return date
//    }

    func addedProject() {
        ref.child("History").childByAutoId().child("Added '청소하기'").setValue("asdf")
        ref.child("History").childByAutoId().child("Added '청소하기'").setValue("수정함")
    }

    func getHistory() {
        print(convertDateToString())
        ref.child("History").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            let data = snapshot?.value as? [String: [String: String]]

            var semiData: [String: String] = [:]

            data?.forEach({ key, value in
                print(value)
                value.forEach { key, value in
                    semiData[key] = value
                }
            })

            semiData.forEach { key, value in
                print("\(key), \(value)")
            }
        }
    }

    func modifiedProject() {

    }

    func movedProject() {

    }

    func removedProject() {

    }
//    for todo in todoLists {
//        let data: [String: Any] = [
//            "title": todo.title,
//            "body": todo.body,
//            "date": todo.date
//        ]
//        ref.child("TodoList").child("\(todo.id)").setValue(data)
//    }
//        ref.child("TodoList/\(todoLists[0].id)").setValue("asdf")

//    ref.child("TodoList").getData { error, snapshot in
//        guard error == nil else {
//            print(error?.localizedDescription)
//            return
//        }
//        let data = snapshot?.value
//        print(data!)
//    }
}
