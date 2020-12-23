import Foundation

enum Instructions: String {
    case NOP = "nop"
    case JUMP = "jmp"
    case ACC = "acc"
}

struct Command {
    let instruction: Instructions
    let operand: Int
}

// 1766
func part1() {
    var program = [Command]()

    while let line = readLine() {
        let parts = line.split(separator: " ")

        program.append(
            Command(
                instruction: Instructions(rawValue: String(parts.first!))!,
                operand: Int(String(parts[1]))!
            )
        )
    }
    
    let EOF = program.count
    var pc = 0
    var acc = 0

    var visited = Set<Int>()

    while pc < EOF {
        let command = program[pc]

        if visited.contains(pc) {
            break
        }
        visited.insert(pc)
        switch command.instruction {
        case .NOP:
            pc += 1
        case .JUMP:
            pc += command.operand
        case .ACC:
            acc += command.operand
            pc += 1
        }
    }
    print(acc)
}


func eval(program: [Command]) -> Int? {
    var pc = 0
    var acc = 0

    var visited = Set<Int>()

    while pc < program.count {
        let command = program[pc]

        if visited.contains(pc) {
            return nil
        }
        visited.insert(pc)
        switch command.instruction {
        case .NOP:
            pc += 1
        case .JUMP:
            pc += command.operand
        case .ACC:
            acc += command.operand
            pc += 1
        }
    }

    return acc
}

// 1639
func part2() {
    var program = [Command]()

    while let line = readLine() {
        let parts = line.split(separator: " ")

        program.append(
            Command(
                instruction: Instructions(rawValue: String(parts.first!))!,
                operand: Int(String(parts[1]))!
            )
        )
    }

    for index in 0..<program.count {
        let command = program[index]
        if command.instruction == .ACC {
            continue
        }
    
        var cp = program
        cp[index] = Command(
            instruction: command.instruction == .JUMP ? .NOP : .JUMP, 
            operand: command.operand
        )

        if let result = eval(program: cp) {
            print(result)
            break
        }
    
    }
}

part2()