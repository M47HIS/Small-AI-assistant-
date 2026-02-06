"use client";

import Link from "next/link";
import { track } from "@vercel/analytics";

type CheckoutButtonProps = {
  className?: string;
  label?: string;
  source: string;
};

export function CheckoutButton({ className, label = "Buy RightKey", source }: CheckoutButtonProps) {
  return (
    <Link
      href="/buy"
      className={className}
      onClick={() => {
        track("checkout_started", { source });
      }}
    >
      {label}
    </Link>
  );
}
