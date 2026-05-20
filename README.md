# tf-report

A single-file bash script that turns `terraform plan` output into a clean, interactive HTML report.

![tf-report screenshot](screenshot.png)

## Features

- Color-coded resource changes (create, update, destroy, replace)
- Collapsible diff view per resource
- Search and filter by action type
- Keyboard shortcuts (`e` expand all, `c` collapse all, `/` search)
- Auto-opens in browser
- CI mode for GitHub Actions / GitLab CI

## Install

Clone and symlink:

```bash
git clone https://github.com/mohsendehbashi/terraform-report.git
ln -s "$(pwd)/terraform-report/tf-report" /usr/local/bin/tf-report
```

## Usage

```bash
# Plan and generate report
terraform plan -out plan.tfplan | tf-report

# Then apply
terraform apply plan.tfplan
```

You can also specify an output path:

```bash
terraform plan -out plan.tfplan | tf-report report.html
```

### CI Mode

Use `--ci` to suppress auto-opening the browser and output a clean path for scripting:

```bash
terraform plan -no-color | tf-report --ci report.html
# Output: report_path=report.html
```

## GitHub Actions Integration

The included workflow (`.github/workflows/terraform-report.yml`) automatically:

1. Runs `terraform plan` on PRs that modify `.tf` files
2. Generates an interactive HTML report
3. Deploys to GitHub Pages under `pr-{number}/`
4. Posts a PR comment with stats and a link to the report

### Setup

1. Enable GitHub Pages in your repo settings (source: `gh-pages` branch)
2. Grant `pages: write` and `pull-requests: write` permissions to the workflow
3. Copy `.github/workflows/terraform-report.yml` to your repo

The PR comment will look like:

> ## Terraform Plan Report
> | Action | Count |
> |--------|-------|
> | ➕ Add | 3 |
> | ✏️ Change | 2 |
> | ❌ Destroy | 1 |
>
> **Interactive Report:** https://owner.github.io/repo/pr-123/

## How it works

The script reads terraform output from stdin, strips ANSI colors, parses resource changes using awk, and generates a self-contained HTML file. No dependencies beyond bash and standard unix tools.