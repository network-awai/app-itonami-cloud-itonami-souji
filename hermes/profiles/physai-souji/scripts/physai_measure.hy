#!/usr/bin/env hy
"""Kotoba cron measurement launcher for a physical-AI profile."""

(import os subprocess)
(import pathlib [Path])

(setv PROFILE (.name (.parent (.parent (.resolve (Path __file__))))))
(setv ROOT (os.environ.get "ITONAMI_ROOT"
                          (str ((. (Path "~/github/com-junkawasaki/root") expanduser)))))
(setv KBB (os.environ.get "KBB" "/opt/homebrew/bin/kbb"))
(setv TICK (str (.joinpath (Path ROOT) "scripts" "physical-ai-bots" "tick.cljk")))

(when (= __name__ "__main__")
  (raise (SystemExit (.returncode (subprocess.run
                                   [KBB "--backend" "sci" TICK "evidence" PROFILE]
                                   :cwd ROOT)))))
