//
//  day2.swift
//
//  
//
//  Created by jiachen on 22/12/20.
//

import Foundation

extension String {
    func split(_ separator: Character) -> [String] {
        self.split(separator: separator)
            .map { String($0).trimmingCharacters(in: .whitespaces) }
    }
}

struct PasswordPolicy {
    let min: Int
    let max: Int
    let letter: Character

    init(line: String) {
        let parts: [String] = line.split(" ")
        let rangeParts: [Int] = parts[0].split("-").map { Int($0)! }
        self.min = rangeParts[0]
        self.max = rangeParts[1]
        self.letter = Character(parts[1])
    }

    func isValid(password: String) -> Bool {
        
        let count = password.reduce(0) {
            acc, c in
            return c == letter ? acc + 1 : acc
        }

        // news operator pattern matches to see if valid
        return min...max ~= count
    }

    func isValid2(password: String) -> Bool {
        let startInd = password.startIndex

        // Seriously one of the stupidest things about swift
        let minChar = password[password.index(startInd, offsetBy: min - 1)]
        let maxChar = password[password.index(startInd, offsetBy: max - 1)]
        
        // XOR (^ does is Int typed...)
        return (minChar == letter) != (maxChar == letter)
    }
}

// Ans 1: 550
// Ans 2: 634
func main() {
    var validCount = 0
    while let line = readLine()  {
        let parts: [String] = line.split(":")
        let policy: PasswordPolicy = PasswordPolicy(line: parts[0])
        let password: String = parts[1]

        if policy.isValid2(password: password) {
            validCount += 1
        }
    }
    print(validCount)
}

main()
