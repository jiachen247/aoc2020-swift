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

func rotateLeft(facing: Direction, rotations: Int) -> Direction {
    let newInd = (4 + directionOrder.firstIndex(of: facing)! - rotations) % 4
    return directionOrder[newInd]
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

// 2879
func part1() {
    let current = Position(x: 0, y: 0)
    var facing = Direction.EAST

    while var line = readLine() {
        let command = Navigation(rawValue: Character(String(line.first!)))!
        line.remove(at: line.startIndex)
        let operand = Int(line)!

        switch command {
            case .NORTH:
                move(position: current, direction: Direction.NORTH, magnitude: operand)
            case .SOUTH:
                move(position: current, direction: Direction.SOUTH, magnitude: operand)
            case .EAST:
                move(position: current, direction: Direction.EAST, magnitude: operand)
            case .WEST:
                move(position: current, direction: Direction.WEST, magnitude: operand)
            case .LEFT:
                facing = rotateLeft(facing: facing, rotations: operand / 90) 
            case .RIGHT:
                facing = rotateLeft(facing: facing, rotations: (360 - operand) / 90) 
            case .FORWARD:
                move(position: current, direction: facing, magnitude: operand)
        }
    }
    print(current.dist)
}

part1()