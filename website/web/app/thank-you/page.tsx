import Link from "next/link";

export default function ThankYouPage() {
  return (
    <section className="rk-shell rk-page">
      <p className="rk-eyebrow">Purchase Complete</p>
      <h1>Thank You</h1>
      <p>
        Your payment was received through Lemon Squeezy. You should receive your license key by email. Keep that email
        for future activations.
      </p>
      <div className="rk-grid-2">
        <article className="rk-card">
          <h2>Next Step 1</h2>
          <p>Download the app and install RightKey on macOS.</p>
          <Link href="/download">Open download instructions</Link>
        </article>
        <article className="rk-card">
          <h2>Next Step 2</h2>
          <p>Enter your license key inside the app to activate your seat.</p>
          <p>Support: founders@rightkey.app</p>
        </article>
      </div>
      <p className="rk-inline-cta">
        If you do not receive your key, contact support with your order email and order number.
      </p>
    </section>
  );
}
