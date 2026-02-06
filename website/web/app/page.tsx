import Link from "next/link";
import { CheckoutButton } from "../components/CheckoutButton";
import { MetricStrip } from "../components/MetricStrip";
import { Section } from "../components/Section";

const features = [
  {
    title: "Fully Local Inference",
    body: "Prompts and responses stay on your Mac. RightKey does not route chat requests through cloud models."
  },
  {
    title: "Fast Hotkey Workflow",
    body: "Press your shortcut, get a focused top-right chat bar, and stream answers without context switching."
  },
  {
    title: "Tiny Memory Strategy",
    body: "One model in RAM at a time with idle unload to keep footprint low when you are not actively using it."
  }
];

const steps = [
  "Open RightKey with your global hotkey.",
  "RightKey captures clipboard and frontmost app context only while active.",
  "A local model generates and streams output.",
  "Model unloads after idle to return memory to near-zero."
];

export default function HomePage() {
  return (
    <>
      <section className="rk-hero rk-shell">
        <p className="rk-eyebrow">Built for Security-Sensitive Teams</p>
        <h1>Private AI at Hotkey Speed.</h1>
        <p className="rk-lead">
          RightKey is the macOS assistant for sensitive workflows. Fully local inference. No cloud relay. No hidden
          telemetry.
        </p>
        <div className="rk-hero-actions">
          <CheckoutButton className="rk-btn rk-btn-primary" label="Buy RightKey" source="home_hero" />
          <Link href="/security" className="rk-btn rk-btn-ghost">
            Review Security Model
          </Link>
        </div>
        <MetricStrip />
      </section>

      <Section id="features" eyebrow="Differentiation" title="Privacy Is The Product">
        <div className="rk-grid-3">
          {features.map((feature) => (
            <article key={feature.title} className="rk-card">
              <h3>{feature.title}</h3>
              <p>{feature.body}</p>
            </article>
          ))}
        </div>
      </Section>

      <Section id="how" eyebrow="System" title="How RightKey Works">
        <ol className="rk-steps">
          {steps.map((step) => (
            <li key={step}>{step}</li>
          ))}
        </ol>
      </Section>

      <Section id="proof" eyebrow="Proof" title="Security-First Proof Pack">
        <div className="rk-grid-2">
          <article className="rk-card">
            <h3>Data Boundary</h3>
            <p>
              Data remains on-device for inference. Network access is only used when you explicitly download models.
            </p>
          </article>
          <article className="rk-card">
            <h3>Operational Simplicity</h3>
            <p>
              Local runtime and deterministic model selection reduce third-party risk and simplify security review.
            </p>
          </article>
        </div>
        <p className="rk-inline-cta">
          Need details for procurement and IT review? <Link href="/security">Open the full security page</Link>.
        </p>
      </Section>

      <Section id="pricing" eyebrow="Purchase" title="Simple Commercial Model">
        <div className="rk-grid-2">
          <article className="rk-price-card">
            <p className="rk-price-name">Personal</p>
            <p className="rk-price-value">EUR 5</p>
            <p className="rk-price-period">one-time</p>
            <p>Single-user license with private local inference.</p>
            <CheckoutButton className="rk-btn rk-btn-primary" label="Start Checkout" source="home_pricing" />
          </article>
          <article className="rk-card">
            <h3>Team Plan</h3>
            <p>Volume licensing and onboarding support for security-sensitive teams.</p>
            <p>Contact: founders@rightkey.app</p>
          </article>
        </div>
      </Section>
    </>
  );
}
