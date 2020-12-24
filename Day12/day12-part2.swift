import Foundation

enum Navigation: Character {
    case NORTH = "N"
    case SOUTH = "S"
    case EAST = "E"
    case WEST = "W"
    case LEFT = "L"
    case RIGHT = "R"
    case FORWARD = "F"
}

enum Direction {
    case NORTH, SOUTH, EAST, WEST
}

class Position {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    var dist: Int {
        abs(self.x) + abs(self.y)
    }
}

let directionOrder = [Direction.NORTH, Direction.EAST, Direction.SOUTH, Direction.WEST]

func rotateWaypoint(rotations: Int, waypoint: Position) {
    for _ in 0..<rotations {
        let tmp = waypoint.x
        waypoint.x = -1 * waypoint.y
        waypoint.y = tmp
    }
}

func move(position: Position, direction: Direction, magnitude: Int) {
    switch direction {
    case .NORTH:
        position.y += magnitude
    case .SOUTH:
        position.y -= magnitude
    case .EAST:
        position.x += magnitude
    case .WEST:
        position.x -= magnitude
    }
}

func move(position: Position, waypoint: Position, times: Int) {
    position.x += waypoint.x * times
    position.y += waypoint.y * times
}

// 178986
func part2() {
    let waypoint = Position(x: 10, y: 1) // technically not a position
    let current = Position(x: 0, y: 0)

    while var line = readLine() {
        let command = Navigation(rawValue: Character(String(line.first!)))!
        line.remove(at: line.startIndex)
        let operand = Int(line)!

        switch command {
            case .NORTH:
                move(position: waypoint, direction: Direction.NORTH, magnitude: operand)
            case .SOUTH:
                move(position: waypoint, direction: Direction.SOUTH, magnitude: operand)
            case .EAST:
                move(position: waypoint, direction: Direction.EAST, magnitude: operand)
            case .WEST:
                move(position: waypoint, direction: Direction.WEST, magnitude: operand)
            case .LEFT:
                rotateWaypoint(rotations: operand / 90, waypoint: waypoint) 
            case .RIGHT:
                rotateWaypoint(rotations: (360 - operand) / 90, waypoint: waypoint)
            case .FORWARD:
                move(position: current, waypoint: waypoint, times: operand)
        }
    }
    print(current.dist)
}

part2()