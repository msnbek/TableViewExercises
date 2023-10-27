//
//  Model.swift
//  TableViewExercises
//
//  Created by Mahmut Senbek on 6.10.2023.
//

import Foundation

struct Person {
    var name : String
    var surname : String
    var team : String
    var age : Int
    var hometown : String
    var email : String
}


extension ViewController {
 static var passengers : [Person] = [
        Person(name: "Mahmut", surname: "Şenbek", team: "iOS Team", age: 24, hometown: "Tokat", email: "mahmutsenbek@icloud.com"),
        Person(name: "Veysel", surname: "Akbalık", team: "iOS Team", age: 26, hometown: "Istanbul", email: "veyselakbalık@x.com"),
        Person(name: "Bora", surname: "Berberoglu", team: "iOS Team", age: 24, hometown: "Tokat", email: "boraberberoglu@x.com"),
        Person(name: "Furkan", surname: "Kafalat", team: "Designer Team", age: 23, hometown: "Kastamonu", email: "furkankafalat@x.com"),
        Person(name: "Ece", surname: "Kozan", team: "Designer Team", age: 22, hometown: "Afyon", email: "ecekozan@x.com"),
        Person(name: "Zeynep", surname: "Gedik", team: "Android Team", age: 25, hometown: "Sivas", email: "zeynepgedik@x.com"),
        Person(name: "Ali", surname: "Veli", team: "Android Team", age: 24, hometown: "Rize", email: "aliveli@x.com")
    ]
}

