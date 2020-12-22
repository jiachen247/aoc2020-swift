import Foundation

func getSeatId(pass: String) -> Int {
    var rlo = 0
    var rhi = 128
    var clo = 0
    var chi = 8

    for char in pass {
        if char == "B" {
            rlo += (rhi - rlo) / 2
        } else if char == "F" {
            rhi -= (rhi - rlo) / 2
        } else if char == "R" {
            clo += (chi - clo) / 2
        } else if char == "L" {
            chi -= (chi - clo) / 2
        }
    }

    return rlo * 8 + clo
}

// Ans: 619
func part2() {
    var seen = Set<Int>()

    while let pass = readLine() {
        seen.insert(getSeatId(pass: pass))
    }

    for i in 1...1022 {
        if seen.contains(i - 1), !seen.contains(i), seen.contains(i + 1) {
            print(i)
        }
    }
}

// Ans: 908
func part1() {
    var best = 0
    while let pass = readLine() {
        let score = getSeatId(pass: pass)
        if score > best {
            best = score
        }
    }

    print(best)
}

part2()