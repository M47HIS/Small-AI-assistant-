import Link from "next/link";
import { CheckoutButton } from "./CheckoutButton";

const links = [
  { href: "/pricing", label: "Pricing" },
  { href: "/security", label: "Security" },
  { href: "/docs", label: "Docs" }
];

export function Nav() {
  return (
    <header className="rk-shell rk-nav-wrap">
      <nav className="rk-nav" aria-label="Primary">
        <Link href="/" className="rk-logo">
          <span className="rk-logo-mark" aria-hidden>
            RK
          </span>
          RightKey
        </Link>
        <div className="rk-links">
          {links.map((link) => (
            <Link key={link.href} href={link.href}>
              {link.label}
            </Link>
          ))}
          <CheckoutButton className="rk-btn rk-btn-primary" label="Buy Now" source="nav" />
        </div>
      </nav>
    </header>
  );
}
