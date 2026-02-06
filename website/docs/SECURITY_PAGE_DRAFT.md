# Security & Privacy (Draft)

## Summary
RightKey is fully local by design. Prompts and model outputs stay on your Mac. There is no cloud inference and no background indexing. Network access is used only when you download models.

## Data Flow (What Happens When You Use RightKey)
1. You press the hotkey to open the overlay.
2. RightKey reads the current clipboard and frontmost app name/title.
3. A prompt is built locally and sent to the local model runtime.
4. The model response is streamed back into the overlay.
5. The model unloads after idle (default 90s) to keep memory low.

## What We Collect
- Nothing by default. No telemetry, no user tracking, no cloud logs.

## What We Store Locally
- Downloaded model files in `~/Library/Application Support/RightKey/Models` by default (or `RIGHTKEY_MODELS_DIR` if set).
- User preferences (hotkey, model selection, runtime settings).

## What We Never Do
- No cloud inference.
- No uploading prompts, responses, or clipboard data.
- No background filesystem indexing.
- No third-party analytics by default.

## Network Access
- Only for downloading models from Hugging Face or other configured sources.
- Optional: access to llama.cpp tooling for conversion when you enable it.

## Threat Model (Short)
- Target users: security-sensitive teams and individuals who cannot send data to third-party AI services.
- Primary risk: accidental data exfiltration. RightKey mitigates this by keeping all inference local and limiting context to explicit user actions.
- Secondary risk: supply-chain issues from model downloads. Mitigation: models are fetched only when requested, from known sources.

## Verification Ideas (Optional)
- Include a local-only verification screenshot or short video.
- Publish a simple “data map” diagram showing all flows stay on-device.
- Offer a CLI flag that logs network requests (should show only model downloads).

## FAQ
**Does RightKey send my data to the cloud?**
No. Inference runs locally. Prompts and responses never leave your Mac.

**What data does RightKey capture?**
Only the clipboard and frontmost app name/title while the overlay is active.

**Can I use RightKey in an air‑gapped environment?**
Yes, once models are downloaded. You can also set a local model directory using `RIGHTKEY_MODELS_DIR`.
