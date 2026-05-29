# Fault Chamber

A production-grade chaos engineering toolkit in Go that enforces the **scientific method** on failure testing: every experiment declares a **hypothesis** before injection, captures **timestamped observations** during the run, and produces a **conclusion** (verdict + lesson) afterward.

Unlike kill-stuff-and-see tools, fault-chamber refuses to run an experiment without a written hypothesis and an explicit, bounded **blast radius**, and it **guarantees cleanup** even on panic or kill.

## License

MIT — see [LICENSE](./LICENSE).
