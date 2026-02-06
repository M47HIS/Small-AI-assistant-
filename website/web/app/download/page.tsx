import Link from "next/link";

export default function DownloadPage() {
  return (
    <section className="rk-shell rk-page">
      <p className="rk-eyebrow">Download</p>
      <h1>Install RightKey</h1>
      <p>
        This page is intended for post-purchase delivery. Replace the placeholders with signed binaries and activation
        instructions.
      </p>
      <div className="rk-grid-2">
        <article className="rk-card">
          <h2>Step 1</h2>
          <p>Download the macOS app bundle.</p>
          <p>
            Placeholder: <code>https://downloads.rightkey.app/latest/RightKey.dmg</code>
          </p>
        </article>
        <article className="rk-card">
          <h2>Step 2</h2>
          <p>Open RightKey and enter your Lemon Squeezy license key.</p>
          <p>Keep your license email for future activations.</p>
        </article>
      </div>
      <p className="rk-inline-cta">
        Missing your key? Contact founders@rightkey.app from your purchase email address.
      </p>
      <Link href="/" className="rk-btn rk-btn-ghost">
        Back to Home
      </Link>
    </section>
  );
}
