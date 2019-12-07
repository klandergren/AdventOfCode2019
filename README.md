# AdventOfCode2019

personal solutions to https://adventofcode.com/2019

# to build

```
$ swift build -c release
```

# to run

```
$ ./.build/release/AdventOfCode2019 [puzzle-name] path/to/input.txt [additional-arg1] [additional-arg2]
```

where `path/to/input.txt` contains supplied input data. `additional-arg1` and others are problem dependent. `InputData/` exists as a convenient git-ignored location to store files.

examples:

```
$ ./.build/release/AdventOfCode2019 day01-part1 InputData/day01-input.txt
$ ./.build/release/AdventOfCode2019 day02-part2 InputData/day02-input.txt 19690720
```

# list supported puzzle-name values

```
$ ./.build/release/AdventOfCode2019
```

