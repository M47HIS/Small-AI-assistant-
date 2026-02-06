# RightKey

Menu-bar macOS hotkey assistant with tiny local models. It opens a top-right chat bar, streams responses, and keeps one model in RAM at a time with idle unload.

## Product Goals
- Global hotkey opens a minimal UI overlay.
- Local LLM with fast cold-start and low idle memory.
- Better answers from local context, including real-time on-screen OCR/vision context.

## Permanent Constraints
- No cloud inference at any point.
- No browser automation features.
- No deep filesystem indexing/background crawling.

## Current Scope (Implemented)
- Menu-bar app with customizable hotkey.
- Top-right chat bar with model dropdown + settings.
- First-run model download flow.
- Context capture: clipboard + frontmost app name/title.
- Model switching with single-model-in-RAM behavior.
- Idle unload after 90 seconds.

## Next Scope (Priority)
- Real-time on-screen context capture (OCR/vision), processed locally.
- User-controlled capture source (active screen/window/region).
- Prompt enrichment from OCR text + current app context.
- Capture safeguards (only while active, visible status, quick pause toggle).

## Models
- Built-in catalog: Phi-1.5 Q4, TinyLlama 1.1B Q4, Phi-1.5 HF base (auto-converted).
- Managed from Preferences (download, use, delete).
- Stored at `~/Library/Application Support/RightKey/Models`.
- Only one model loaded in RAM at a time.

## Runtime
- Requires the `llama.cpp` CLI (`llama-cli` or `llama`) on your PATH.
- Install: `brew install llama.cpp` or set `LLAMA_BIN` to the CLI path.
- You can also set the binary path in Preferences.
- Hugging Face downloads may require `HF_TOKEN` if the model is gated.
- Conversion requires `convert_hf_to_gguf.py` and `llama-quantize` (from llama.cpp).
- Set `LLAMA_CONVERT_PATH` or `LLAMA_QUANTIZE_BIN` if they are not auto-detected.
- Set `PYTHON_BIN` to a python3 with transformers/torch/safetensors installed.
- For best performance, enable the persistent server and GPU layers in Preferences.

## Architecture Sketch
- Hotkey manager -> overlay controller.
- Context collector (clipboard/app/ocr) -> prompt builder.
- Model manager -> runtime backend -> response stream.
- Chat bar UI -> response display + preferences.

## Memory Strategy
- Load model on demand, unload after 90s idle.
- One active model at a time (per selection).
- Small context window and conservative batch sizes.

## Usage
- Default hotkey: Option+Space (customizable in Preferences).
- Use the model menu or menu bar item for Preferences.

## Setup
- Open `Package.swift` in Xcode 15+ and run the app.
- Tests: `swift test`.

## Status
- Llama.cpp GGUF flow + HF conversion are supported.
- OCR/vision screen-context capture is planned and prioritized.

## Security & Privacy
- Local inference only.
- Network access only for model download and setup.
- Context capture is user-scoped and should run only while assistant capture is active.
- No deep filesystem indexing.
