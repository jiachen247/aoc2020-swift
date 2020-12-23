import sys

# Ans: 128
def part1():
    adjList = []
    ind = 0
    names = {}

    goldId = 0

    for line in sys.stdin:
        parts = line.strip().replace("bag.", "").replace("bags.", "").replace("bags", "").replace("bag", "").split("contain")
        name = parts[0].strip()
        canContain = parts[1].strip().split(",")

        if name not in names:
            if name == "shiny gold":
                goldId = ind
            names[name] = ind
            adjList.append([])
            ind += 1

        currId = names[name]

        for bag in canContain:
            bag = bag.strip().split(" ", 1)[1]

            if bag == "other":
                continue

            elif bag not in names:
                if bag == "shiny gold":
                    goldId = ind
                names[bag] = ind
                adjList.append([currId])
                ind += 1
            else:
                adjList[names[bag]].append(currId)

    seen = set()

    def dfs(x):
        if x in seen:
            return
        
        seen.add(x)
        for y in adjList[x]:
            dfs(y)

    dfs(goldId)
    print(len(seen) - 1)
    
# 20189
def part2():
    adjList = []
    ind = 0
    names = {}

    goldId = 0

    for line in sys.stdin:
        parts = line.strip().replace("bag.", "").replace("bags.", "").replace("bags", "").replace("bag", "").split("contain")
        name = parts[0].strip()
        canContain = parts[1].strip().split(",")

        if name not in names:
            if name == "shiny gold":
                goldId = ind
            names[name] = ind
            adjList.append([])
            ind += 1

        currId = names[name]

        for bag in canContain:
            num, bag = bag.strip().split(" ", 1)

            if bag == "other":
                continue

            elif bag not in names:
                if bag == "shiny gold":
                    goldId = ind
                names[bag] = ind
                adjList.append([])
                ind += 1

            adjList[currId].append((names[bag], int(num)))

    def countBags(i):
        acc  = 1
        for iid, count in adjList[i]:
            acc += count * countBags(iid)
        return acc
    
    print(countBags(goldId) - 1)

part2()