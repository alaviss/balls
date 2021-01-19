version = "2.1.0"
author = "disruptek"
description = "a unittest framework with balls 🔴🟡🟢"
license = "MIT"

# requires kute & co.
requires "https://github.com/disruptek/grok >= 0.3.0 & < 1.0.0"
requires "https://github.com/disruptek/ups < 1.0.0"
requires "https://github.com/xmonader/nim-terminaltables#37981f5d403fb55688e00d24ab9b1d56e252f52b"

bin = @["balls"]            # build the binary for basic test running
installExt = @["nim"]       # we need to install balls.nim also
skipDirs = @["tests"]       # so stupid...  who doesn't want tests?
#installFiles = @["balls.nim"] # https://github.com/nim-lang/Nim/issues/16661

task test, "run tests for ci":
  exec "nim c --run balls.nim"

task demo, "produce a demo":
  exec "nim c --define:release balls.nim"
  when (NimMajor, NimMinor) != (1, 0):
    echo "due to nim bug #16307, use nim-1.0"
    quit 1
  exec """demo docs/demo.svg "nim c --out=\$1 examples/fails.nim""""
  exec """demo docs/clean.svg "balls -f --out=\$1""""
