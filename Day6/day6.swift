import Foundation

// Ans: 6291
func part1() {
    var seen = Set<Character>()
    var acc = 0

    while let line = readLine() {
        if line.isEmpty {
            acc += seen.count
            seen.removeAll()
        } else {
            seen = seen.union(line)
        }
    }
    acc += seen.count
    print(acc)
}

// Ans: 3052
func part2() {
    var seen = Set<Character>()
    var acc = 0
    var firstLine = true

    while let line = readLine() {
        if line.isEmpty {
            acc += seen.count
            seen.removeAll()
            firstLine = true
        } else if firstLine {
            seen = seen.union(line)
            firstLine = false
        } else {
            seen = seen.intersection(line)
        }
    }
    acc += seen.count
    print(acc)
}

part2()