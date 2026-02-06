# Website Roadmap (RightKey)

## Assumptions
- Goal is to sell a macOS app with local-only inference as the primary differentiator.
- Target launch uses a single-page marketing site plus checkout.
- Deployment on Vercel with a Next.js app.
- Payments and license delivery handled by Lemon Squeezy.
- Entry pricing: Personal license at `EUR 5` (one-time).

## Objectives
- Convert high-intent visitors into paid users fast.
- Prove local-only privacy and tiny RAM footprint visually.
- Keep the funnel minimal: Landing -> Pricing -> Checkout -> Download.
- Make privacy and security the primary differentiation (for sensitive users).

## Phase 0 - Strategy (1-2 days)
- Define ICP and primary promise (privacy-first hotkey assistant).
- Decide pricing tiers and licensing model (personal, team).
- Gather 3-5 screenshots or a 20s demo capture.
- Draft the core narrative: Problem -> Local-first solution -> Proof -> CTA.

## Phase 1 - MVP Marketing Site (3-5 days)
- Sections: Hero + primary CTA, Problem and outcomes, How it works, Proof, Pricing summary, FAQ.
- Design: Space Grotesk headlines, Instrument Sans body, slate base with teal accent, warm off-white background, gradient halo + device mock + simple charts.
- Assets: 2-3 product screenshots, 1 short demo GIF or MP4, privacy and local-only badges.
- Messaging: "Fully local. No cloud. No data leaves your Mac." with a security-first proof block.

## Phase 2 - Commerce + License Delivery (3-4 days)
- Lemon Squeezy setup: SKU, pricing, license key delivery, tax handling.
- Checkout integration: buy buttons and a dedicated /buy redirect.
- Post-purchase: `/thank-you` page with download + license instructions, receipt email with license key.
- Webhook intake: `/api/lemonsqueezy/webhook` with signature verification.
- Analytics: Vercel Analytics and one conversion event.

## Phase 3 - Trust + SEO (3-5 days)
- Pages: /pricing, /privacy, /terms, /docs, /changelog.
- Proof: benchmarks page for cold start, idle RAM, and model sizes.
- Trust: add a short security page covering data flows, threat model summary, and what is *not* collected.
- SEO pages: local macOS assistant, hotkey AI assistant, offline LLM mac.

## Phase 4 - Growth (ongoing)
- Content: 1 blog post per week for 4 weeks.
- Launch: Product Hunt, Hacker News, X/Twitter.
- Monetization: Lemon Squeezy referral codes and team-plan waitlist capture.

## Vercel Execution Plan
- Repo structure: /website/web (Next.js), /packages/ui (optional shared components).
- Core routes: /, /pricing, /buy, /download, /security, /docs, /privacy, /terms, /changelog.
- Commerce routes: /thank-you, /api/lemonsqueezy/webhook.
- Env vars: LEMONSQUEEZY_STORE_ID, LEMONSQUEEZY_PRODUCT_ID, LEMONSQUEEZY_CHECKOUT_URL.
- Vercel settings: custom domain + SSL, preview deployments for PRs, analytics enabled.

## MVP File Map (Next.js)
- website/web/app/page.tsx
- website/web/app/pricing/page.tsx
- website/web/app/buy/route.ts
- website/web/app/download/page.tsx
- website/web/app/security/page.tsx
- website/web/app/privacy/page.tsx
- website/web/app/terms/page.tsx
- website/web/app/docs/page.tsx
- website/web/app/changelog/page.tsx
- website/web/app/globals.css
- website/web/components/Nav.tsx
- website/web/components/Footer.tsx
- website/web/components/Section.tsx
- website/web/components/MetricStrip.tsx

## KPIs
- Landing page conversion to checkout: 3-7%.
- Checkout completion: 40-60%.
- Download click-through post-purchase: >80%.

## Risks
- Licensing and delivery friction.
- Insufficient proof of performance.
- Privacy claims not evidenced enough for security-sensitive buyers.

## Next Actions
- Connect `LEMONSQUEEZY_CHECKOUT_URL` in Vercel project environment variables.
- Replace placeholder legal copy and download URL before public launch.
- Ship a Vercel preview deployment and validate `/buy` redirect + conversion tracking.
