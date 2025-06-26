



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Management | Laundry Mart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap');
        body {
            font-family: 'Roboto', sans-serif;
        }
        .status-badge {
            transition: all 0.2s ease;
        }
        .staff-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .progress-track {
            height: 6px;
            border-radius: 3px;
        }
        .progress-fill {
            height: 6px;
            border-radius: 3px;
            transition: width 0.6s ease;
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-900">






    <div class="flex h-screen overflow-hidden">
        <!-- Sidebar -->
        <div class="hidden md:flex md:flex-shrink-0">
            <div class="flex flex-col w-64 bg-white border-r border-gray-200">
                <div class="flex items-center justify-center h-16 px-4 border-b border-gray-200">
                    <span class="text-blue-600 text-xl font-medium">Laundry Mart</span>
                </div>
                <div class="flex flex-col flex-grow px-4 py-4 overflow-y-auto">
                    <nav class="space-y-1">
                        <a href="dashbord.jsp" class="flex items-center px-4 py-3 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg transition-colors">
                            <span class="material-icons mr-3">dashboard</span>
                            Dashboard
                        </a>
                        <a href="Machine.jsp" class="flex items-center px-4 py-3 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg transition-colors">
                            <span class="material-icons mr-3">local_laundry_service</span>
                            Machines
                        </a>
                        <a href="staff.jsp" class="flex items-center px-4 py-3 bg-blue-50 text-blue-600 rounded-lg">
                            <span class="material-icons mr-3">people</span>
                            Staff
                        </a>
                        <a href="#" class="flex items-center px-4 py-3 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg transition-colors">
                            <span class="material-icons mr-3">receipt</span>
                            Orders
                        </a>
                        <a href="Tracking.jsp" class="flex items-center px-4 py-3 text-gray-600 hover:bg-blue-50 hover:text-blue-600 rounded-lg transition-colors">
                            <span class="material-icons mr-3">track_changes</span>
                            Tracking
                        </a>
                    </nav>
                    <div class="mt-auto mb-4 px-4 py-3 bg-gray-50 rounded-lg">
                        <div class="flex items-center">
                            <img class="w-9 h-9 rounded-full" src="https://randomuser.me/api/portraits/women/44.jpg" alt="Profile">
                            <div class="ml-3">
                                <p class="text-sm font-medium">Sarah Johnson</p>
                                <p class="text-xs text-gray-500">Admin</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Main Content -->
        <div class="flex flex-col flex-1 overflow-hidden">
            <!-- Top Navigation -->
            <header class="flex items-center justify-between px-6 py-4 bg-white border-b border-gray-200">
                <div class="flex items-center">
                    <button class="md:hidden text-gray-500 focus:outline-none mr-4">
                        <span class="material-icons">menu</span>
                    </button>
                    <h1 class="text-xl font-medium">Staff Management</h1>
                </div>
                
                <div class="flex items-center space-x-4">
                    <button class="text-gray-500 hover:text-gray-700 focus:outline-none">
                        <span class="material-icons">notifications</span>
                    </button>
                    <button class="text-gray-500 hover:text-gray-700 focus:outline-none">
                        <span class="material-icons">mail</span>
                    </button>
                    <div class="relative">
                    
                    <form action="Search" method="get">

                        <input type="text"  name="search" id="search" class="w-64 pl-10 pr-4 py-2 text-gray-700 bg-gray-100 rounded-lg focus:outline-none focus:ring-1 focus:ring-blue-500 focus:bg-white" placeholder="Search...">
                        <span class="absolute left-0 top-0 mt-2 ml-3 text-gray-500">
                            <span class="material-icons text-base">search</span>
                        </span>
                      </form>
                    </div>
                </div>
            </header>
            
            <!-- Staff Content -->
            <main class="flex-1 overflow-y-auto p-6">
                <!-- Stats Cards -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
                    <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                                <span class="material-icons">people</span>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">Total Staff</p>
                                <p class="text-2xl font-semibold">${userCount}</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-green-100 text-green-600">
                                <span class="material-icons">check_circle</span>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">Active Now</p>
                                <p class="text-2xl font-semibold">18</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-yellow-100 text-yellow-600">
                                <span class="material-icons">schedule</span>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">On Leave</p>
                                <p class="text-2xl font-semibold">3</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="p-3 rounded-full bg-red-100 text-red-600">
                                <span class="material-icons">person_off</span>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">Inactive</p>
                                <p class="text-2xl font-semibold">3</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Action Bar -->
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 mb-6">
                    <div class="px-6 py-4 flex flex-col sm:flex-row sm:items-center sm:justify-between">
                        <div class="mb-4 sm:mb-0">
                            <h2 class="text-lg font-medium">All Staff Members</h2>
                            <p class="text-sm text-gray-500">Manage your laundry staff efficiently</p>
                        </div>
                        <div class="flex space-x-2">
                            <button class="px-4 py-2 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 flex items-center">
                                <span class="material-icons mr-1 text-base">filter_list</span>
                                Filter
                            </button>
                            
                            
                            <button onclick="window.location.href='add-user-form.jsp'"class="px-4 py-2 border border-transparent rounded-lg text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 flex items-center shadow-sm">
                                <span class="material-icons mr-1 text-base">add</span>
                                Add Staff
                            </button> 
                            
                        </div>
                    </div>
                </div>
                
                <!-- Staff Table -->
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <div class="flex items-center">
                                        
                                            <span>Staff Member</span>
                                            <span class="material-icons ml-1 text-base text-gray-400">unfold_more</span>
                                        </div>
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Position</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Address</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">NIC</th>
                                    <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                            
                             <c:forEach var="user" items="${users}">
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                             <div class="flex-shrink-0 h-10 w-10">
                                              <img class="h-10 w-10 rounded-full" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYRmCrImdbb9tG6WMTy8a3BJG7p9uWN1Avy1hpV_ahBO2Kn_cKSrhbDUc&s" alt="">
                                            </div> 
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900">${user.firstName} ${user.lastName}</div>
                                                <div class="text-sm text-gray-500">${user.email}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-900">${user.role}</div>
                                       
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-900">${user.address}</div>
                                        
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                            Active
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                        ${user.nic}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        
                                        <a href='edit?id=${user.id}'>
                                        <button class="text-blue-600 hover:text-blue-900 mr-3">
                                            <span class="material-icons text-base">edit</span>
                                        </button>
                                        </a>
                                        <button class="text-gray-600 hover:text-gray-900 mr-3">
                                            <span class="material-icons text-base">visibility</span>
                                        </button>
                                        <a href='deleteUser?id=${user.id}'>
                                        <button onclick="return confirm('Are you sure you want to delete this user?')" class="text-red-600 hover:text-red-900">
                                            <span class="material-icons text-base">delete</span>
                                        </button>
                                        </a>
                                    </td>
                                </tr>
                                
                                </c:forEach> <!-- Additional staff rows -->
                                
                                   
    </tbody>
    
    
    
  
                                  </body>
</html>
