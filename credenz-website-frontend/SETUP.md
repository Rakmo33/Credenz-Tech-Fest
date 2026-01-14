# Credenz Website Frontend - Setup Guide

This is a React-based frontend for a tech fest website created 4-5 years ago. This guide will help you set it up and run it locally.

## ⚠️ IMPORTANT: Node.js Version Requirement

**This project REQUIRES Node.js 14.x or 16.x. Node 18+ or 24+ will NOT work and will cause errors.**

If you have Node 18+ installed, you MUST use `nvm` to switch to Node 16:
```bash
nvm install 16
nvm use 16
```

See the "Troubleshooting" section below for detailed instructions.

## Prerequisites

- **Node.js**: Version 14.x or 16.x (REQUIRED - Node 18+ will NOT work)
  - The project uses `react-scripts 3.4.3` which is incompatible with Node 18+
  - Check your version: `node --version`
  - **If you have Node 18+**: You MUST use `nvm` to switch to Node 14 or 16 (see below)
  - **If you have Node 24+**: The app will fail to start with syntax errors. You MUST downgrade.

- **npm**: Version 6.x or 7.x (comes with Node.js)
  - Check your version: `npm --version`

## Quick Start

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Create Environment File**
   Create a `.env` file in the root directory with:
   ```
   REACT_APP_API_URL=http://localhost:8000
   ```
   > **Note**: Replace `http://localhost:8000` with your actual backend API URL if you have one. If you don't have a backend, see the "Running Without Backend" section below.

3. **Start Development Server**
   ```bash
   npm start
   ```
   The app will open at `http://localhost:3000`

## Important Notes About External Resources

### 1. Backend API (`REACT_APP_API_URL`)
The app makes API calls to a backend server. The following endpoints are used:
- `/signup` - User registration
- `/login` - User authentication
- `/allevents` - Fetch all events
- `/updates` - Fetch updates/announcements
- `/razorpay` - Payment processing
- `/admin/*` - Admin endpoints
- And many more user-specific endpoints

**If you don't have access to the backend:**
- The app will show errors when trying to fetch data
- Authentication/login features won't work
- Event registration won't work
- You can still view the UI and static content

### 2. EmailJS (Feedback Form)
The feedback form uses EmailJS with hardcoded credentials:
- Service ID: `service_3aso73o`
- Template ID: `template_uow41nd`
- User API Key: `user_OPMTdBG3Qp9A9ExXTPv1p`

**If these don't work:**
- The feedback form will fail silently
- You may need to set up your own EmailJS account and update the credentials in `src/Components/ContactComponent/feedback.jsx`

### 3. Payment Gateways
The app uses two payment gateways:
- **Razorpay**: Payment integration (keys may be in backend)
- **Ippopay**: Alternative payment method with hardcoded public key `pk_live_LxGuVR5mwBuy`

**If these don't work:**
- Payment features will fail
- Event registration requiring payment won't complete

### 4. Phone Verification
Some components reference `http://localhost:8000/verify/getcode` for phone verification. This requires a backend service.

## Running Without Backend

If you just want to view the UI without backend functionality:

1. Create `.env` file with:
   ```
   REACT_APP_API_URL=http://localhost:8000
   ```

2. The app will attempt API calls and fail, but you can:
   - View the homepage and static content
   - Navigate through the UI
   - See the design and layout

3. To prevent console errors, you could:
   - Use browser DevTools to ignore network errors
   - Or modify the code to handle missing backend gracefully (see Troubleshooting)

## Troubleshooting

### Issue: `node-sass` installation fails
**Solution**: The project has been updated to use `sass` instead of `node-sass`. If you still see errors:
```bash
npm uninstall node-sass
npm install sass
```

### Issue: `npm install` fails with dependency conflicts
**Solution**: Try installing with legacy peer deps:
```bash
npm install --legacy-peer-deps
```

### Issue: Port 3000 already in use
**Solution**: 
```bash
# Kill the process using port 3000
lsof -ti:3000 | xargs kill -9

# Or use a different port
PORT=3001 npm start
```

### Issue: Build fails with "Module not found" errors
**Solution**: 
```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
```

### Issue: API calls failing (expected if no backend)
**Solution**: This is expected. The app will still run, but features requiring backend won't work. You can:
1. Set up a mock backend using JSON Server
2. Comment out API calls temporarily
3. Add error handling to gracefully handle missing backend

### Issue: Node version too new (18+ or 24+)
**CRITICAL**: This project requires Node 14 or 16. Node 18+ will cause syntax errors and the app won't start.

**Solution**: Use `nvm` to switch to Node 16:
```bash
# Install nvm (if not installed)
# On macOS/Linux:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# On Windows, download from: https://github.com/coreybutler/nvm-windows/releases

# After installing nvm, restart your terminal, then:
nvm install 16
nvm use 16

# Verify the version
node --version  # Should show v16.x.x

# Now try npm install and npm start again
```

**Alternative**: If you can't use nvm, you can:
1. Use Docker with Node 16 image
2. Use a Node version manager like `fnm` or `n`
3. Install Node 16 directly from nodejs.org (not recommended as it replaces your current Node)

## Project Structure

```
├── public/              # Static assets
├── src/
│   ├── Components/     # React components
│   │   ├── AdminSection/
│   │   ├── EventsComponent/
│   │   ├── RegisterComponent/
│   │   └── ...
│   ├── App.js          # Main app component
│   └── index.js        # Entry point
├── server/             # Express server for production (serves built files)
└── package.json        # Dependencies and scripts
```

## Available Scripts

- `npm start` - Start development server (port 3000)
- `npm run build` - Build for production
- `npm test` - Run tests
- `npm run eject` - Eject from Create React App (irreversible)

## Production Build

To build for production:
```bash
npm run build
```

The built files will be in the `build/` directory. You can serve them using:
- The included Express server in `server/` directory
- Any static file server (nginx, Apache, etc.)
- Firebase Hosting (firebase.json is configured)

## Server Directory

The `server/` directory contains a simple Express server that serves the built React app. To use it:

```bash
cd server
npm install
npm start
```

It will serve the app on port 5000 (or the PORT environment variable).

## Docker

A Dockerfile is included for containerization. However, it uses Node 10 which is very outdated. You may want to update it:

```dockerfile
FROM node:16-alpine as build-step
# ... rest of the file
```

## Next Steps

1. **If you have backend access**: Update `.env` with the correct `REACT_APP_API_URL`
2. **If you need to update EmailJS**: Get new credentials from [EmailJS](https://www.emailjs.com/) and update `feedback.jsx`
3. **If you need payment integration**: Set up Razorpay/Ippopay accounts and configure keys
4. **For production**: Update all hardcoded URLs and API endpoints

## Getting Help

If you encounter issues:
1. Check the browser console for errors
2. Check the terminal for build/runtime errors
3. Verify Node.js version compatibility
4. Ensure all environment variables are set correctly

