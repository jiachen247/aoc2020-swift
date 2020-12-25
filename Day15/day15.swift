import Foundation

func part1(){
    let starting = [1, 20, 8, 12, 0, 14]
    // let n = 2020
    let n = 30000000
    var lastSeen: [Int: Int] = [:]

    var prev: Int = -1

    for t in 0..<n {
        if t < starting.count {
            lastSeen[prev] = t
            prev = starting[t]
        } else if lastSeen[prev] != nil {
            let tmp = prev
            prev = t - lastSeen[prev]!
            lastSeen[tmp] = t
        } else {
            lastSeen[prev] = t
            prev = 0
        }
        
    }

    print(prev)
}

part1()