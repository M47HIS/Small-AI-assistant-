import Link from "next/link";

export default function DocsPage() {
  return (
    <section className="rk-shell rk-page">
      <p className="rk-eyebrow">Docs</p>
      <h1>Implementation Docs</h1>
      <div className="rk-grid-2">
        <article className="rk-card">
          <h2>Setup</h2>
          <p>Install RightKey, choose a model, and set your global hotkey.</p>
        </article>
        <article className="rk-card">
          <h2>Model Runtime</h2>
          <p>RightKey uses local llama.cpp runtime with single-model-in-RAM behavior.</p>
        </article>
      </div>
      <p className="rk-inline-cta">
        Need compliance context? <Link href="/security">Open security page</Link>.
      </p>
    </section>
  );
}
