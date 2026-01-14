# Quick Start Guide

## Step 1: Check Node Version
```bash
node --version
```

**If you see v18.x, v20.x, v24.x, or higher**, you need to downgrade to Node 16:
```bash
# Install nvm (if not installed)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Restart terminal, then:
nvm install 16
nvm use 16
node --version  # Should show v16.x.x
```

## Step 2: Install Dependencies
```bash
npm install --legacy-peer-deps
```

## Step 3: Create Environment File
```bash
# Run the setup script
./create-env.sh

# Or manually create .env file with:
echo "REACT_APP_API_URL=http://localhost:8000" > .env
```

## Step 4: Start the App
```bash
npm start
```

The app will open at `http://localhost:3000`

## Common Issues

### "SyntaxError: Unexpected end of input" or similar errors
→ You're using Node 18+. Switch to Node 16 using nvm (see Step 1).

### API calls failing
→ This is expected if you don't have a backend. The UI will still load, but features requiring backend won't work.

### Port 3000 already in use
→ Use a different port: `PORT=3001 npm start`

For more details, see [SETUP.md](./SETUP.md)

