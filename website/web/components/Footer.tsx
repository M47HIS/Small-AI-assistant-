import Link from "next/link";

export function Footer() {
  return (
    <footer className="rk-shell rk-footer">
      <p>RightKey. Private AI assistant for macOS.</p>
      <div>
        <Link href="/privacy">Privacy</Link>
        <Link href="/terms">Terms</Link>
        <Link href="/changelog">Changelog</Link>
      </div>
    </footer>
  );
}
