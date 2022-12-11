const { resolve } = require("path");

require("esbuild")
  .build({
    define: { "process.env.NODE_ENV": process.env.NODE_ENV },
    entryPoints: [resolve(__dirname, "src/index.ts")],
    target: "node18",
    platform: "node",
    outfile: resolve(__dirname, "dist/index.js"),
    bundle: true,
    minify: true,
    sourcemap: true,
  })
  .catch(() => {});
