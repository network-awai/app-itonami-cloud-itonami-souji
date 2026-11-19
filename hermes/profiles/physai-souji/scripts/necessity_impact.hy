#!/usr/bin/env hy
"""Kotoba cron launcher for the profile-local necessity-impact probe."""

(import os subprocess)
(import pathlib [Path])

(setv SCRIPT-DIR (.parent (.resolve (Path __file__)))
      KBB (os.environ.get "KBB" "/opt/homebrew/bin/kbb")
      PROBE (str (.joinpath SCRIPT-DIR "necessity_impact.cljk")))

(when (= __name__ "__main__")
  (raise (SystemExit (.returncode (subprocess.run
                                   [KBB "--backend" "sci" PROBE])))))
