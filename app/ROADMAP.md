# Roadmap

## Phase 0 - Product Decisions
- SwiftUI menu-bar app (macOS native).
- Local-only inference forever (no cloud inference).
- No browser automation and no deep filesystem indexing.
- Runtimes: llama.cpp for current models.
- Model storage: `~/Library/Application Support/RightKey/Models`.

## Workflow
- Push changes to https://github.com/M47HIS/Small-AI-assistant- as soon as possible.

## Phase 1 - Desktop Core (Current)
- Global hotkey listener (customizable).
- Top-right chat bar UI with settings icon.
- First-run model download flow.
- Context collector: clipboard + frontmost app title.
- Model switching with single-model-in-RAM rule.
- Idle unload after 90s.

## Phase 2 - Screen Context (Priority)
- Real-time on-screen OCR/vision capture pipeline (local processing).
- Source selection: active screen/window/region.
- Prompt fusion: OCR text + app metadata + user prompt.
- Capture controls: explicit enable, quick pause, visible capture status.

## Phase 3 - Interaction
- Prompt templates for task types.
- Streaming responses + cancel.
- Quick actions (copy, paste, re-run).

## Phase 4 - Reliability
- Telemetry-free diagnostics.
- Crash recovery + safe mode.
- OCR performance profiling and model benchmarks.
