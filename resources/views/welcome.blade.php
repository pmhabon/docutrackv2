<!DOCTYPE html>
<html>
<head>
    <title>ISPSC Document Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --maroon: #800000;
            --red: #e74c3c;
            --yellow: #ffc107;
            --green: #198754;
            --white: #ffffff;
        }

        body {
            padding-top: 80px;
            font-family: 'Segoe UI', sans-serif;
            background: var(--white);
            margin: 0;
            overflow-x: hidden;
        }

        .navbar-custom {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: var(--white);
            padding: 15px 40px;
            border-bottom: 3px solid transparent;
            border-image: linear-gradient(90deg, var(--red) 0%, var(--yellow) 33%, var(--green) 66%, var(--maroon) 100%) 1;
            box-shadow: 0 2px 8px rgba(231, 76, 60, 0.1);
        }

        .brand-box {
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            border-radius: 8px;
            overflow: hidden;
        }

        .brand-box img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .hero {
            padding: 60px 20px 50px;
            text-align: center;
            background: linear-gradient(135deg, var(--maroon) 0%, var(--red) 100%);
            color: var(--white);
        }

        .hero h1 {
            font-weight: 700;
            color: var(--white);
            position: relative;
            display: inline-block;
            padding-bottom: 15px;
        }

        .hero h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, var(--red) 0%, var(--yellow) 50%, var(--green) 100%);
            border-radius: 2px;
        }

        .btn-maroon {
            background: var(--maroon);
            color: var(--white);
            border-radius: 12px;
            padding: 12px 25px;
            border: 2px solid var(--red);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-maroon::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, var(--red) 0%, var(--maroon) 50%, var(--red) 100%);
            transition: left 0.3s ease;
            z-index: -1;
        }

        .btn-maroon:hover {
            background: linear-gradient(90deg, var(--red) 0%, var(--maroon) 100%);
            box-shadow: 0 6px 20px rgba(231, 76, 60, 0.4);
            transform: translateY(-2px);
            border-color: var(--yellow);
        }

        .btn-outline-maroon {
            border: 2px solid var(--red);
            color: var(--maroon);
            border-radius: 12px;
            padding: 12px 25px;
            transition: all 0.3s ease;
            background: var(--white);
        }

        .btn-outline-maroon:hover {
            background: linear-gradient(135deg, rgba(231, 76, 60, 0.15) 0%, rgba(255, 193, 7, 0.15) 100%);
            border-color: var(--yellow);
            color: var(--red);
            box-shadow: 0 6px 20px rgba(231, 76, 60, 0.25);
            transform: translateY(-2px);
        }

        .benefits-section {
            padding: 50px 20px;
            background: linear-gradient(to bottom, rgba(255,255,255,0), rgba(231, 76, 60, 0.02));
        }

        .benefit-item {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
            align-items: flex-start;
        }

        .benefit-icon {
            flex-shrink: 0;
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--green) 0%, var(--yellow) 100%);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
        }

        .benefit-content h6 {
            color: var(--maroon);
            font-weight: 600;
            margin-bottom: 5px;
        }

        .benefit-content p {
            color: #666;
            font-size: 13px;
            margin: 0;
            line-height: 1.5;
        }

        .feature-card {
            border-radius: 20px;
            padding: 20px;
            background: var(--white);
            box-shadow: 0 8px 25px rgba(0,0,0,0.05);
            transition: 0.3s ease;
            border-top: 5px solid #ddd;
            position: relative;
            overflow: hidden;
            border-left: 4px solid transparent;
        }

        .feature-card:nth-child(1) {
            border-top-color: var(--yellow);
            border-left-color: var(--yellow);
        }

        .feature-card:nth-child(2) {
            border-top-color: var(--green);
            border-left-color: var(--green);
        }

        .feature-card:nth-child(3) {
            border-top-color: var(--red);
            border-left-color: var(--red);
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--red) 0%, var(--yellow) 50%, var(--green) 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .feature-card:hover::before {
            opacity: 1;
        }

        .feature-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 35px rgba(231, 76, 60, 0.15);
        }

        .feature-card h5 {
            color: var(--maroon);
            font-weight: 600;
        }

        .feature-card:nth-child(1) h5 {
            color: var(--yellow);
        }

        .feature-card:nth-child(2) h5 {
            color: var(--green);
        }

        .feature-card:nth-child(3) h5 {
            color: var(--red);
        }

        .how-it-works {
            background: linear-gradient(135deg, rgba(128, 0, 0, 0.03) 0%, rgba(231, 76, 60, 0.03) 100%);
            padding: 60px 20px;
        }

        .how-it-works h2 {
            text-align: center;
            color: var(--maroon);
            font-weight: 700;
            margin-bottom: 40px;
            position: relative;
            display: inline-block;
            width: 100%;
            padding-bottom: 20px;
        }

        .how-it-works h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, var(--red) 0%, var(--yellow) 50%, var(--green) 100%);
            border-radius: 2px;
        }

        .step-card {
            text-align: center;
            padding: 20px 15px;
        }

        .step-number {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--green) 0%, var(--yellow) 100%);
            color: white;
            border-radius: 50%;
            font-weight: 700;
            font-size: 24px;
            margin-bottom: 15px;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }

        .step-card h5 {
            color: var(--maroon);
            font-weight: 600;
            margin-bottom: 10px;
        }

        .step-card p {
            color: #666;
            font-size: 14px;
            line-height: 1.6;
        }

        .cta-section {
            background: linear-gradient(135deg, var(--maroon) 0%, var(--red) 100%);
            color: white;
            padding: 45px 20px;
            text-align: center;
            margin: 40px 0;
        }

        .cta-section h2 {
            color: white;
            font-weight: 700;
            margin-bottom: 15px;
            font-size: 28px;
        }

        .cta-section p {
            color: rgba(255, 255, 255, 0.9);
            font-size: 15px;
            margin-bottom: 25px;
        }

        footer {
            background: #1a1a1a;
            color: var(--white);
            padding: 40px 20px 15px;
            border-top: 4px solid transparent;
            border-image: linear-gradient(90deg, var(--yellow) 0%, var(--green) 50%, var(--red) 100%) 1;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
            margin-bottom: 30px;
        }

        .footer-section h5 {
            color: var(--yellow);
            font-weight: 700;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .footer-section p, .footer-section a {
            color: rgba(255, 255, 255, 0.8);
            font-size: 12px;
            line-height: 1.7;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-section a:hover {
            color: var(--yellow);
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
        }

        .footer-section li {
            margin-bottom: 8px;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
            font-size: 12px;
        }

        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }

        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: rgba(255, 193, 7, 0.1);
            border: 1px solid rgba(255, 193, 7, 0.3);
            border-radius: 50%;
            color: var(--yellow);
            transition: all 0.3s;
        }

        .social-links a:hover {
            background: rgba(255, 193, 7, 0.2);
            border-color: var(--yellow);
        }

    </style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar-custom d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center">
        <div class="brand-box"><img src="https://ispsc.edu.ph/file-manager/images/ispsc_logo_2.png" alt="ISPSC Logo"></div>
        <strong>ISPSC DMS</strong>
    </div>

    <div>
        <a href="{{ route('login') }}" class="btn btn-outline-maroon me-2">Login</a>
        <a href="{{ route('register') }}" class="btn btn-maroon">Register</a>
    </div>
</div>

<!-- HERO -->
<section class="hero">
    <h1>Document Management System</h1>
    <p class="text-white mt-3">
        A centralized system for managing, tracking, and approving academic and administrative documents.
    </p>

    <div class="mt-4">
        <a href="{{ route('login') }}" class="btn btn-maroon me-2">Get Started</a>
        <a href="{{ route('register') }}" class="btn btn-outline-maroon">Create Account</a>
    </div>
</section>


<!-- DOCUTRACK INFO & HOW IT WORKS -->
<section style="padding: 60px 20px;">
    <div class="container">
        <div class="row g-5">
            <!-- Left: DocuTrack Info -->
            <div class="col-lg-6">
                <div style="padding: 30px 0;">
                    <h2 style="color: var(--maroon); font-weight: 700; margin-bottom: 20px;">About DocuTrack</h2>
                    <p style="color: #666; line-height: 1.8; margin-bottom: 20px;">
                        DocuTrack is a comprehensive document management system designed specifically for ISPSC institutions to streamline document submission, tracking, and approval processes. Our platform provides a secure, efficient, and user-friendly solution for managing academic and administrative documents across all campuses.
                    </p>
                    <div style="margin-top: 30px;">
                        <h5 style="color: var(--maroon); font-weight: 600; margin-bottom: 15px;">Key Features:</h5>
                        <div class="benefit-item">
                            <div class="benefit-icon"><i class="fas fa-shield-alt"></i></div>
                            <div class="benefit-content">
                                <h6>Role-Based Access</h6>
                                <p>Secure system access for Admin, Dean, Campus, and PH users.</p>
                            </div>
                        </div>
                        <div class="benefit-item">
                            <div class="benefit-icon"><i class="fas fa-file-alt"></i></div>
                            <div class="benefit-content">
                                <h6>Document Tracking</h6>
                                <p>Track document status: Pending, Approved, or Rejected.</p>
                            </div>
                        </div>
                        <div class="benefit-item">
                            <div class="benefit-icon"><i class="fas fa-database"></i></div>
                            <div class="benefit-content">
                                <h6>Centralized Records</h6>
                                <p>Manage campus, college, program, and employee records efficiently.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: How It Works -->
            <div class="col-lg-6">
                <div style="padding: 30px 0;">
                    <h2 style="color: var(--maroon); font-weight: 700; margin-bottom: 40px;">How It Works</h2>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <div class="step-card">
                                <div class="step-number">1</div>
                                <h5>Register Account</h5>
                                <p>Create your account with your institutional credentials and select your role.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="step-card">
                                <div class="step-number">2</div>
                                <h5>Submit Document</h5>
                                <p>Upload and submit documents with all necessary details and attachments.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="step-card">
                                <div class="step-number">3</div>
                                <h5>Track Status</h5>
                                <p>Monitor your document's progress through the approval workflow in real-time.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="step-card">
                                <div class="step-number">4</div>
                                <h5>Get Approved</h5>
                                <p>Receive final approval or feedback for document improvements.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA SECTION -->
<section class="cta-section">
    <div class="container">
        <h2>Ready to Streamline Your Document Management?</h2>
        <p>Join ISPSC institutions already using DocuTrack to manage their academic and administrative documents efficiently.</p>
        <a href="{{ route('register') }}" class="btn btn-outline-warning" style="border-color: white; color: white; font-weight: 600;">Get Started Now</a>
    </div>
</section>

<!-- FOOTER -->
<footer>
    <div class="footer-content">
        <div class="footer-section">
            <h5>About DocuTrack</h5>
            <p>DocuTrack is a comprehensive document management system designed specifically for ISPSC institutions to streamline document submission, tracking, and approval processes.</p>
            <div class="social-links">
                <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>

        <div class="footer-section">
            <h5>Quick Links</h5>
            <ul>
                <li><a href="{{ route('login') }}">Login</a></li>
                <li><a href="{{ route('register') }}">Register</a></li>
                <li><a href="#">Documentation</a></li>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">Contact Support</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h5>Features</h5>
            <ul>
                <li><a href="#">Role-Based Access Control</a></li>
                <li><a href="#">Real-Time Tracking</a></li>
                <li><a href="#">Secure Storage</a></li>
                <li><a href="#">Approval Workflows</a></li>
                <li><a href="#">Audit Logs</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h5>Contact Us</h5>
            <p><strong>Email:</strong><br><a href="mailto:support@ispsc.edu.ph">support@ispsc.edu.ph</a></p>
            <p><strong>Phone:</strong><br><a href="tel:+63123456789">(+63) 123-456-789</a></p>
            <p><strong>Address:</strong><br>ISPSC Main Campus<br>Candon, Ilocos Sur</p>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; {{ date('Y') }} Ilocos Sur Polytechnic State College. All rights reserved. | <a href="#" style="color: rgba(255, 255, 255, 0.6);">Privacy Policy</a> | <a href="#" style="color: rgba(255, 255, 255, 0.6);">Terms of Service</a></p>
    </div>
</footer>

</body>
</html>
