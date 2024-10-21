<%-- 
    Document   : DashBoard
    Created on : Oct 15, 2024, 9:17:13 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>
        Customers
    </title>
    <script src="https://cdn.tailwindcss.com">
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
</head>

<body class="bg-gray-100 font-sans antialiased">
    <div class="flex h-screen">
        <!-- Sidebar -->
        <div class="w-64 bg-white border-r">
            <div class="p-4 flex items-center">
                <img alt="Company Logo" class="h-10 w-10 rounded-full" src="https://placehold.co/40x40" />
                <span class="ml-3 text-xl font-semibold">
                   Manage
                </span>
            </div>
            <nav class="mt-6">
                <a class="flex items-center p-3 text-gray-700 bg-gray-100 rounded-lg" href="#">
                    <i class="fas fa-tachometer-alt mr-3">
                    </i>
                    Dashboard
                </a>

                <a class="flex items-center p-3 text-gray-700 bg-gray-200 rounded-lg" href="../user">
                    <i class="fas fa-users mr-3">
                    </i>
                    Customers
                  
                </a>
               
                
            </nav>
        </div>
        <!-- Main Content -->
        <div class="flex-1 p-6">
            <div class="flex justify-between items-center mb-6">
                <div>
                    <h1 class="text-2xl font-semibold">
                        Customers
                    </h1>
                    <p class="text-gray-600">
                        Find all platform customers here
                    </p>
                </div>
                <div class="flex items-center space-x-4">
                    <button
                        class="flex items-center bg-white border border-gray-300 text-gray-700 px-4 py-2 rounded-lg">
                        <i class="fas fa-file-export mr-2">
                        </i>
                        Export CSV
                    </button>
                    <button class="flex items-center bg-black text-white px-4 py-2 rounded-lg">
                        <i class="fas fa-plus">
                        </i>
                    </button>
                </div>
            </div>
            <div class="grid grid-cols-3 gap-4 mb-6">
                
                
                
            </div>
            <div class="bg-white p-4 rounded-lg shadow">
                <div class="flex justify-between items-center mb-4">
                    <div>
                        <h2 class="text-xl font-semibold">
                            All customers 
                        </h2>
                    </div>
                   
                </div>
                <table class="w-full text-left">
                    <thead>
                        <tr class="text-gray-600">
                            <th class="py-2">
                                Name
                            </th>
                            <th class="py-2">
                                Role
                            </th>
                            <th class="py-2">
                                Projects
                            </th>
                            <th class="py-2">
                                Status
                            </th>
                            <th class="py-2">
                                Enrolled
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border-t">
                            <td class="py-2 flex items-center">
                                <input class="mr-2" type="checkbox" />
                                <img alt="Profile picture of Arlene McCoy" class="h-10 w-10 rounded-full mr-2"
                                    src="https://placehold.co/40x40" />
                                <div>
                                    <div class="font-semibold">
                                        Arlene McCoy
                                    </div>
                                    <div class="text-gray-500">
                                        @arlenem
                                    </div>
                                </div>
                            </td>
                            <td class="py-2">
                                <span class="bg-blue-100 text-blue-800 px-2 py-1 rounded-lg">
                                    General
                                </span>
                            </td>
                            <td class="py-2">
                                12/25
                            </td>
                            <td class="py-2">
                                Active
                            </td>
                            <td class="py-2">
                                May 12, 2019
                            </td>
                        </tr>
                        <tr class="border-t">
                            <td class="py-2 flex items-center">
                                <input class="mr-2" type="checkbox" />
                                <img alt="Profile picture of Brooklyn Simmons" class="h-10 w-10 rounded-full mr-2"
                                    src="https://placehold.co/40x40" />
                                <div>
                                    <div class="font-semibold">
                                        Brooklyn Simmons
                                    </div>
                                    <div class="text-gray-500">
                                        @brooklyns
                                    </div>
                                </div>
                            </td>
                            <td class="py-2">
                                <span class="bg-pink-100 text-pink-800 px-2 py-1 rounded-lg">
                                    Admin
                                </span>
                            </td>
                            <td class="py-2">
                                18/50
                            </td>
                            <td class="py-2">
                                Active
                            </td>
                            <td class="py-2">
                                August 7, 2017
                            </td>
                        </tr>
                        <tr class="border-t">
                            <td class="py-2 flex items-center">
                                <input class="mr-2" type="checkbox" />
                                <img alt="Profile picture of Maribel Koss" class="h-10 w-10 rounded-full mr-2"
                                    src="https://placehold.co/40x40" />
                                <div>
                                    <div class="font-semibold">
                                        Maribel Koss
                                    </div>
                                    <div class="text-gray-500">
                                        @maribelk
                                    </div>
                                </div>
                            </td>
                            <td class="py-2">
                                <span class="bg-blue-100 text-blue-800 px-2 py-1 rounded-lg">
                                    General
                                </span>
                            </td>
                            <td class="py-2">
                                7/25
                            </td>
                            <td class="py-2">
                                Active
                            </td>
                            <td class="py-2">
                                May 9, 2014
                            </td>
                        </tr>
                        <tr class="border-t">
                            <td class="py-2 flex items-center">
                                <input class="mr-2" type="checkbox" />
                                <img alt="Profile picture of Cody Fisher" class="h-10 w-10 rounded-full mr-2"
                                    src="https://placehold.co/40x40" />
                                <div>
                                    <div class="font-semibold">
                                        Cody Fisher
                                    </div>
                                    <div class="text-gray-500">
                                        @codyf
                                    </div>
                                </div>
                            </td>
                            <td class="py-2">
                                <span class="bg-orange-100 text-orange-800 px-2 py-1 rounded-lg">
                                    Creator
                                </span>
                            </td>
                            <td class="py-2">
                                27/100
                            </td>
                            <td class="py-2">
                                Active
                            </td>
                            <td class="py-2">
                                October 24, 2018
                            </td>
                        </tr>
                        <tr class="border-t">
                            <td class="py-2 flex items-center">
                                <input class="mr-2" type="checkbox" />
                                <img alt="Profile picture of Darlene Robertson" class="h-10 w-10 rounded-full mr-2"
                                    src="https://placehold.co/40x40" />
                                <div>
                                    <div class="font-semibold">
                                        Darlene Robertson
                                    </div>
                                    <div class="text-gray-500">
                                        @darlener
                                    </div>
                                </div>
                            </td>
                            <td class="py-2">
                                <span class="bg-blue-100 text-blue-800 px-2 py-1 rounded-lg">
                                    General
                                </span>
                            </td>
                            <td class="py-2">
                                21/25
                            </td>
                            <td class="py-2">
                                Active
                            </td>
                            <td class="py-2">
                                March 6, 2015
                            </td>
                        </tr>
                        <tr class="border-t">
                            <td class="py-2 flex items-center">
                                <input class="mr-2" type="checkbox" />
                                <img alt="Profile picture of Cameron Williamson" class="h-10 w-10 rounded-full mr-2"
                                    src="https://placehold.co/40x40" />
                                <div>
                                    <div class="font-semibold">
                                        Cameron Williamson
                                    </div>
                                    <div class="text-gray-500">
                                        @cameronw
                                    </div>
                                </div>
                            </td>
                            <td class="py-2">
                                <span class="bg-blue-100 text-blue-800 px-2 py-1 rounded-lg">
                                    General
                                </span>
                            </td>
                            <td class="py-2">
                                6/25
                            </td>
                            <td class="py-2">
                                Active
                            </td>
                            <td class="py-2">
                                July 14, 2015
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
