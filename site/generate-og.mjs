/**
 * Generates site/public/og-image.png (1200×630)
 * Run from the site/ directory: node generate-og.mjs
 */

import sharp from 'sharp';
import { writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import path from 'path';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const OUT = path.join(__dirname, 'public', 'og-image.png');

// ─── Design tokens (mirrors index.astro) ──────────────────────────────────────
const BG       = '#111110';
const BG_CARD  = '#181614';
const BORDER   = '#252220';
const TEXT     = '#d4c9bf';
const TEXT_HEAD= '#f4ede4';
const TEXT_DIM = '#8a7e74';
const ACCENT   = '#c9a46e';
const ACCENT_LO= '#2a1f0e';
const FONT     = `-apple-system, BlinkMacSystemFont, 'Helvetica Neue', Helvetica, Arial, sans-serif`;

// ─── Layout ───────────────────────────────────────────────────────────────────
const W = 1200, H = 630;
const CX = W / 2;

// ─── SVG ──────────────────────────────────────────────────────────────────────
const svg = /* xml */ `
<svg width="${W}" height="${H}" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- Warm radial glow from top-center, mirrors the hero section -->
    <radialGradient id="glow" cx="50%" cy="0%" r="70%" gradientUnits="userSpaceOnUse"
                    gradientTransform="scale(1, 0.55) translate(0, 0)">
      <stop offset="0%"   stop-color="${ACCENT}" stop-opacity="0.13"/>
      <stop offset="100%" stop-color="${BG}"      stop-opacity="0"/>
    </radialGradient>

    <!-- Dot-grid texture -->
    <pattern id="dots" x="0" y="0" width="40" height="40" patternUnits="userSpaceOnUse">
      <circle cx="0.5" cy="0.5" r="0.9" fill="${ACCENT}" opacity="0.18"/>
    </pattern>

    <!-- Clip for rounded-rect logo badge -->
    <clipPath id="badge-clip">
      <rect x="${CX - 34}" y="118" width="68" height="68" rx="13"/>
    </clipPath>
  </defs>

  <!-- ── Base background ── -->
  <rect width="${W}" height="${H}" fill="${BG}"/>

  <!-- ── Dot grid (full canvas, subtle) ── -->
  <rect width="${W}" height="${H}" fill="url(#dots)"/>

  <!-- ── Warm glow overlay ── -->
  <ellipse cx="${CX}" cy="-30" rx="700" ry="380" fill="${ACCENT}" opacity="0.07"/>
  <ellipse cx="${CX}" cy="-30" rx="460" ry="260" fill="${ACCENT}" opacity="0.06"/>

  <!-- ── Thin outer border ── -->
  <rect x="1" y="1" width="${W - 2}" height="${H - 2}" rx="0"
        fill="none" stroke="${BORDER}" stroke-width="1.5"/>

  <!-- ── Logo badge ── -->
  <rect x="${CX - 34}" y="118" width="68" height="68" rx="13"
        fill="${BG_CARD}" stroke="${ACCENT}" stroke-width="1.5" stroke-opacity="0.45"/>
  <text x="${CX}" y="170"
        font-family="${FONT}" font-size="36" font-weight="700"
        fill="${ACCENT}" text-anchor="middle">b</text>

  <!-- ── "bettersense" wordmark ── -->
  <text x="${CX}" y="318"
        font-family="${FONT}"
        font-size="94" font-weight="700"
        fill="${TEXT_HEAD}" text-anchor="middle"
        letter-spacing="-3">bettersense</text>

  <!-- ── Tagline line 1 ── -->
  <text x="${CX}" y="366"
        font-family="${FONT}"
        font-size="26" font-weight="500"
        fill="${ACCENT}" text-anchor="middle"
        letter-spacing="-0.3">Claude Plugin for AI PMs, Engineering Managers &amp; Senior ICs</text>

  <!-- ── Thin divider ── -->
  <line x1="${CX - 180}" y1="398" x2="${CX + 180}" y2="398"
        stroke="${BORDER}" stroke-width="1"/>

  <!-- ── Role chips ── -->
  <!-- AI PM chip -->
  <rect x="${CX - 302}" y="416" width="84" height="30" rx="6"
        fill="${ACCENT_LO}" stroke="${ACCENT}" stroke-width="1" stroke-opacity="0.35"/>
  <text x="${CX - 260}" y="436"
        font-family="${FONT}" font-size="13" font-weight="600"
        fill="${ACCENT}" text-anchor="middle">AI PM</text>

  <!-- Engineering Manager chip -->
  <rect x="${CX - 200}" y="416" width="204" height="30" rx="6"
        fill="${ACCENT_LO}" stroke="${ACCENT}" stroke-width="1" stroke-opacity="0.35"/>
  <text x="${CX - 98}" y="436"
        font-family="${FONT}" font-size="13" font-weight="600"
        fill="${ACCENT}" text-anchor="middle">Engineering Manager</text>

  <!-- Senior IC chip -->
  <rect x="${CX + 22}" y="416" width="100" height="30" rx="6"
        fill="${ACCENT_LO}" stroke="${ACCENT}" stroke-width="1" stroke-opacity="0.35"/>
  <text x="${CX + 72}" y="436"
        font-family="${FONT}" font-size="13" font-weight="600"
        fill="${ACCENT}" text-anchor="middle">Senior IC</text>

  <!-- TPM chip -->
  <rect x="${CX + 140}" y="416" width="70" height="30" rx="6"
        fill="${ACCENT_LO}" stroke="${ACCENT}" stroke-width="1" stroke-opacity="0.35"/>
  <text x="${CX + 175}" y="436"
        font-family="${FONT}" font-size="13" font-weight="600"
        fill="${ACCENT}" text-anchor="middle">TPM</text>

  <!-- ── URL ── -->
  <text x="${CX}" y="554"
        font-family="${FONT}" font-size="19" font-weight="500"
        fill="${TEXT_DIM}" text-anchor="middle"
        letter-spacing="0.5">bettersense.ai</text>
</svg>
`.trim();

// ─── Render ───────────────────────────────────────────────────────────────────
await sharp(Buffer.from(svg))
  .png()
  .toFile(OUT);

console.log(`✓ OG image written to ${OUT}`);
