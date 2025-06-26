<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-light: #3b82f6;
            --primary-dark: #1d4ed8;
            --gray-light: #f3f4f6;
            --gray-dark: #6b7280;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9fafb;
            color: #111827;
            line-height: 1.6;
        }
        
        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        .card {
            background: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            padding: 2rem;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--gray-light);
        }
        
        .header h1 {
            color: var(--primary-color);
            font-size: 1.5rem;
            font-weight: 600;
        }
        
        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            font-weight: 500;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: var(--primary-dark);
        }
        
        .btn-secondary {
            background-color: var(--gray-light);
            color: var(--gray-dark);
        }
        
        .btn-secondary:hover {
            background-color: #e5e7eb;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-row {
            display: flex;
            gap: 1rem;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #374151;
        }
        
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            font-size: 1rem;
            transition: border-color 0.2s;
        }
        
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus,
        select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }
        
        .actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .error {
            color: #dc2626;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body>



    <div class="container">
        <div class="card">
            <div class="header">
                <h1>Edit User Details</h1>
            </div>
            
            <form action="updateUser" method="POST">
                <input type="hidden" name="id" value="${user.id}">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${user.email}" required>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" id="phone" name="phone" value="${user.phone}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="nic">NIC</label>
                        <input type="text" id="nic" name="nic" value="${user.nic}" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" value="${user.address}" required>
                </div>
                
                <div class="form-group">
                    <label for="role">Role</label>
                    <select id="role" name="role"  required>
                        <option value="${user.role}">Select Role</option>
                        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
                        <option value="MANAGER" ${user.role == 'MANAGER' ? 'selected' : ''}>Manager</option>
                        <option value="STAFF" ${user.role == 'STAFF' ? 'selected' : ''}>Staff</option>
                    </select>
                </div>
                
               
                
                <div class="actions">
                    <a href="UserListServelet" class="btn btn-secondary">Cancel</a>
                    <button type="submit" class="btn btn-primary">Update User</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>