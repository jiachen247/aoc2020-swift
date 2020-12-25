import sys 

# 18630548206046
def part1():
    mem = {}
    mask = ""

    while True:
        try:
            line = input()
        except:
            break

        tokens = line.split(" = ") 
        
        if tokens[0] == "mask":
            mask = tokens[1]
        else:
            index = int(tokens[0][4:-1])
            value = str(bin(int(tokens[1]))[2:]).zfill(36)

            result = ""

            for i in range(36):
                result += value[i] if mask[i] == "X" else mask[i]

            mem[index] = int(result, 2)

    print(sum(mem.values()))


def genAddress(addrs, addr):
    if "X" not in addr:
        addrs.append(int(addr, 2))
    else:
        genAddress(addrs, addr.replace("X", "0", 1))
        genAddress(addrs, addr.replace("X", "1", 1))

# 4254673508445
def part2():
    mem = {}
    mask = ""

    while True:
        try:
            line = input()
        except:
            break

        tokens = line.split(" = ") 
        
        if tokens[0] == "mask":
            mask = tokens[1]
        else:
            index = int(tokens[0][4:-1])
            value = str(bin(int(tokens[1]))[2:]).zfill(36)

            indexMask = str(bin(index)[2:]).zfill(36)

            addrs = []
            addr = ""

            for i in range(36):
                if mask[i] == "0":
                    addr += indexMask[i]
                elif mask[i] == "1":
                    addr += "1"
                elif mask[i] == "X":
                    addr += "X"

            genAddress(addrs, addr)

            for a in addrs:
                mem[a] = int(value, 2)

    print(sum(mem.values()))

part2()
