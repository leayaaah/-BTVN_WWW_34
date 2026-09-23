<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 9/24/2026
  Time: 2:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Detail</title>
    <style>
        /* Reset cơ bản */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 20px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 28px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Định dạng khối thông tin sản phẩm (Card) */
        .product-card {
            background-color: #ffffff;
            width: 100%;
            max-width: 450px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 30px;
            list-style: none;
            margin-bottom: 25px;
        }

        /* Định dạng từng dòng thông tin */
        .product-card li {
            padding: 12px 0;
            border-bottom: 1px solid #eee;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
        }

        .product-card li:not(.product-image) strong {
            color: #555;
            font-weight: 600;
        }

        /* Xóa đường viền ở mục cuối cùng (hình ảnh) */
        .product-card li:last-child {
            border-bottom: none;
        }

        /* Định dạng hình ảnh sản phẩm */
        .product-image {
            display: flex;
            justify-content: center;
            padding-top: 25px !important;
        }

        .product-image img {
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }

        .product-image img:hover {
            transform: scale(1.05);
        }

        /* Định dạng nút quay lại */
        .back-link {
            display: inline-block;
            text-decoration: none;
            background-color: #3498db;
            color: #ffffff;
            padding: 12px 24px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 15px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .back-link:hover {
            background-color: #2980b9;
            box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
        }
    </style>
</head>
<body>

<h2>Product Detail</h2>

<c:if test="${not empty product}">
    <ul class="product-card">
        <li><strong>Id:</strong> <span>${product.id}</span></li>
        <li><strong>Model:</strong> <span>${product.model}</span></li>
        <li><strong>Description:</strong> <span>${product.description}</span></li>
        <li><strong>Quantity:</strong> <span>${product.quantity}</span></li>
        <li><strong>Price:</strong> <span>$${product.price}</span></li>

        <li class="product-image">
            <img src="https://placehold.co/150x150?text=No+Image"
                 alt="${product.model}" width="150"/>
        </li>
    </ul>
</c:if>

<p>
    <a href="${pageContext.request.contextPath}/product" class="back-link">Back to Product List</a>
</p>

</body>
</html>