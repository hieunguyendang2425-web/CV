<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ Sơ Cá Nhân - ${profile.name}</title>
    <!-- Tải Tailwind CSS qua CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <style>
        /* Đảm bảo font Inter được sử dụng */
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f7f9;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<body class="antialiased">

    <!-- Thanh Điều Hướng (Navigation) -->
    <nav class="bg-white shadow-lg sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16 items-center">
                <div class="flex items-center">
                    <a href="#home" class="text-2xl font-bold text-indigo-600 hover:text-indigo-800 transition duration-300">
                        ${profile.name}
                    </a>
                </div>
                <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
                    <a href="#about" class="text-gray-900 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition duration-300">Về Tôi</a>
                    <a href="#skills" class="text-gray-900 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition duration-300">Kỹ Năng</a>
                    <a href="#contact" class="text-gray-900 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition duration-300">Liên Hệ</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Phần Trang Chủ (Home) -->
    <section id="home" class="pt-16 pb-24 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col lg:flex-row items-center justify-between">
            <!-- Cột Trái: Thông tin động -->
            <div class="lg:w-1/2 text-center lg:text-left mb-10 lg:mb-0">
                <p class="text-xl text-gray-500 mb-2">Xin chào, tôi là</p>
                <h1 class="text-5xl md:text-6xl font-extrabold text-gray-900 leading-tight">
                    ${profile.name}
                </h1>
                <h2 class="text-3xl font-semibold text-indigo-600 mt-3 mb-6">
                    ${profile.title}
                </h2>
                <p class="text-lg text-gray-600 mb-8 max-w-lg lg:max-w-none mx-auto lg:mx-0">
                    ${profile.heroSummary}
                </p>
                <a href="#contact" class="inline-flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-full shadow-lg text-white bg-indigo-600 hover:bg-indigo-700 transition duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
                    Liên Hệ Với Tôi
                </a>
            </div>
            <!-- Cột Phải: Ảnh placeholder -->
            <div class="lg:w-1/2 flex justify-center">
                <img src="/CV/img/anhcanhan.jpg" 
                    alt="Ảnh Chân Dung Cá Nhân ${profile.name}" 
                    class="w-80 h-80 object-cover rounded-full shadow-2xl border-4 border-white transform hover:rotate-3 transition duration-500" 
                    onerror="this.onerror=null; this.src='https://placehold.co/400x400/312e81/ffffff?text=${profile.name}';"
                >
            </div>
        </div>
    </section>

    <!-- Phần Về Tôi (About) -->
    <section id="about" class="py-20 bg-gray-50">
        <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
            <h2 class="text-4xl font-bold text-center text-gray-900 mb-4">Về Tôi</h2>
            <div class="h-1 w-20 bg-indigo-600 mx-auto mb-10 rounded-full"></div>
            <div class="bg-white p-8 md:p-12 rounded-xl shadow-xl">
                <p class="text-gray-700 text-lg mb-4">
                    ${profile.aboutSummary}
                </p>
                <ul class="list-disc list-inside text-gray-600 text-base space-y-2 ml-4">
                    <!-- Lặp qua danh sách chi tiết Về Tôi -->
                    <c:forEach var="detail" items="${profile.aboutDetails}">
                        <li>${detail}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </section>

    <!-- Phần Kỹ Năng (Skills) -->
    <section id="skills" class="py-20">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <h2 class="text-4xl font-bold text-center text-gray-900 mb-4">Bộ Kỹ Năng</h2>
            <div class="h-1 w-20 bg-indigo-600 mx-auto mb-10 rounded-full"></div>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                <!-- Lặp qua danh sách Kỹ Năng -->
                <c:forEach var="skill" items="${profile.skills}" varStatus="loop">
                    <!-- Xác định icon và màu sắc dựa trên styleClass (ví dụ: blue-500) -->
                    <c:set var="icon" value=""/>
                    <c:choose>
                        <c:when test="${skill.styleClass eq 'blue-500'}"><c:set var="icon" value='<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"/>'/></c:when>
                        <c:when test="${skill.styleClass eq 'green-500'}"><c:set var="icon" value='<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c1.657 0 3 .895 3 2s-1.343 2-3 2l-3 3-3-3c-1.657 0-3-.895-3-2s1.343-2 3-2h4z"/>'/></c:when>
                        <c:when test="${skill.styleClass eq 'red-500'}"><c:set var="icon" value='<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7h16M4 7l4 4m0 0l4-4m-4 4v10m0-4h4"/>'/></c:when>
                        <c:otherwise><c:set var="icon" value='<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>'/></c:otherwise>
                    </c:choose>
                    
                    <div class="card-hover bg-white p-6 rounded-lg shadow-md border-t-4 border-${skill.styleClass} text-center transition duration-300">
                        <!-- Icon SVG -->
                        <svg class="w-10 h-10 mx-auto mb-3 text-${skill.styleClass}" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            ${icon}
                        </svg>
                        <h3 class="text-xl font-semibold text-gray-800">${skill.title}</h3>
                        <p class="text-gray-500 text-sm">${skill.description}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- Phần Liên Hệ (Contact) -->
    <section id="contact" class="py-20 bg-white">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            <h2 class="text-4xl font-bold text-center text-gray-900 mb-4">Liên Hệ Với Tôi</h2>
            <div class="h-1 w-20 bg-indigo-600 mx-auto mb-10 rounded-full"></div>
            <div class="bg-gray-50 p-8 rounded-xl shadow-xl">
                <p class="text-lg text-gray-700 text-center mb-8">
                    Tôi luôn sẵn lòng thảo luận về các cơ hội hợp tác hoặc dự án mới. Hãy gửi email cho tôi!
                </p>
                <div class="space-y-6">
                    <!-- Email -->
                    <div class="flex items-center space-x-4">
                        <svg class="w-8 h-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
                        <span class="text-xl text-gray-800 font-medium">${profile.email}</span>
                    </div>
                    <!-- Điện thoại -->
                    <div class="flex items-center space-x-4">
                        <svg class="w-8 h-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h14a2 2 0 012 2v10a2 2 0 01-2 2h-1a2 2 0 00-2 2v-2a2 2 0 00-2-2H9a2 2 0 00-2 2v2a2 2 0 00-2-2H5a2 2 0 01-2-2V5z"></path></svg>
                        <span class="text-xl text-gray-800 font-medium">${profile.phone}</span>
                    </div>
                    <!-- Địa điểm -->
                    <div class="flex items-center space-x-4">
                        <svg class="w-8 h-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.828 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                        <span class="text-xl text-gray-800 font-medium">${profile.location}</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-800 py-6">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center text-gray-400">
            <p>&copy; 2024. Được thiết kế và xây dựng bởi ${profile.name}.</p>
            <div class="flex justify-center space-x-6 mt-3">
                <a href="#" target="_blank" class="text-gray-400 hover:text-indigo-400 transition duration-300">LinkedIn</a>
                <a href="#" target="_blank" class="text-gray-400 hover:text-indigo-400 transition duration-300">GitHub</a>
                <a href="#" target="_blank" class="text-gray-400 hover:text-indigo-400 transition duration-300">Facebook</a>
            </div>
        </div>
    </footer>

</body>
</html>
