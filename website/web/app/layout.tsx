import type { Metadata } from "next";
import type { ReactNode } from "react";
import { Space_Grotesk, Instrument_Sans } from "next/font/google";
import { Analytics } from "@vercel/analytics/react";
import "./globals.css";
import { Nav } from "../components/Nav";
import { Footer } from "../components/Footer";

const heading = Space_Grotesk({
  subsets: ["latin"],
  variable: "--font-heading"
});

const body = Instrument_Sans({
  subsets: ["latin"],
  variable: "--font-body"
});

export const metadata: Metadata = {
  title: "RightKey | Private AI For macOS",
  description:
    "RightKey is a local-first macOS hotkey assistant. Prompts stay on-device. No cloud inference.",
  metadataBase: new URL("https://rightkey.app")
};

export default function RootLayout({
  children
}: Readonly<{
  children: ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${heading.variable} ${body.variable}`}>
        <div className="rk-bg" aria-hidden>
          <div className="rk-glow rk-glow-a" />
          <div className="rk-glow rk-glow-b" />
        </div>
        <Nav />
        <main>{children}</main>
        <Footer />
        <Analytics />
      </body>
    </html>
  );
}
