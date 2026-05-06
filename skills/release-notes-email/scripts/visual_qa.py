#!/usr/bin/env python3
"""
Visual QA for release notes HTML emails.
Renders the HTML in headless Chromium at both desktop (600px) and mobile (375px) widths,
captures full-page screenshots, and outputs them for Claude to inspect.

Usage:
    python visual_qa.py <path-to-html> [output-dir]

Output:
    {output-dir}/desktop_screenshot.png  — 600px wide (email width)
    {output-dir}/mobile_screenshot.png   — 375px wide (mobile check)
"""

import sys
import os
from pathlib import Path


def capture_screenshots(html_path: str, output_dir: str = None):
    """Render HTML and capture desktop + mobile screenshots."""
    from playwright.sync_api import sync_playwright

    html_path = Path(html_path).resolve()
    if not html_path.exists():
        print(f"Error: HTML file not found: {html_path}")
        sys.exit(1)

    if output_dir is None:
        output_dir = html_path.parent
    else:
        output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    file_url = f"file://{html_path}"

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)

        # Desktop screenshot (600px — email container width)
        print("Capturing desktop screenshot (600px)...")
        desktop_page = browser.new_page(viewport={"width": 700, "height": 800})
        desktop_page.goto(file_url, wait_until="networkidle")
        desktop_page.wait_for_timeout(2000)  # Wait for fonts to load
        desktop_path = output_dir / "desktop_screenshot.png"
        desktop_page.screenshot(path=str(desktop_path), full_page=True)
        print(f"  Saved: {desktop_path}")
        desktop_page.close()

        # Mobile screenshot (375px — iPhone width)
        print("Capturing mobile screenshot (375px)...")
        mobile_page = browser.new_page(viewport={"width": 375, "height": 800})
        mobile_page.goto(file_url, wait_until="networkidle")
        mobile_page.wait_for_timeout(2000)
        mobile_path = output_dir / "mobile_screenshot.png"
        mobile_page.screenshot(path=str(mobile_path), full_page=True)
        print(f"  Saved: {mobile_path}")
        mobile_page.close()

        browser.close()

    print("\nVisual QA screenshots ready for inspection.")
    print(f"  Desktop: {desktop_path}")
    print(f"  Mobile:  {mobile_path}")
    return str(desktop_path), str(mobile_path)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python visual_qa.py <path-to-html> [output-dir]")
        sys.exit(1)

    html_file = sys.argv[1]
    out_dir = sys.argv[2] if len(sys.argv) > 2 else None
    capture_screenshots(html_file, out_dir)
