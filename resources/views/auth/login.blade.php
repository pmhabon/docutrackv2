<!DOCTYPE html>
<html>
<head>
    <title>Login | ISPSC DMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            overflow: hidden;
        }

        :root {
            --maroon: #800000;
            --maroon-dark: #600000;
            --maroon-light: #a00000;
            --red: #e74c3c;
            --yellow: #ffc107;
            --green: #198754;
            --white: #ffffff;
        }

        body {
            background: var(--white);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
        }

        .auth-container {
            display: flex;
            width: 100%;
            height: 100vh;
        }

        .auth-info-section {
            flex: 1;
            background: linear-gradient(135deg, rgba(231, 76, 60, 0.25) 0%, rgba(128, 0, 0, 0.25) 50%, rgba(96, 0, 0, 0.25) 100%), url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 800"><defs><pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse"><path d="M 40 0 L 0 0 0 40" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="1200" height="800" fill="%23800000"/><rect width="1200" height="800" fill="url(%23grid)"/><circle cx="200" cy="150" r="150" fill="rgba(255,193,7,0.15)"/><circle cx="1000" cy="700" r="200" fill="rgba(231,76,60,0.15)"/></svg>');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            position: relative;
            overflow: hidden;
        }

        .auth-info-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 50%, rgba(255,255,255,.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255,255,255,.1) 0%, transparent 50%);
            pointer-events: none;
        }

        .info-content {
            position: relative;
            z-index: 1;
            color: white;
            text-align: center;
        }

        .info-logo {
            width: 120px;
            height: 120px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            font-size: 48px;
            font-weight: bold;
            border: 3px solid rgba(255, 255, 255, 0.3);
            padding: 10px;
        }

        .info-logo img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .info-title {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .info-subtitle {
            font-size: 16px;
            opacity: 0.9;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .info-features {
            text-align: left;
            display: inline-block;
        }

        .info-feature {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .info-feature i {
            width: 30px;
            height: 30px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
        }

        .auth-form-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            background: white;
        }

        .auth-card {
            width: 100%;
            max-width: 450px;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo-section {
            margin-bottom: 30px;
        }

        h5 {
            color: var(--maroon);
            font-weight: 700;
            font-size: 28px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #999;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            display: block;
            font-size: 14px;
        }

        .form-control {
            border-radius: 10px;
            border: 2px solid #e0e0e0;
            padding: 11px 14px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: var(--white);
        }

        .form-control:focus {
            border-color: var(--red);
            background: var(--white);
            box-shadow: 0 0 0 0.3rem rgba(231, 76, 60, 0.15);
            outline: none;
        }

        .form-control::placeholder {
            color: #aaa;
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 39px;
            cursor: pointer;
            color: #666;
            font-size: 16px;
            transition: color 0.3s;
            background: none;
            border: none;
            padding: 0;
        }

        .toggle-password:hover {
            color: var(--maroon);
        }

        .form-check {
            margin-bottom: 20px;
        }

        .form-check-input {
            border-radius: 5px;
            border: 2px solid #e0e0e0;
            width: 18px;
            height: 18px;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 2px;
        }

        .form-check-input:checked {
            background-color: var(--green);
            border-color: var(--green);
        }

        .form-check-label {
            cursor: pointer;
            margin-left: 6px;
            color: #666;
            font-weight: 500;
            font-size: 14px;
        }

        .btn-maroon {
            background: linear-gradient(135deg, var(--maroon) 0%, var(--maroon-light) 100%);
            color: var(--white);
            border-radius: 10px;
            border: 2px solid var(--red);
            padding: 12px;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
            width: 100%;
        }

        .btn-maroon:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(231, 76, 60, 0.4);
            background: linear-gradient(135deg, var(--red) 0%, var(--maroon) 100%);
            color: var(--white);
            border-color: var(--yellow);
        }

        .btn-maroon:active {
            transform: translateY(0);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
            color: #ccc;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-top: 2px solid #e0e0e0;
        }

        .divider::before {
            margin-right: 12px;
        }

        .divider::after {
            margin-left: 12px;
        }

        .divider-text {
            color: #999;
            font-size: 12px;
            font-weight: 600;
        }

        .btn-google {
            background: var(--white);
            color: #333;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.3s;
            font-weight: 600;
            font-size: 14px;
            width: 100%;
            cursor: pointer;
        }

        .btn-google:hover {
            background: var(--white);
            border-color: var(--red);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.15);
            text-decoration: none;
            color: #333;
        }

        .google-icon {
            width: 20px;
            height: 20px;
        }

        .auth-footer {
            text-align: center;
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #f0f0f0;
        }

        .auth-footer p {
            color: #666;
            font-size: 13px;
            margin: 0;
        }

        .auth-footer a {
            color: var(--maroon);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .auth-footer a:hover {
            color: var(--maroon-light);
            text-decoration: underline;
        }

        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 10px 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            border: 2px solid var(--red);
            font-size: 13px;
        }

        @media (max-width: 992px) {
            .auth-container {
                flex-direction: column;
            }

            .auth-info-section {
                min-height: 30%;
                padding: 20px;
            }

            .auth-form-section {
                min-height: 70%;
                padding: 20px;
            }

            .info-title {
                font-size: 28px;
            }

            .info-subtitle {
                font-size: 14px;
            }
        }

        @media (max-width: 576px) {
            .auth-info-section {
                display: none;
            }

            .auth-form-section {
                min-height: 100%;
            }

            h5 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

<div class="auth-container">
    <!-- Left Side - Info -->
    <div class="auth-info-section">
        <div class="info-content">
            <div class="info-logo"><img src="https://ispsc.edu.ph/file-manager/images/ispsc_logo_2.png" alt="ISPSC Logo"></div>
            <h2 class="info-title">DocuTrack</h2>
            <p class="info-subtitle">Document Management System for ISPSC</p>
            
            <div class="info-features">
                <div class="info-feature">
                    <i class="fas fa-shield-alt"></i>
                    <span>Secure & Reliable</span>
                </div>
                <div class="info-feature">
                    <i class="fas fa-file-alt"></i>
                    <span>Easy Document Management</span>
                </div>
                <div class="info-feature">
                    <i class="fas fa-users"></i>
                    <span>Collaborate with Your Team</span>
                </div>
                <div class="info-feature">
                    <i class="fas fa-clock"></i>
                    <span>Track in Real-Time</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Right Side - Login Form -->
    <div class="auth-form-section">
        <div class="auth-card">
            <div class="logo-section">
                <h5>Sign In</h5>
                <p class="subtitle">Welcome back to DocuTrack</p>
            </div>

            <form method="POST" action="{{ route('login') }}">
                @csrf

                @if ($errors->any())
                    <div class="error-message">
                        <strong>Login Failed!</strong><br>
                        {{ $errors->first('email') ?? 'Invalid credentials' }}
                    </div>
                @endif

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" id="email"
                           value="{{ old('email') }}"
                           class="form-control @error('email') is-invalid @enderror"
                           placeholder="your@email.com"
                           required>
                </div>

                <div class="form-group password-wrapper">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password"
                           class="form-control @error('password') is-invalid @enderror"
                           placeholder="••••••••"
                           required>
                    <button type="button" class="toggle-password" onclick="togglePassword('password')">
                        <i class="fas fa-eye"></i>
                    </button>
                </div>

                <div class="form-check">
                    <input type="checkbox" name="remember" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">Remember me</label>
                </div>

                <button type="submit" class="btn btn-maroon">Sign In</button>

                <div class="divider">
                    <span class="divider-text">OR</span>
                </div>

                <a href="{{ route('google.redirect') }}" class="btn btn-google">
                    <svg class="google-icon" viewBox="0 0 24 24">
                        <path fill="#1F2937" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                        <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                        <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                        <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                    </svg>
                    <span>Google</span>
                </a>
            </form>

            <div class="auth-footer">
                <p>Don't have an account? <a href="{{ route('register') }}">Create one</a></p>
            </div>
        </div>
    </div>
</div>

<script>
    function togglePassword(fieldId) {
        const field = document.getElementById(fieldId);
        const btn = event.target.closest('button');
        const icon = btn.querySelector('i');
        
        if (field.type === 'password') {
            field.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            field.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
</script>

</body>
</html>
