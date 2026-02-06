const metrics = [
  { value: "0", label: "Cloud inference requests" },
  { value: "< 1 GB", label: "RAM while model is loaded" },
  { value: "~0 MB", label: "Idle footprint after unload" }
];

export function MetricStrip() {
  return (
    <div className="rk-metrics" role="list" aria-label="Key metrics">
      {metrics.map((metric) => (
        <article key={metric.label} role="listitem" className="rk-metric-card">
          <p className="rk-metric-value">{metric.value}</p>
          <p className="rk-metric-label">{metric.label}</p>
        </article>
      ))}
    </div>
  );
}
