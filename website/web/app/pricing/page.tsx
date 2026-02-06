import Link from "next/link";
import { CheckoutButton } from "../../components/CheckoutButton";

export default function PricingPage() {
  return (
    <section className="rk-shell rk-page">
      <p className="rk-eyebrow">Pricing</p>
      <h1>Choose Your License</h1>
      <div className="rk-grid-2">
        <article className="rk-price-card">
          <p className="rk-price-name">Personal</p>
          <p className="rk-price-value">EUR 5</p>
          <p className="rk-price-period">one-time payment</p>
          <ul>
            <li>1 macOS user</li>
            <li>Fully local inference</li>
            <li>Model manager + updates</li>
          </ul>
          <CheckoutButton
            className="rk-btn rk-btn-primary"
            label="Checkout With Lemon Squeezy"
            source="pricing_primary"
          />
        </article>
        <article className="rk-card">
          <h2>Team</h2>
          <p>Custom seat bundles, rollout support, and centralized billing.</p>
          <p>Email founders@rightkey.app for quote and onboarding timeline.</p>
        </article>
      </div>
      <p className="rk-inline-cta">
        Need security validation first? <Link href="/security">Review security and privacy details</Link>.
      </p>
    </section>
  );
}
