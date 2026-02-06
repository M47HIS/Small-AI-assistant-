import { createHmac, timingSafeEqual } from "crypto";

export function verifyLemonSignature(rawBody: string, signature: string | null, secret: string): boolean {
  if (!signature || !secret) return false;

  const digest = createHmac("sha256", secret).update(rawBody, "utf8").digest("hex");
  const a = Buffer.from(digest, "utf8");
  const b = Buffer.from(signature, "utf8");

  if (a.length !== b.length) return false;
  return timingSafeEqual(a, b);
}

type LemonMeta = {
  event_name?: string;
  custom_data?: Record<string, unknown>;
};

type LemonData = {
  id?: string;
  attributes?: {
    order_number?: number;
    total?: number;
    currency?: string;
    user_email?: string;
  };
};

export type LemonWebhookPayload = {
  meta?: LemonMeta;
  data?: LemonData;
};
