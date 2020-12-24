import Foundation

enum Seat: Character {
    case FLOOR = "."
    case EMPTY = "L"
    case OCCUPIED = "#"
}

func printLayout(layout: [[Seat]]) {
    for row in layout {
        var tmp = ""
        for c in row {
            tmp += String(c.rawValue)
        }
        print(tmp)
    }
}

// Ans 2303
func part1() {
    var layout = [[Seat]]()
    var isConverged = false

    while let line = readLine() {   
        let row = Array(line).map {
            Seat(rawValue: $0)!
        }
        layout.append(row)
    }

    let r = layout.count
    let c = layout.first!.count

    var occupiedSeatsCount  = 0

    while !isConverged {
        isConverged = true
        occupiedSeatsCount  = 0
        var cp = layout

        for i in 0..<r {
            for j in 0..<c {
                l1: switch layout[i][j] {
                    case .FLOOR:
                        break l1
                    case .EMPTY:
                        
                        for x in (max(0, i - 1))...(min(r - 1, i + 1)) {
                            for y in (max(0, j - 1))...(min(c - 1, j + 1)) {
                                if layout[x][y] == Seat.OCCUPIED {
                                    break l1
                                }
                            }
                        }
                        isConverged = false
                        cp[i][j] = Seat.OCCUPIED
                    case .OCCUPIED:
                        occupiedSeatsCount  += 1
                        var freeAdj = 0
                        for x in (max(0, i - 1))...(min(r - 1, i + 1)) {
                            for y in (max(0, j - 1))...(min(c - 1, j + 1)) {

                                if layout[x][y] == Seat.OCCUPIED {
                                    freeAdj += 1
                                }
                            }
                        }

                        if freeAdj >= 5 {
                            isConverged = false
                            cp[i][j] = Seat.EMPTY
                        }
                        
                }
            }
        }
        layout = cp
    }
    print(occupiedSeatsCount)
}

// 2057
func part2() {
    var layout = [[Seat]]()
    var isConverged = false

    let directions = [
        [-1, -1],
        [-1, 0],
        [-1, 1],
        [0, -1],
        [0, 1],
        [1, -1],
        [1, 0],
        [1, 1],
    ]
    
    while let line = readLine() {   
        let row = Array(line).map {
            Seat(rawValue: $0)!
        }
        layout.append(row)
    }

    let r = layout.count
    let c = layout.first!.count

    var occupiedSeatsCount  = 0

    while !isConverged {
        isConverged = true
        occupiedSeatsCount  = 0
        var cp = layout
        
        for i in 0..<r {
            for j in 0..<c {
                l1: switch layout[i][j] {
                    case .FLOOR:
                        break l1
                    case .EMPTY:
                        for direction in directions {
                            var x = i + direction[0]
                            var y = j + direction[1]

                            inner: while x >= 0 && x < r && y >= 0 && y < c {
                                if layout[x][y] == .EMPTY {
                                    break inner
                                } else if layout[x][y] == .OCCUPIED{
                                    break l1
                                }

                                x += direction[0]
                                y += direction[1]
                            }
                        }

                        isConverged = false
                        cp[i][j] = Seat.OCCUPIED
                    case .OCCUPIED:
                        occupiedSeatsCount  += 1
                        var freeAdj = 0

                        for direction in directions {
                            var x = i + direction[0]
                            var y = j + direction[1]

                            inner: while x >= 0 && x < r && y >= 0 && y < c {
                                if layout[x][y] == .EMPTY {
                                    break inner
                                } else if layout[x][y] == .OCCUPIED{
                                    freeAdj += 1
                                    break inner
                                }

                                x += direction[0]
                                y += direction[1]
                            }
                        }

                        if freeAdj >= 5 {
                            isConverged = false
                            cp[i][j] = Seat.EMPTY
                        }
                }
            }
        }
        layout = cp
    }
    print(occupiedSeatsCount)
}

part2()