import Foundation

struct Direction {
    let right: Int
    let down: Int
}

func eval(map: Array<Array<Character>>, direction: Direction) -> Int {
    var i = direction.right
    var j = direction.down

    let n = map.count
    let k = map[0].count

    var treeCount = 0
    
    while j < n {
        if map[j][i] == "#" {
            treeCount += 1
        }

        i = (i + direction.right) % k
        j += direction.down
    }

    return treeCount
}

// Part 1: 252 
// Part 2: 2608962048
func main() {
    var map: Array<Array<Character>> = [Array<Character>]()

    while let line = readLine() {
        map.append(line.map { String($0) }.map { Character($0) })
    }

    let directions: [Direction] = [
        Direction(right: 1, down: 1), 
        Direction(right: 3, down: 1),
        Direction(right: 5, down: 1),
        Direction(right: 7, down: 1),
        Direction(right: 1, down: 2)
    ]

    let result = directions.reduce(1) {
        acc, dir in
        return acc * eval(map: map, direction: dir)
    }

    print(result)
}

main()