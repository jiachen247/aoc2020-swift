import Foundation

func part1() {
    var arr = [Int]()
    var oneJolts = 0
    var threeJolts = 1
    while let line = readLine(), let num = Int(line) {
        arr.append(num)
    }

    arr.sort()

    var prev = 0

    for curr in arr {
        if prev + 3 >= curr {
            let difference = curr - prev

            if difference == 1 {
                oneJolts += 1
            } else if difference == 3 {
                threeJolts += 1
            }

            prev = curr
        } else {
            break
        }
    }
    print(oneJolts * threeJolts)
    
}

// Bottom up DP soln, O(kn)
// k seems to be small 
func part2() {
    var arr = [0]

    while let line = readLine(), let num = Int(line) {
        arr.append(num)
    }

    arr.sort()

    let k = arr.last! + 3
    arr.append(k)

    var dp = Array(repeating: 0, count: k + 1)
    dp[k] = 1

    for i in (0...(k - 3)).reversed() where arr.contains(i) {
        for j in 1...3 { 
            dp[i] += dp[i + j]
        }
    }

    print(dp[0])
}

part2()