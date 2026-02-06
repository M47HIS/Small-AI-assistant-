export default function PrivacyPage() {
  return (
    <section className="rk-shell rk-page">
      <p className="rk-eyebrow">Privacy Policy</p>
      <h1>Privacy Overview</h1>
      <p>
        RightKey processes prompts locally on your device. We do not run cloud inference for user prompts and do not
        collect prompt content by default.
      </p>
      <h2>Data Processed Locally</h2>
      <ul>
        <li>Clipboard content while overlay is active</li>
        <li>Frontmost application name/title while overlay is active</li>
        <li>User settings and local model files</li>
      </ul>
      <h2>Data Shared Externally</h2>
      <p>Only payment and licensing metadata required by Lemon Squeezy during checkout and license delivery.</p>
    </section>
  );
}
