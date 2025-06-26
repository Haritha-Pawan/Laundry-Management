<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Adding User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-container {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }
        .error-card {
            width: 100%;
            max-width: 500px;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            background-color: white;
        }
        .error-icon {
            font-size: 4rem;
            color: #dc3545;
            margin-bottom: 1rem;
        }
        .btn-custom {
            margin-top: 1.5rem;
            padding: 0.5rem 1.5rem;
        }
        .error-details {
            background-color: #f8d7da;
            border-left: 4px solid #dc3545;
            padding: 0.75rem;
            margin: 1rem 0;
            text-align: left;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-card">
            <div class="error-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>
            </div>
            <h2 class="mb-3">Error Adding User</h2>
            <p class="text-muted">There was a problem while adding the new user.</p>
            
            <%-- Display error details if available --%>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="error-details">
                    <strong>Error details:</strong><br>
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                <a href="add-user-form.jsp" class="btn btn-danger btn-custom">
                    <i class="bi bi-arrow-left"></i> Try Again
                </a>
                <a href="UserListServelet" class="btn btn-outline-secondary btn-custom">
                    <i class="bi bi-list-ul"></i> View All Users
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>