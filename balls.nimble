version = "4.0.18"
author = "disruptek"
description = "a unittest framework with balls 🔴🟡🟢"
license = "MIT"

# requires newTreeFrom
requires "https://github.com/disruptek/grok >= 0.5.0 & < 1.0.0"
requires "https://github.com/disruptek/ups < 1.0.0"
requires "https://github.com/disruptek/insideout"

bin = @["balls"]            # build the binary for basic test running
installExt = @["nim"]       # we need to install balls.nim also
skipDirs = @["tests"]       # so stupid...  who doesn't want tests?
#installFiles = @["balls.nim"] # https://github.com/nim-lang/Nim/issues/16661

task demo, "produce a demo":
  exec "nim c --gc:arc --define:release balls.nim"
  exec """demo docs/demo.svg "nim c --out=\$1 examples/fails.nim""""
  exec """demo docs/clean.svg "nim c --define:danger --out=\$1 tests/test.nim""""
  exec "nim c --define:release --define:ballsDry balls.nim"
  exec """demo docs/runner.svg "balls""""

