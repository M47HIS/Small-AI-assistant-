# RightKey Web

Marketing and checkout site for RightKey.
Current public entry price target: `EUR 5` one-time (Personal).

## Stack
- Next.js App Router
- Vercel deployment target
- Lemon Squeezy checkout redirect via `/buy`

## Local setup
1. `cd website/web`
2. `cp .env.example .env.local`
3. Set `LEMONSQUEEZY_CHECKOUT_URL`
4. `npm install`
5. `npm run dev`
6. `npm run lint && npm run build`

## Required env vars
- `LEMONSQUEEZY_STORE_ID`
- `LEMONSQUEEZY_PRODUCT_ID`
- `LEMONSQUEEZY_CHECKOUT_URL`
- `LEMONSQUEEZY_WEBHOOK_SECRET`

## Routes
- `/`
- `/pricing`
- `/buy` (server redirect to Lemon Squeezy)
- `/thank-you`
- `/download`
- `/security`
- `/privacy`
- `/terms`
- `/docs`
- `/changelog`

## Webhook endpoint
- `POST /api/lemonsqueezy/webhook`
- Verifies `x-signature` using `LEMONSQUEEZY_WEBHOOK_SECRET`
- Currently logs `order_created` metadata for integration testing

## Notes
- Fonts are resolved from local system stacks to keep builds offline-friendly.
- ESLint is preconfigured (`eslint.config.mjs`) for non-interactive local and CI runs.
