<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Shopper</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/46b998f154.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
<body class="bg-gray-100">
    <!-- Header Navigation Bar -->
    <header class="bg-white shadow-md">
        <div class="container mx-auto px-6 py-4 flex items-center justify-between">
            
            <!-- Logo -->
            <a href="/" class="text-2xl font-bold text-gray-800 flex items-center">
                <i class="fas fa-shopping-bag text-blue-500 mr-2"></i> E-Shopper
            </a>

            <!-- Search Bar -->
            <div class="hidden md:flex items-center border rounded-lg overflow-hidden w-1/3">
                <input type="text" class="w-full px-4 py-2 outline-none" placeholder="Search products...">
                <button class="bg-blue-500 px-4 py-2 text-white">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <!-- Navigation Links -->
            <nav class="hidden md:flex space-x-6 text-gray-700">
                <a href="#" class="hover:text-blue-500">Home</a>
                <a href="#" class="hover:text-blue-500">Shop</a>
                <a href="#" class="hover:text-blue-500">Deals</a>
                <a href="#" class="hover:text-blue-500">Contact</a>
            </nav>

            <!-- User & Cart Icons -->
            <div class="flex items-center space-x-4">
                <a href="#" class="text-gray-700 hover:text-blue-500">
                    <i class="far fa-user text-xl"></i>
                </a>
                <a href="#" class="relative text-gray-700 hover:text-blue-500">
                    <i class="fas fa-shopping-cart text-xl"></i>
                    <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs px-2 py-0.5 rounded-full">2</span>
                </a>
                <button class="md:hidden text-gray-700 text-2xl">
                    <i class="fas fa-bars"></i>
                </button>
            </div>

        </div>
    </header>

    <!-- Hero Section (Image Slider with Auto Change) -->
    <section x-data="{ activeSlide: 1, slides: 3, interval: null }"
    x-init="interval = setInterval(() => { activeSlide = activeSlide === slides ? 1 : activeSlide + 1 }, 5000)"
    class="relative w-full h-[500px] overflow-hidden">

    <!-- Slides -->
    <template x-for="slide in slides" :key="slide">
        <div class="absolute inset-0 transition-opacity duration-1000"
            x-show="activeSlide === slide"
            x-transition:enter="opacity-0"
            x-transition:enter-start="opacity-0"
            x-transition:enter-end="opacity-100">
            <img :src="[
                './assets/banner-1.jpg',
                './assets/banner-2.jpg',
                './assets/banner-3.jpg'
            ][slide - 1]" alt="Slide" class="w-full h-full object-cover">
            <div class="absolute top-0 left-0 w-full h-full bg-black bg-opacity-40 flex items-center">
                <div class="container mx-auto px-6 text-white">
                    <h2 class="text-4xl font-bold" x-text="[
                        'Discover the Best Deals',
                        'Latest Fashions Designs',
                        'Buy Some Home Essentials'
                    ][slide - 1]"></h2>
                    <p class="mt-2 text-lg" x-text="[
                        'Shop now and enjoy exclusive discounts on top brands.',
                        'Get the newest cloths at unbeatable prices.',
                        'Discover premium home essentials and furniture.'
                    ][slide - 1]"></p>
                    <a href="#" class="mt-4 inline-block bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600 transition">Shop Now</a>
                </div>
            </div>
        </div>
    </template>

    <!-- Navigation Arrows -->
    <button @click="activeSlide = activeSlide === 1 ? slides : activeSlide - 1"
        class="absolute left-5 top-1/2 transform -translate-y-1/2 text-white text-2xl bg-black bg-opacity-50 px-3 py-2 rounded-full hover:bg-opacity-75 transition">
        <i class="fas fa-chevron-left"></i>
    </button>

    <button @click="activeSlide = activeSlide === slides ? 1 : activeSlide + 1"
        class="absolute right-5 top-1/2 transform -translate-y-1/2 text-white text-2xl bg-black bg-opacity-50 px-3 py-2 rounded-full hover:bg-opacity-75 transition">
        <i class="fas fa-chevron-right"></i>
    </button>

    <!-- Dots Navigation -->
    <div class="absolute bottom-5 left-1/2 transform -translate-x-1/2 flex space-x-3">
        <template x-for="n in slides" :key="n">
            <button @click="activeSlide = n"
                class="w-3 h-3 rounded-full transition-all duration-300"
                :class="activeSlide === n ? 'bg-blue-500 scale-125' : 'bg-gray-300'"></button>
        </template>
    </div>

    </section>

    <!-- Featured Products Section -->
    <section class="container mx-auto px-6 py-10">
        <h2 class="text-3xl font-bold text-gray-800 mb-6">Featured Products</h2>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
            
            <c:forEach var="product" items="${products}">
	            <div class="bg-white shadow-lg rounded-lg overflow-hidden hover:scale-105 transition">
	                <img src="assets/products/${product.fileName}" alt="Product 1" class="w-full h-52 object-cover">
	                <div class="p-4">	
	                    <h3 class="text-lg font-semibold text-gray-800">${product.title}</h3>
	                    <p class="text-blue-500 font-bold mt-1">$${product.price}</p>
	                    <button class="mt-3 bg-blue-500 text-white px-4 py-2 rounded-lg w-full hover:bg-blue-600 transition">
	                        Add to Cart
	                    </button>
	                </div>
	            </div>
			</c:forEach>
        </div>
    </section>

    <!-- Footer Section -->
    <footer class="bg-black text-gray-400 py-10">
        <div class="container mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-8">
            
            <!-- Company Info -->
            <div>
                <h3 class="text-white text-lg font-bold mb-3 flex items-center">
                    <i class="fas fa-shopping-bag text-blue-500 mr-2"></i> E-Shopper
                </h3>
                <p class="text-sm">Your one-stop online store for the latest fashion, electronics, and more.</p>
            </div>

            <!-- Help Section -->
            <div>
                <h3 class="text-white text-lg font-bold mb-3">Help</h3>
                <ul class="space-y-2">
                    <li><a href="#" class="hover:text-white transition">Shipping & Delivery</a></li>
                    <li><a href="#" class="hover:text-white transition">Returns & Exchanges</a></li>
                    <li><a href="#" class="hover:text-white transition">FAQs</a></li>
                    <li><a href="#" class="hover:text-white transition">Contact Us</a></li>
                </ul>
            </div>

            <!-- My Account -->
            <div>
                <h3 class="text-white text-lg font-bold mb-3">My Account</h3>
                <ul class="space-y-2">
                    <li><a href="#" class="hover:text-white transition">Sign In</a></li>
                    <li><a href="#" class="hover:text-white transition">Order History</a></li>
                    <li><a href="#" class="hover:text-white transition">Wishlist</a></li>
                    <li><a href="#" class="hover:text-white transition">Track Order</a></li>
                </ul>
            </div>

            <!-- Social Media & Payment Methods -->
            <div>
                <h3 class="text-white text-lg font-bold mb-3">Follow Us</h3>
                <div class="flex space-x-4 mb-4">
                    <a href="#" class="text-gray-400 hover:text-white transition text-2xl"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="text-gray-400 hover:text-white transition text-2xl"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-gray-400 hover:text-white transition text-2xl"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-gray-400 hover:text-white transition text-2xl"><i class="fab fa-youtube"></i></a>
                </div>

                <h3 class="text-white text-lg font-bold mb-3">We Accept</h3>
                <div class="flex space-x-2">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png" alt="Visa" class="h-4">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg" alt="MasterCard" class="h-6">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg" alt="PayPal" class="h-5">
                </div>
            </div>

        </div>

        <!-- Credit Section -->
        <div class="border-t border-gray-700 mt-10 pt-5 text-center">
            <p class="text-sm">© 2025 E-Shopper. All rights reserved. Designed & Developed by <span class="text-blue-500">Anupa Prabhasara</span></p>
        </div>
    </footer>
</body>
</html>