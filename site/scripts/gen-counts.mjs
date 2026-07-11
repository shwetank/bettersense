// Generates src/data/counts.json from the plugin source of truth so the site
// never states a skill/agent count that drifts from what actually ships.
import { readdirSync, statSync, existsSync, mkdirSync, writeFileSync } from "node:fs";
import { join, dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const siteRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const pluginRoot = resolve(siteRoot, "..", "plugin");

const skills = readdirSync(join(pluginRoot, "skills")).filter((name) => {
  const dir = join(pluginRoot, "skills", name);
  return statSync(dir).isDirectory() && existsSync(join(dir, "SKILL.md"));
}).length;

const agents = readdirSync(join(pluginRoot, "agents")).filter((name) =>
  name.endsWith(".md")
).length;

const out = join(siteRoot, "src", "data", "counts.json");
mkdirSync(dirname(out), { recursive: true });
writeFileSync(out, JSON.stringify({ skills, agents }, null, 2) + "\n");
console.log(`counts.json: ${skills} skills, ${agents} agents`);
