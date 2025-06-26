<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New User</title>
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
        
        button {
            width: 100%;
            padding: 14px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-top: 10px;
        }
        
        button:hover {
            background-color: var(--primary-hover);
        }
        
        .success-message {
            color: var(--success-color);
            text-align: center;
            margin-top: 16px;
            font-size: 14px;
        }
        
        @media (max-width: 640px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .form-container {
                padding: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <h2>Add New User</h2>
            <p>Fill in the details below to create a new user account</p>
        </div>
        
        <form action="AddUserServlet" method="post" onSubmit="return validateForm()">
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" placeholder="Enter first name" required>
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" placeholder="Enter last name" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Enter full address">
            </div>
            
            <div class="form-group">
                <label for="nic">NIC Number</label>
                <input type="text" id="nic" name="nic" placeholder="Enter NIC number" required>
            </div>
            
            <div class="form-group">
                <label for="role">User Role</label>
                <select id="role" name="role" required>
                    <option value="" disabled selected>Select user role</option>
                    <option value="Admin">Admin</option>
                    <option value="Manager">Manager</option>
                    <option value="Staff">Staff</option>
                </select>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter email address" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="Enter phone number" required>
                </div>
            </div>
            
            <button type="submit">Create User Account</button>
        </form>
    </div>
    
    <script>
    
    function validateForm(){
    	const firstname = document.getElementById("firstName").value.trim();
    	const lastName=document.getElementById("lastName").value.trim();
    	const email = document.getElementById("email").value.trim();
    	const nic = document.getElementById("nic").value.trim();
    	const phoneNumber = document.getElementById("phone").value.trim();
    	
    	
    	const emailpattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    	const oldNICpattern = /^[0-9]{9}[vVxX]$/;
    	const newNICpattern = /^[0-9]{12}$/;
        const phonepattern = /^0[0-9]{9}$/;
    	

    	if(firstname == ""){
    		alert("Name is required .");
    		return false;
    	}
    	
    	
    	if(!email.match(emailpattern)){
    		alert("Enter valid Email address");
    		return false;
    	}
    	
    	 if (!oldNICpattern.test(nic) && !newNICpattern.test(nic)) {
    	        alert("Enter a valid NIC number (old or new format).");
    	        return false;
    	    }
    	
    	
    	if(!phoneNumber.match(phonepattern)){
    		alert('Enter a valid 10-digit Sri Lankan phone number starting with 0.');
    		return false;
    	}
    	
    	return true;
    	
    }
    	
    </script>
</body>
</html>