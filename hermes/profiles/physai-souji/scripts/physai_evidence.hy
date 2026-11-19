#!/usr/bin/env hy
"""Kotoba cron evidence launcher for a physical-AI growth profile."""

(import os subprocess sys)
(import pathlib [Path])

(setv PROFILE (.name (.parent (.parent (.resolve (Path __file__))))))
(setv ROOT (os.environ.get "ITONAMI_ROOT"
                          (str ((. (Path "~/github/com-junkawasaki/root") expanduser)))))
(setv KBB (os.environ.get "KBB" "/opt/homebrew/bin/kbb"))
(setv TICK (str (.joinpath (Path ROOT) "scripts" "physical-ai-bots" "tick.cljk")))

(defn main []
  (setv result (subprocess.run [KBB "--backend" "sci" TICK "evidence" PROFILE "--hermes"]
                               :cwd ROOT :capture_output True :text True))
  (sys.stdout.write result.stdout)
  (when (!= result.returncode 0)
    (print (.format "STATUS\tUNMEASURED\nERROR\ttick.cljk exited {}: {}"
                    result.returncode (cut (.strip result.stderr) -600 None))))
  0)

(when (= __name__ "__main__")
  (raise (SystemExit (main))))
