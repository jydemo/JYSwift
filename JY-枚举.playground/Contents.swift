//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Movement: Int {
    
    case Left = 0
    
    case Right = 1
    
    case Top = 2
    
    case Bottom = 3

}

let rightMovement = Movement(rawValue: 1)


enum House: String {
    
    case Baratheon = "Ours is the fury"
    
    case Greyjoy = "We do not sow"
    
    case Martell = "unbowed, unbent, unbroken"
    
    case Tully = "Family, Duty, Honor"
    
    case Tyrell = "Growning Strong"
    
    case Stark = "Winter is Coming"
}

let bestHouse = House.Stark

print(bestHouse.rawValue)

enum Constants: Double {
    
    case π = 3.14159
    
    case e = 2.71828
    
    case φ = 1.61803398874
    
    case λ = 1.30357
}

enum Planet: Int {
    
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum CompassPoint: String {
    
    case North, South, East, West
}

let aMo = Movement.Left

switch aMo {
    
    case .Left: print("left")
    
    default:()

}

if case .Left = aMo {
    
    print("left")

}

if aMo == .Left { print("left") }
