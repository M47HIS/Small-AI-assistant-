import { NextResponse } from "next/server";

export function GET(request: Request) {
  const checkoutUrl = process.env.LEMONSQUEEZY_CHECKOUT_URL;

  if (!checkoutUrl) {
    const url = new URL("/pricing?checkout=missing", request.url);
    return NextResponse.redirect(url);
  }

  return NextResponse.redirect(checkoutUrl);
}
