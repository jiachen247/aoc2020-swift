import Foundation


extension String {
    struct Data {
        static let fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
        static let eyeColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    }
    
    func isValidYear(between: ClosedRange<Int> = 1000...3000) -> Bool {
        if let year = Int(self), between ~= year {
            return true
        }
        return false
    }

    func isValidField() -> Bool {
        return Data.fields.contains(self)
    }

    func isValidHeight() -> Bool {
        if self.count < 3 {
            return false
        }

        let unit = String(self.suffix(2))
        let valueOpt = Int(String(self.prefix(self.count - 2)))

        if let value = valueOpt, unit == "in", 59...76 ~= value {
            return true
        } else if let value = valueOpt, unit == "cm", 150...193 ~= value {
            return true
        }

        return false


    }

    func isValidHexColor() -> Bool {
        if self.count < 2 {
            return false
        }

        let arr: Array<Character> = self
            .map { Character(String($0)) }

        if arr[0] != "#" {
            return false
        }

        for i in 1..<arr.count {
            if !arr[i].isHexDigit {
                return false
            }
        }

        return true
    }

    func isValidEyeColor() -> Bool {
        return Data.eyeColors.contains(self)
    }

    func isValidPassport() -> Bool {
        return self.count == 9 && Int(self) != nil
    } 
}

struct Validator {
    func validate(key: String, value: String) -> Bool {
        if !key.isValidField() {
            return false
        } else if (key == "byr") {
            return value.isValidYear(between: 1920...2002)
        } else if (key == "iyr") {
            return value.isValidYear(between: 2010...2020)
        } else if (key == "eyr") {
            return value.isValidYear(between: 2020...2030)
        } else if (key == "hgt") {
            return value.isValidHeight()
        } else if (key == "ecl") {
            return value.isValidEyeColor()
        } else if (key == "hcl") {
            return value.isValidHexColor()
        } else if (key == "pid") {
            return value.isValidPassport()
        } else if (key == "cid") {
            return true
        }

        return false
    }
}

// Part 1: 222
// Part 2: 140
func part2() {
    let requiredFieldsCount = 7
    let validator = Validator()
    var requiredFields = Set<String>()
    var validPassportCount = 0

    while let line = readLine() {
        if (line.isEmpty) {
            if requiredFields.count == requiredFieldsCount {
                validPassportCount += 1
            }
            requiredFields.removeAll()
        }

        for pair in line.split(separator: " ") {
            let keyValue = String(pair).split(separator: ":")
            let key = String(keyValue[0])
            let value = String(keyValue[1])

            if key != "cid", validator.validate(key: key, value: value) {
                requiredFields.insert(key)
            }
        }
    }

    if requiredFields.count == requiredFieldsCount {
        validPassportCount += 1
    }

    print(validPassportCount)
}

part2()