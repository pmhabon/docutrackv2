# Google OAuth Setup Guide

## Overview
This application now includes Google Sign-In/Sign-Up functionality. Follow these steps to set up Google OAuth.

## Step 1: Create a Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the Google+ API:
   - Go to "APIs & Services" → "Library"
   - Search for "Google+ API"
   - Click on it and press "Enable"

## Step 2: Create OAuth 2.0 Credentials

1. Go to "APIs & Services" → "Credentials"
2. Click "Create Credentials" → "OAuth 2.0 Client ID"
3. Select "Web application"
4. Add Authorized JavaScript origins:
   - `http://localhost:8000`
   - `http://localhost`
   - Add your production domain (e.g., `https://yourapp.com`)

5. Add Authorized redirect URIs:
   - `http://localhost:8000/auth/google/callback`
   - `http://localhost/auth/google/callback`
   - Add your production URI (e.g., `https://yourapp.com/auth/google/callback`)

6. Copy the Client ID and Client Secret

## Step 3: Configure Environment Variables

Add the following to your `.env` file:

```env
GOOGLE_CLIENT_ID=your_client_id_here
GOOGLE_CLIENT_SECRET=your_client_secret_here
GOOGLE_REDIRECT_URI=http://localhost:8000/auth/google/callback
```

For production, update `GOOGLE_REDIRECT_URI` to your production URL:
```env
GOOGLE_REDIRECT_URI=https://yourapp.com/auth/google/callback
```

## Step 4: Verify Installation

The Google OAuth package (Laravel Socialite) has been installed. Verify everything is working:

```bash
php artisan config:clear
php artisan cache:clear
```

## Testing

1. Start your Laravel development server:
   ```bash
   php artisan serve
   ```

2. Navigate to the login page: `http://localhost:8000/login`
3. Or to the register page: `http://localhost:8000/register`
4. Click "Sign In with Google" or "Sign Up with Google"
5. You should be redirected to Google's login page
6. After authentication, you'll be logged in or a new account will be created

## Notes

- When users sign up with Google, their first name is extracted from their Google profile name
- A random password is generated for Google OAuth users (they don't need to set one)
- Subsequent logins with the same Google account will log in the existing user
- All required fields except password are stored during Google OAuth sign-up

## Troubleshooting

### Redirect URI mismatch error
- Ensure the redirect URI in `.env` exactly matches what you configured in Google Cloud Console
- Check both the protocol (http/https) and port

### Missing Client ID/Secret
- Verify your `.env` file has `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET`
- Clear config cache: `php artisan config:clear`

### Session errors
- Ensure sessions are properly configured in your `.env`
- Check that `storage/framework/sessions` directory exists and is writable
