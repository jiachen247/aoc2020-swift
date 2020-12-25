import Foundation

func part1() {
    let start = Int(readLine()!)!
    let busses = readLine()!.split(separator: ",").filter {
        $0 != "x"
    }.map { Int($0)! }

    var time  = start
    while true {
        for bus in busses {
            if time % bus == 0 {
                print((time - start) * bus)
                return
            }
        }
        time += 1
    }
}

struct Offset {
    let bus: Int
    let value: Int
}

func isValid(time: Int, offsets: [Offset]) -> Bool {
    for offset in offsets {
        if (time + offset.value) % offset.bus != 0 {
            return false
        }
    }

    return true
}

func part2() {
    let _ = readLine()
    let busses: [Int?] = readLine()!.split(separator: ",").map { 
        $0 == "x" ? nil : Int($0)! 
    }

    // let max = busses.compactMap { $0 }.max()!
    // let maxInd = busses.firstIndex(of: max)!

    // print(maxInd)

    var offsets = [Offset]()
    
    for i in 0..<busses.count {
        if let bus = busses[i] {
            offsets.append(Offset(bus: bus, value: i))
        }
    }

    print(offsets)

    let jump: Int = offsets.first!.bus
    var time: Int = 0
    while true {
        if isValid(time: time, offsets: offsets) {
            print(time)
            return
        }
        time += jump
    }
}

part2()