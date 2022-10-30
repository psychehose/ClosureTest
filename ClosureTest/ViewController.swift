//
//  ViewController.swift
//  ClosureTest
//
//  Created by 김호세 on 2022/10/30.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    structTest()
    classTest()

    carStructTest()

    print("========= line =========")
    carClassTest()
  }


  func structTest() {

    var oldPerson = PersonStack(name: "Rizwan")
    var newPerson = oldPerson
    newPerson.name = "Oh my Swift"

    print(oldPerson.name)
    print(newPerson.name)
  }

  func classTest() {
    var oldPerson = Person(withName: "Rizwan")
    var newPerson = oldPerson
    newPerson.name = "Oh my Swift"
    print(oldPerson.name)
    print(newPerson.name)
  }


  func carStructTest() {
    var myCar = CarStruct()
    myCar.increaseSpeed = {
      myCar.speed += 30 // The retain cycle occurs here. We cannot use [weak myCar] as myCar is a value type.
    }
    myCar.increaseSpeed?()
    print("My car's speed :")
    print(myCar.speed) // Prints 30

    var myNewCar = myCar
    myNewCar.increaseSpeed?()
    myNewCar.increaseSpeed?()
    print("My new car's speed :")
    print(myNewCar.speed) // Prints 30 still!

  }

  func carClassTest() {
    var myCar = CarClass()
    myCar.increaseSpeed = {
      myCar.speed += 30 // The retain cycle occurs here. We cannot use [weak myCar] as myCar is a value type.
    }
    myCar.increaseSpeed?()
    print("My car's speed :")
    print(myCar.speed) // Prints 30

    var myNewCar = myCar
    myNewCar.increaseSpeed?()
    myNewCar.increaseSpeed?()
    print("My new car's speed :")
    print(myNewCar.speed) // Prints 90 still!

  }
}




struct PersonStack {
  var name: String
}

class Person {
  var name: String
  init(withName name: String){
    self.name = name
  }
}


struct CarStruct {
  var speed: Float = 0.0
  var increaseSpeed: (() -> ())?
}

class CarClass {
  var speed: Float = 0.0
  var increaseSpeed: (() -> ())?
}

