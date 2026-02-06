import { NextResponse } from "next/server";
import { verifyLemonSignature, type LemonWebhookPayload } from "../../../../lib/lemonsqueezy";

export async function POST(request: Request) {
  const secret = process.env.LEMONSQUEEZY_WEBHOOK_SECRET;
  if (!secret) {
    return NextResponse.json({ error: "missing_webhook_secret" }, { status: 500 });
  }

  const signature = request.headers.get("x-signature");
  const rawBody = await request.text();

  if (!verifyLemonSignature(rawBody, signature, secret)) {
    return NextResponse.json({ error: "invalid_signature" }, { status: 401 });
  }

  let payload: LemonWebhookPayload;
  try {
    payload = JSON.parse(rawBody) as LemonWebhookPayload;
  } catch {
    return NextResponse.json({ error: "invalid_json" }, { status: 400 });
  }

  const eventName = payload.meta?.event_name ?? "unknown";

  if (eventName === "order_created") {
    const orderId = payload.data?.id;
    const email = payload.data?.attributes?.user_email;
    const currency = payload.data?.attributes?.currency;
    const total = payload.data?.attributes?.total;

    console.log("[lemonsqueezy] order_created", {
      orderId,
      email,
      currency,
      total
    });
  }

  return NextResponse.json({ ok: true });
}
