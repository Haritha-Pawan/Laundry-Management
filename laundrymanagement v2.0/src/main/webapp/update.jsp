<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-hover: #3a56d4;
            --background: #f8fafc;
            --card-bg: #ffffff;
            --text-color: #1e293b;
            --border-color: #e2e8f0;
            --success-color: #10b981;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .form-container {
            width: 100%;
            max-width: 600px;
            background-color: var(--card-bg);
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            padding: 32px;
            margin: 20px;
        }
        
        .form-header {
            margin-bottom: 24px;
            text-align: center;
        }
        
        .form-header h2 {
            font-size: 24px;
            font-weight: 600;
            margin: 0;
            color: var(--text-color);
        }
        
        .form-header p {
            color: #64748b;
            margin-top: 8px;
            font-size: 14px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            font-size: 14px;
            color: #334155;
        }
        
        input, select {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.2s, box-shadow 0.2s;
            box-sizing: border-box;
            background-color: #f8fafc;
        }
        
        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }
        
        .form-row {
            display: flex;
            gap: 20px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }
        
        .btn-primary {
            flex: 1;
            padding: 14px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            text-align: center;
            text-decoration: none;
        }
        
        .btn-primary:hover {
            background-color: var(--primary-hover);
        }
        
        .btn-secondary {
            flex: 1;
            padding: 14px;
            background-color: #e2e8f0;
            color: #334155;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            text-align: center;
            text-decoration: none;
        }
        
        .btn-secondary:hover {
            background-color: #cbd5e1;
        }
        
        @media (max-width: 640px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .form-container {
                padding: 24px;
            }
            
            .button-group {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <h2>Edit User</h2>
            <p>Update the details below for this user account</p>
        </div>
        
        <form action="UpdateUserServlet" method="post">
            <input type="hidden" id="userId" name="userId" value="${user.id}">
            
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" value="${user.firstName}" placeholder="Enter first name" required>
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" value="${user.lastName}" placeholder="Enter last name" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" value="${user.address}" placeholder="Enter full address">
            </div>
            
            <div class="form-group">
                <label for="nic">NIC Number</label>
                <input type="text" id="nic" name="nic" value="${user.nic}" placeholder="Enter NIC number" required>
            </div>
            
            <div class="form-group">
                <label for="role">User Role</label>
                <select id="role" name="role" required>
                    <option value="" disabled>Select user role</option>
                    <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
                    <option value="Manager" ${user.role == 'Manager' ? 'selected' : ''}>Manager</option>
                    <option value="Staff" ${user.role == 'Staff' ? 'selected' : ''}>Staff</option>
                </select>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" value="${user.email}" placeholder="Enter email address" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" value="${user.phone}" placeholder="Enter phone number" required>
                </div>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn-primary">Update User</button>
                <a href="UserListServlet" class="btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>