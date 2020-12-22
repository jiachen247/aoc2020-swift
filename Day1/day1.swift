//
//  day1.swift
//
//  
//
//  Created by jiachen on 22/12/20.
//

// Part one can be reduced to Two Sum
// Implemented one pass with hashset
// Ans: 970816
func part1() {
    var complements = Set<Int>()

    while let line = readLine(), let num = Int(line) {
        if complements.contains(num) {
            print(num * (2020 - num))
            break
        }
        complements.insert(2020 - num)
    }
}

// Part 2 can be reduced to 3sum
// Implemented trivial O(n^3) solution
// Ans: 96047280
func part2() {
    var arr = [Int]()

    while let line = readLine(), let num = Int(line) {
        arr.append(num)
    }

    let n = arr.count
    for i in 0..<n {
        for j in i+1..<n {
            for k in j+1..<n {

                if arr[i] + arr[j] + arr[k] == 2020 {
                    print(arr[i] * arr[j] * arr[k])
                }
            }
        }
    }
}

part1()

