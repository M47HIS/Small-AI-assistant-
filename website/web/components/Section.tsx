import type { ReactNode } from "react";

type SectionProps = {
  id?: string;
  eyebrow?: string;
  title: string;
  children: ReactNode;
};

export function Section({ id, eyebrow, title, children }: SectionProps) {
  return (
    <section id={id} className="rk-section">
      <div className="rk-shell">
        {eyebrow ? <p className="rk-eyebrow">{eyebrow}</p> : null}
        <h2>{title}</h2>
        {children}
      </div>
    </section>
  );
}
