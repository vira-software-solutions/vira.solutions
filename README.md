# Vira Solutions Website

Personal website - check it out! https://vira.solutions

## Deployment Options

This site supports two deployment methods:

### Option 1: Self-Hosted (Alpine Container) - Primary
The `public/` folder is committed to the repository so your Alpine container can:
1. Pull the repository
2. Symlink the `public/` folder
3. Serve the static files

**Simple Workflow (Recommended):**
```bash
# Edit hugo.yaml or content files, then deploy with one command
make deploy
```

The command will:
- Update submodules automatically
- Build Hugo site
- Show you the changes
- Prompt for commit message
- Push to remote

Your Alpine container will pull the updated `public/` folder automatically.

**Other useful commands:**
```bash
make build    # Just build, no commit
make serve    # Local preview server
make clean    # Remove generated files
make help     # Show all available commands
```

### Option 2: GitHub Pages (Optional)
GitHub Actions can also automatically deploy to GitHub Pages on every push.

**Note:** GitHub Pages will serve from `https://vira-software-solutions.github.io/vira.solutions/` (with subpath). The workflow automatically adjusts the baseURL to match this.

**To enable:**
1. Go to repository Settings → Pages
2. Source: Select GitHub Actions

Then simply push changes - no manual build needed.

## Quick Content Updates

### Update Personal Information
Edit `hugo.yaml` to modify:
- Hero section (intro, title, subtitle)
- About section
- Experience entries
- Education entries
- Social links

### View Build Status
Check the Actions tab on GitHub to see deployment progress and logs.

## Local Development

If you want to preview changes locally:

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/vira-software-solutions/vira.solutions.git

# Or if already cloned, pull submodules
git submodule update --init --recursive

# Run local server
hugo server -D

# View at http://localhost:1313
```

### Force Rebuild (if needed)
```bash
# Clear cache and rebuild
hugo server --ignoreCache --disableFastRender
```

## Theme

Uses [hugo-profile](https://github.com/gurusabarish/hugo-profile) theme as a git submodule.

## One-Time GitHub Pages Setup

To enable GitHub Pages deployment, you need to configure it once in your repository:

1. Go to your GitHub repository settings
2. Navigate to Pages (under "Code and automation")
3. Under Build and deployment:
   - Source: Select GitHub Actions
4. Save the settings

That's it! Future pushes will automatically deploy.

## License

See theme license in `themes/hugo-profile/LICENSE`
