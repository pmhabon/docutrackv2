<!DOCTYPE html>
<html>
<head>
    <title>Register | ISPSC DMS</title>
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
            padding: 20px;
            background: white;
            overflow: hidden;
        }

        .auth-card {
            width: 100%;
            max-width: 450px;
            height: 100%;
            display: flex;
            flex-direction: column;
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

        .card-header {
            flex-shrink: 0;
        }

        .logo-section {
            margin-bottom: 15px;
        }

        h5 {
            color: var(--maroon);
            font-weight: 700;
            font-size: 26px;
            margin-bottom: 5px;
        }

        .subtitle {
            color: #999;
            font-size: 13px;
        }

        .form-scroll-container {
            flex: 1;
            overflow-y: auto;
            padding-right: 8px;
            margin-right: -8px;
        }

        .form-scroll-container::-webkit-scrollbar {
            width: 6px;
        }

        .form-scroll-container::-webkit-scrollbar-track {
            background: transparent;
        }

        .form-scroll-container::-webkit-scrollbar-thumb {
            background: #ddd;
            border-radius: 3px;
        }

        .form-scroll-container::-webkit-scrollbar-thumb:hover {
            background: #999;
        }

        .form-group {
            margin-bottom: 12px;
        }

        label {
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
            display: block;
            font-size: 12px;
        }

        .form-control, .form-select {
            border-radius: 8px;
            border: 2px solid #e0e0e0;
            padding: 8px 12px;
            font-size: 13px;
            background: var(--white);
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--red);
            background: var(--white);
            box-shadow: 0 0 0 0.3rem rgba(231, 76, 60, 0.15);
            outline: none;
        }

        .form-control::placeholder {
            color: #aaa;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .password-wrapper {
            position: relative;
            margin-bottom: 12px;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 32px;
            cursor: pointer;
            color: #666;
            font-size: 14px;
            transition: color 0.3s;
            background: none;
            border: none;
            padding: 0;
        }

        .toggle-password:hover {
            color: var(--maroon);
        }

        .password-strength-bar {
            height: 4px;
            border-radius: 2px;
            margin-top: 4px;
            background-color: #e0e0e0;
            overflow: hidden;
        }

        .password-strength-fill {
            height: 100%;
            width: 0%;
            transition: width 0.3s, background-color 0.3s;
            background-color: #dc3545;
        }

        .password-strength-fill.weak {
            width: 25%;
            background-color: var(--red);
        }

        .password-strength-fill.fair {
            width: 50%;
            background-color: var(--yellow);
        }

        .password-strength-fill.good {
            width: 75%;
            background-color: #17a2b8;
        }

        .password-strength-fill.strong {
            width: 100%;
            background-color: var(--green);
        }

        .password-requirements {
            background: #f8f9fa;
            border-radius: 6px;
            padding: 8px;
            margin-top: 6px;
            font-size: 11px;
            border: 1px solid #e0e0e0;
        }

        .requirement {
            display: flex;
            align-items: center;
            margin: 3px 0;
            color: #666;
            transition: color 0.2s;
        }

        .requirement.met {
            color: var(--green);
            font-weight: 500;
        }

        .requirement-icon {
            margin-right: 5px;
            font-weight: bold;
            width: 12px;
        }

        .card-footer {
            flex-shrink: 0;
            padding-top: 12px;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 12px 0;
            color: #ccc;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-top: 1px solid #e0e0e0;
        }

        .divider::before {
            margin-right: 8px;
        }

        .divider::after {
            margin-left: 8px;
        }

        .divider-text {
            color: #999;
            font-size: 11px;
            font-weight: 600;
        }

        .btn-maroon {
            background: linear-gradient(135deg, var(--maroon) 0%, var(--maroon-light) 100%);
            color: var(--white);
            border-radius: 8px;
            border: 2px solid var(--red);
            padding: 10px;
            font-weight: 600;
            font-size: 14px;
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

        .btn-google {
            background: var(--white);
            color: #333;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s;
            font-weight: 600;
            font-size: 13px;
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
            width: 18px;
            height: 18px;
        }

        .auth-footer {
            text-align: center;
            padding-top: 10px;
            border-top: 1px solid #f0f0f0;
        }

        .auth-footer p {
            color: #666;
            font-size: 12px;
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
            padding: 8px 10px;
            border-radius: 6px;
            margin-bottom: 10px;
            border: 2px solid var(--red);
            font-size: 12px;
        }

        .text-danger {
            font-size: 11px !important;
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
                padding: 15px;
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
                padding: 15px;
            }

            h5 {
                font-size: 22px;
            }

            .form-row {
                grid-template-columns: 1fr;
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

    <!-- Right Side - Register Form -->
    <div class="auth-form-section">
        <div class="auth-card">
            <div class="card-header">
                <div class="logo-section">
                    <h5>Create Account</h5>
                    <p class="subtitle">Join DocuTrack today</p>
                </div>
            </div>

            <div class="form-scroll-container">
                <form method="POST" action="{{ route('register') }}" id="registerForm">
                    @csrf

                    @if ($errors->any())
                        <div class="error-message">
                            <strong>Registration Error!</strong>
                            <ul style="margin:6px 0 0 12px;">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <div class="form-row">
                        <div>
                            <label>First Name </label>
                            <input type="text" name="firstName" value="{{ old('firstName') }}" class="form-control" placeholder="John" required>
                            @error('firstName')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div>
                            <label>Last Name </label>
                            <input type="text" name="lastName" value="{{ old('lastName') }}" class="form-control" placeholder="Doe" required>
                            @error('lastName')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Middle Name</label>
                        <input type="text" name="middleName" value="{{ old('middleName') }}" class="form-control" placeholder="(Optional)">
                    </div>

                    <div class="form-group">
                        <label>Email </label>
                        <input type="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="your@email.com" required>
                        @error('email')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>

                    <div class="form-row">
                        <div>
                            <label>Role </label>
                            <select name="role" class="form-select" required>
                                <option value="">Select Role</option>
                                <option value="dean" {{ old('role') == 'dean' ? 'selected' : '' }}>Dean</option>
                                <option value="program_head" {{ old('role') == 'program_head' ? 'selected' : '' }}>Program Head</option>
                                <option value="campus_director" {{ old('role') == 'campus_director' ? 'selected' : '' }}>Campus Director</option>
                                <option value="faculty" {{ old('role') == 'faculty' ? 'selected' : '' }}>Faculty</option>
                            </select>
                            @error('role')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div>
                            <label>Campus </label>
                            <select name="campus" id="campusSelect" class="form-select" required>
                                <option value="">Select Campus</option>
                                @foreach($campuses as $c)
                                    <option value="{{ $c->name }}" data-id="{{ $c->id }}" {{ old('campus') == $c->name ? 'selected' : '' }}>{{ $c->name }}</option>
                                @endforeach
                            </select>
                            @error('campus')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                    </div>

                    <div class="form-row" style="margin-top:8px;">
                        <div>
                            <label>College</label>
                            <select name="college" id="collegeSelect" class="form-select" required>
                                <option value="">Select College</option>
                                @foreach($colleges as $col)
                                    <option value="{{ $col->name }}" data-id="{{ $col->id }}" {{ old('college') == $col->name ? 'selected' : '' }}>{{ $col->name }}</option>
                                @endforeach
                            </select>
                            @error('college')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div>
                            <label>Program</label>
                            <select name="program" id="programSelect" class="form-select" required>
                                <option value="">Select Program</option>
                                @foreach($programs as $p)
                                    <option value="{{ $p->name }}" data-id="{{ $p->id }}" {{ old('program') == $p->name ? 'selected' : '' }}>{{ $p->name }}</option>
                                @endforeach
                            </select>
                            @error('program')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                    </div>

                    <div>
                        <label>Rank</label>
                        <select name="rank" id="rankSelect" class="form-select" required>
                            <option value="">Select Rank</option>
                            @foreach($ranks as $r)
                                <option value="{{ $r->name }}" 
                                    {{ old('rank') == $r->name ? 'selected' : '' }}>
                                    {{ $r->name }}
                                </option>
                            @endforeach
                        </select>
                        @error('rank')
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </div>


                    <div class="form-group">
                        <label>Contact </label>
                        <input type="tel" name="contactNumber" value="{{ old('contactNumber') }}" class="form-control" placeholder="+63 9XX XXX XXXX" required>
                        @error('contactNumber')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>

                    <div class="form-group">
                        <label>Address </label>
                        <textarea name="address" class="form-control" rows="2" placeholder="Your address" required>{{ old('address') }}</textarea>
                        @error('address')<span class="text-danger">{{ $message }}</span>@enderror
                    </div>

                    <div class="form-row">
                        <div class="password-wrapper">
                            <label>Password </label>
                            <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Min 8 chars" required>
                            <button type="button" class="toggle-password" onclick="togglePassword('passwordInput')">
                                <i class="fas fa-eye"></i>
                            </button>
                            <div class="password-strength-bar">
                                <div class="password-strength-fill" id="passwordStrengthFill"></div>
                            </div>
                            <div class="password-requirements">
                                <div class="requirement" id="req-length"><span class="requirement-icon">✓</span>8+ chars</div>
                                <div class="requirement" id="req-uppercase"><span class="requirement-icon">✓</span>Uppercase</div>
                                <div class="requirement" id="req-lowercase"><span class="requirement-icon">✓</span>Lowercase</div>
                                <div class="requirement" id="req-number"><span class="requirement-icon">✓</span>Number</div>
                                <div class="requirement" id="req-special"><span class="requirement-icon">✓</span>Special char</div>
                            </div>
                            @error('password')<span class="text-danger">{{ $message }}</span>@enderror
                        </div>
                        <div class="password-wrapper">
                            <label>Confirm </label>
                            <input type="password" id="confirmPassword" name="password_confirmation" class="form-control" placeholder="Re-enter" required>
                            <button type="button" class="toggle-password" onclick="togglePassword('confirmPassword')">
                                <i class="fas fa-eye"></i>
                            </button>
                            <div id="passwordMatch" style="margin-top: 4px; font-size: 11px; color: #dc3545; display: none;">
                                <i class="fas fa-exclamation-circle"></i> No match
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="card-footer">
                <button type="submit" form="registerForm" class="btn btn-maroon">Create Account</button>

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

                <div class="auth-footer">
                    <p>Have account? <a href="{{ route('login') }}">Sign in</a></p>
                </div>
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

    const passwordInput = document.getElementById('passwordInput');
    const confirmPassword = document.getElementById('confirmPassword');
    const strengthFill = document.getElementById('passwordStrengthFill');
    const passwordMatch = document.getElementById('passwordMatch');

    function checkPasswordStrength() {
        const password = passwordInput.value;
        let strength = 0;

        if (password.length >= 8) {
            document.getElementById('req-length').classList.add('met');
            strength++;
        } else {
            document.getElementById('req-length').classList.remove('met');
        }

        if (/[A-Z]/.test(password)) {
            document.getElementById('req-uppercase').classList.add('met');
            strength++;
        } else {
            document.getElementById('req-uppercase').classList.remove('met');
        }

        if (/[a-z]/.test(password)) {
            document.getElementById('req-lowercase').classList.add('met');
            strength++;
        } else {
            document.getElementById('req-lowercase').classList.remove('met');
        }

        if (/[0-9]/.test(password)) {
            document.getElementById('req-number').classList.add('met');
            strength++;
        } else {
            document.getElementById('req-number').classList.remove('met');
        }

        if (/[!@#$%^&*]/.test(password)) {
            document.getElementById('req-special').classList.add('met');
            strength++;
        } else {
            document.getElementById('req-special').classList.remove('met');
        }

        strengthFill.className = 'password-strength-fill';
        if (strength <= 1) {
            strengthFill.classList.add('weak');
        } else if (strength <= 2) {
            strengthFill.classList.add('fair');
        } else if (strength <= 3) {
            strengthFill.classList.add('good');
        } else {
            strengthFill.classList.add('strong');
        }

        checkPasswordMatch();
    }

    function checkPasswordMatch() {
        if (confirmPassword.value && passwordInput.value !== confirmPassword.value) {
            passwordMatch.style.display = 'block';
        } else {
            passwordMatch.style.display = 'none';
        }
    }

    passwordInput.addEventListener('input', checkPasswordStrength);
    confirmPassword.addEventListener('input', checkPasswordMatch);
</script>

</body>
</html>
