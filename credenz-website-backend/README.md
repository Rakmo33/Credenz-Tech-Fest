# Credenz-website-backend
NodeJS app for credenz website, REST-API structure

JWT, CORS, authentications, permissions, REST APIs, mongodb, admin system

## Setup Instructions

### Prerequisites
- Node.js (v14 or higher recommended)
- MongoDB (local installation or MongoDB Atlas account)
- npm or yarn

### Installation Steps

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Set Up MongoDB**
   
   **Option A: Local MongoDB**
   - Install MongoDB locally: https://www.mongodb.com/try/download/community
   - Start MongoDB service
   - Use connection string: `mongodb://localhost:27017/credenz`

   **Option B: MongoDB Atlas (Cloud)**
   - Create a free account at https://www.mongodb.com/cloud/atlas
   - Create a new cluster
   - Get your connection string (format: `mongodb+srv://username:password@cluster.mongodb.net/credenz?retryWrites=true&w=majority`)

3. **Configure Environment Variables**
   
   Create a `.env` file in the root directory with the following variables:
   ```env
   # MongoDB Connection
   MONGODB_URL=mongodb://localhost:27017/credenz
   # or for Atlas: mongodb+srv://username:password@cluster.mongodb.net/credenz?retryWrites=true&w=majority

   # JWT Secret Key (generate a random string)
   ACCESS_TOKEN_SECRET=your-secret-key-here-change-in-production

   # Email Configuration (for nodemailer)
   IEEE_EMAIL=your-email@gmail.com
   IEEE_EMAIL_PASSWORD=your-app-password-here

   # Payment Gateway (IppoPay) - Optional
   IPPO_LIVE_PUBLIC=your-ippo-public-key
   IPPO_LIVE_SECRET=your-ippo-secret-key

   # Server Port
   PORT=5000
   ```

   **Note:** 
   - For Gmail, you'll need to use an "App Password" instead of your regular password. Enable 2FA and generate an app password.
   - Generate a secure JWT secret: You can use `openssl rand -base64 32` or any random string generator.

4. **Run the Application**
   
   Development mode (with auto-reload):
   ```bash
   npm run dev
   ```
   
   Production mode:
   ```bash
   npm start
   ```

   The server will start on `http://localhost:5000` (or the PORT specified in .env)

### API Endpoints

The API includes endpoints for:
- User authentication (signup, login)
- Event management
- User registration for events
- Team creation
- Admin operations
- Payment processing
- Email notifications

### Troubleshooting

- **MongoDB Connection Error**: Ensure MongoDB is running and the connection string in `.env` is correct
- **Port Already in Use**: Change the PORT in `.env` or stop the process using port 5000
- **Email Not Sending**: Verify Gmail app password is correct and 2FA is enabled

### Notes

- This project uses JWT for authentication
- Admin users have role "admin" in the database
- The project was updated to use modern dependency versions compatible with Node.js 14+