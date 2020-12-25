import Foundation

func part1() {
    var mem: [Int: Int] = [:]

    let rawMask = readLine()!
        .split(separator: "=")[1]
        .trimmingCharacters(in: .whitespacesAndNewlines)

    let mask: [Bool?] = Array(rawMask)
        .map {
            if $0 == "0" {
                return false
            } else if $0 == "1" {
                return true
            } else {
                return nil
            }
        }

    while let line readLine() {
        let parts
    }
}

part1()