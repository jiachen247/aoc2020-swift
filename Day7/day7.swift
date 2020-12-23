import Foundation

// Sorry i give up string manupilation in swift is a mess, used py instead

// Find cardinatily of connected compnent on G'
// O(V + E) with WFS
func part1() {
    var shinyGoldBagId: Int?
    var namesMap = [String: Int]()
    var id = 0

    var adjList = [[Int]]()

    while let line = readLine() {
        let neig = [Int]()
        let parts = line.split(separator: " contains ")

        print(parts.first!)


        adjList.append(neig)
        id += 1
    }
}

part1()