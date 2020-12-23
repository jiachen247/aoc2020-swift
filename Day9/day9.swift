import Foundation

// 1721308972
// Techincally still O(n) :-)
func part1() {
    var arr = [Int]()
    let PREMBLE_SIZE = 25

    while let line = readLine(), let current = Int(line) {
        arr.append(current)
    }

    for i in PREMBLE_SIZE..<arr.count {
        var isValid = false
        for j in (i - PREMBLE_SIZE)...(i - 2) {
            for k in (j + 1)...(i - 1) {
                if arr[j] + arr[k] == arr[i] {
                    isValid = true
                }
            }
        }
        if !isValid {
            print(arr[i])
            return
        }
    }
}

// 209694133
func part2() {
    var arr = [Int]()
    let TARGET = 1721308972

    while let line = readLine(), let current = Int(line) {
        arr.append(current)
    }

    // gg O(n^3)
    // can use lc cumsum / hashset trick to get(n^2)
    for i in 0..<arr.count {
        for j in i..<arr.count {
            let window = arr[i...j]
            if window.reduce(0, +) == TARGET {
                print(window.max()! + window.min()!)
                return
            }
        }
    }
}

part2()