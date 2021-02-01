import UIKit
import Foundation


enum TrunkCar{
    case full(gruz:  Int), empty(gruz: Int)
}

protocol Car {
    var trailer : Bool?{get set}
    var lift : Bool?{get set}
    var windows : Bool{get set}
    mutating func changeWindows(isWindows: Bool)
    var door : Bool{get set}
    mutating func changeDoor(isDoor: Bool)
    var wheel : Int{get set}
    var maxWheel : Int{get set}
    var trunk : Bool{get set}
    var luke : Bool?{get set}
    mutating func changeLuke(isLuke: Bool)
    var engine : Bool{get set}
    mutating func changeEngine(isEngine: Bool)
    
}

extension Car {
    mutating func changeWindows(isWindows: Bool){
        
     if isWindows == true {
       windows = true
     } else {
        windows = false
     }
}
    mutating func changeEngine(isEngine: Bool){
        
        if isEngine == true {
            engine = true
        } else {
            engine = false
        }
    }
    
    mutating func changeLuke(isLuke: Bool){
        if isLuke == true {
            luke = true
        } else {
            luke = false
        }
    }
    
    mutating func changeDoor(isDoor: Bool){
        if isDoor == true {
            door = true
        } else {
            door = false
        }
    }
    
    mutating func changeTrunk(action: TrunkCar){
        switch action {
        case .full(let gruz):
            if (gruz + wheel) <= maxWheel && wheel >= 0{
                wheel += gruz
            } else if gruz >= maxWheel + 1 {
                print ("Can't put!")
            }
            
            if wheel >= maxWheel {
                trunk = true
            }
           
        case .empty(let gruz):
            if  wheel >= maxWheel {
                wheel -= gruz
                
            }
            
            if wheel < maxWheel && wheel >= 0 {
                trunk = false
                print("Can't get it!")
            } else if wheel < 0 {
                wheel = 0
                trunk = false
                print("Can't!")
            }
        }
    }
    
    
}


class SportCar: Car {
    var trailer : Bool?
    var lift : Bool?
    var door: Bool
    var wheel: Int
    var maxWheel: Int
    var trunk: Bool
    var luke: Bool?
    var engine: Bool
    var windows : Bool
    
    init(door: Bool,wheel: Int, maxWheel: Int = 4, luke: Bool, engine: Bool, windows : Bool ) {
        self.door = door
        self.wheel = wheel
        self.maxWheel = maxWheel
        self.trunk = wheel >= maxWheel ? true : false
        self.luke = luke
        self.engine = engine
        self.windows = windows
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
            -------------------
            Door in car: \(door ? "Open" : "Close")
            Engine car: \(engine ? "On" : "Off")
            Windows car: \(windows ? "Open" : "Close")
            Trunk car: \(trunk ? "Full" : "Empty")
            Luke car: \(luke ?? false ? "Open" : "Close")
            Wheel in car: \(wheel)
            """
    }
}

var mashina = SportCar(door: true, wheel: 0, maxWheel: 4, luke: false, engine: true, windows: false)

mashina.changeLuke(isLuke: true)
mashina.changeDoor(isDoor: false)
mashina.changeEngine(isEngine: false)
mashina.changeTrunk(action: .full(gruz: 4))
print(mashina.description)


class TruckCar: Car {
    var trailer : Bool?
    var lift : Bool?
    var door: Bool
    var wheel: Int
    var maxWheel: Int
    var trunk: Bool
    var luke: Bool?
    var engine: Bool
    var windows : Bool
    
    init(door: Bool,wheel: Int, maxWheel: Int = 60, engine: Bool, windows : Bool, lift : Bool, trailer : Bool) {
        self.door = door
        self.wheel = wheel
        self.maxWheel = maxWheel
        self.trunk = wheel >= maxWheel ? true : false
        self.luke = nil
        self.engine = engine
        self.windows = windows
        self.lift = lift
        self.trailer = trailer
    }
}
extension TruckCar: CustomStringConvertible {
    var description: String {
        return """
            -------------------
            Door in car: \(door ? "Open" : "Close")
            Engine car: \(engine ? "On" : "Off")
            Windows car: \(windows ? "Open" : "Close")
            Trunk car: \(trunk ? "Full" : "Empty")
            Trailer in car: \(trailer ?? false ? "Yes" : "No")
            Lift in car: \(lift ?? false ? "Yes" : "No")
            Wheel in car: \(wheel)
            """
    }
}

var truck = TruckCar(door: true, wheel: 5, engine: false, windows: true, lift: true, trailer: false)
truck.changeTrunk(action: .full(gruz: 45))
truck.changeDoor(isDoor: false)
truck.changeEngine(isEngine: true)
truck.changeWindows(isWindows: false)
print(truck.description)

