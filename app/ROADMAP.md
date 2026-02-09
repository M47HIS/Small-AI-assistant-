# RightKey Loadstar Roadmap

This is the single roadmap of record for app delivery. Use this file as the planning and execution source of truth.

## Product Contract (Fixed)
- macOS SwiftUI menu-bar assistant.
- Two runtime modes:
  - `Privacy Mode`: local inference with downloaded models.
  - `Cloud Mode`: user-provided provider/API credentials.
- User can switch modes anytime in Preferences.
- OCR/vision screen context is local capture and prompt input.
- No browser automation.
- No deep filesystem indexing/background crawling.

## Current State
- Core overlay, hotkey, local model download, and local inference are implemented.
- Runtime controls (llama.cpp path/settings) are implemented.
- App structure is canonical under `app/`.

## Phase 1 - Mode System (Now)
Outcome: user can select mode on first run and switch safely at runtime.

Deliverables:
- Onboarding mode picker (`Privacy` / `Cloud`).
- Preferences mode switch with visible active-mode badge.
- Mode router in runtime layer (local backend vs cloud backend).
- Safe transition logic (cancel in-flight, switch backend, preserve prompt).

Exit criteria:
- Mode persists across restarts.
- Switching mode does not crash or hang active UI.
- Tests cover persistence and switch transitions.

## Phase 2 - Cloud Providers (Next)
Outcome: cloud mode works with user-owned providers.

Deliverables:
- Provider adapters (start: OpenAI/ChatGPT-style API, Gemini).
- API key entry and validation UX.
- Secure key storage strategy (Keychain-backed).
- Per-provider request/response normalization.

Exit criteria:
- User can configure provider and receive responses in cloud mode.
- Failed auth/network states are surfaced with actionable errors.
- No hidden fallback from privacy mode to cloud mode.

## Phase 3 - OCR/Screen Intelligence (Priority)
Outcome: RightKey answers from live on-screen context.

Deliverables:
- Real-time OCR/vision capture pipeline (local processing).
- Capture source selector (screen/window/region).
- Prompt fusion: OCR text + app metadata + user prompt.
- Real-time suggestion stream in overlay.
- Capture controls: enable toggle, quick pause, visible capture indicator.

Exit criteria:
- OCR context updates while active session is open.
- Suggestions update without blocking input latency.
- Capture stops immediately when paused/disabled.

## Phase 4 - Reliability and Quality
Outcome: production-grade stability and debuggability.

Deliverables:
- Telemetry-free diagnostics.
- Crash recovery + safe mode.
- Benchmarks for local/cloud latency and OCR throughput.
- Regression tests for mode switching and OCR prompt fusion.

Exit criteria:
- Clean `swift test` in CI and locally.
- No P1 regressions on mode switch, model load/unload, or OCR capture loop.

## Execution Rules
- Keep diffs small and reversible.
- Add tests for all behavior changes.
- Update `app/README.md` and `app/CHANGELOG.md` when scope/behavior changes.
- Push each major change set to GitHub.
