import Link from "next/link";

const flow = [
  "User opens RightKey with a global hotkey.",
  "RightKey reads clipboard and frontmost app title while overlay is active.",
  "Prompt is processed by a local model runtime on the same machine.",
  "Response streams back to the UI.",
  "Model unloads after idle to minimize memory exposure."
];

const never = [
  "No cloud inference for prompts or outputs.",
  "No prompt upload to third-party APIs.",
  "No background indexing of files.",
  "No analytics SDK collecting user content by default."
];

export default function SecurityPage() {
  return (
    <section className="rk-shell rk-page">
      <p className="rk-eyebrow">Security</p>
      <h1>Private By Architecture</h1>
      <p>
        RightKey is built for sensitive workflows where data boundaries matter. Inference runs on-device, with no cloud
        relay for user prompts.
      </p>

      <div className="rk-grid-2">
        <article className="rk-card">
          <h2>Data Flow</h2>
          <ol className="rk-steps">
            {flow.map((item) => (
              <li key={item}>{item}</li>
            ))}
          </ol>
        </article>
        <article className="rk-card">
          <h2>What We Never Do</h2>
          <ul>
            {never.map((item) => (
              <li key={item}>{item}</li>
            ))}
          </ul>
        </article>
      </div>

      <div className="rk-grid-2">
        <article className="rk-card">
          <h2>Local Storage</h2>
          <p>
            Models are stored under <code>~/Library/Application Support/RightKey/Models</code> by default, or custom
            path via <code>RIGHTKEY_MODELS_DIR</code>.
          </p>
        </article>
        <article className="rk-card">
          <h2>Network Scope</h2>
          <p>Network activity is limited to model download operations initiated by the user.</p>
        </article>
      </div>

      <p className="rk-inline-cta">
        Questions from your security team? Email founders@rightkey.app or <Link href="/docs">open docs</Link>.
      </p>
    </section>
  );
}
