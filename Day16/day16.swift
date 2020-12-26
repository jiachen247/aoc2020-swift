import Foundation

struct Range {
    let start: Int
    let end: Int
}

struct Rule {
    let name : String
    let ranges: [Range]

    func isAllowed(num: Int) -> Bool {
        return ranges.first(where: {
            num >= $0.start && num <= $0.end
        }) != nil
    }
}

struct Ticket {
    let fields: [Int]

    func isValid(rules: [Rule]) -> Bool {
        fields.allSatisfy { num in
            rules.first(where: { $0.isAllowed(num: num) }) != nil
        }
    }
}

// Part1: 20048
// Part 2: 4810284647569
func part2() {
    var rules = [Rule]()
    var myTicket: Ticket?

    while let line = readLine(), !line.isEmpty {

        let tokens = line.split(separator: ":")

        let rangesStr = tokens[1]
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .split(separator: " ")
            .filter { $0 != "or" }

        let ranges: [Range] = rangesStr.map {
            s in
            let parts = s.split(separator: "-").map {
                Int($0)
            }
            return Range(start: parts[0]!, end: parts[1]!)
        }
        rules.append(Rule(name: String(tokens[0]), ranges: ranges))
    }

    let _ = readLine()

    while let line = readLine(), !line.isEmpty {
        myTicket = Ticket(fields: line.split(separator: ",").map {
            Int($0)!
        })
    }

    let _ = readLine()

    var validTickets = [Ticket]()

    while let line = readLine(), !line.isEmpty {
        let nums = line.split(separator: ",").map {
            Int($0)!
        }

        let ticket = Ticket(fields: nums)

        if ticket.isValid(rules: rules) {
            validTickets.append(ticket)
        }
        
    }

    var allowed : [Int: NSMutableArray] = [:]
    var assigned: [Int: Int] = [:]
    let n = rules.count

    for i in 0..<n {
        allowed[i] = NSMutableArray()
        inner: for j in 0..<n {
            for ticket in validTickets {
                if !rules[i].isAllowed(num: ticket.fields[j]) {
                    continue inner
                }
            }
            allowed[i]!.add(j)
        }
    }

    while assigned.count < n {
        for i in 0..<n {
            if !assigned.keys.contains(i) {
                if allowed[i]!.count == 1 {
                    let curr = allowed[i]![0] as! Int
                    assigned[i] = curr
                    for arr in allowed.values {
                        let index = arr.index(of: curr) 
                        if index != NSNotFound {
                            arr.removeObject(at: index)
                        }
                    }
                }
            }
        }
    }

    var acc = 1

    for (i, rule) in rules.enumerated() {
        if rule.name.hasPrefix("departure") {
            acc *= myTicket!.fields[assigned[i]!]
        }
    }

    print(acc)
}

part2()