# Changelog

## [2026-10-07] - Submix event hardening

### Fixed
- `applySubmix` validates its argument and rate-limits per player (250 ms), so a modified client can no longer spam submix toggles at everyone.
