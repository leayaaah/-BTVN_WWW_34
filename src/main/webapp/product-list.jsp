<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 9/24/2026
  Time: 1:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <style>
        /* Thiết lập bố cục lưới 3 cột */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Tạo 3 cột có chiều rộng bằng nhau */
            gap: 20px; /* Khoảng cách giữa các ô */
            padding: 20px 0;
            max-width: 1200px;
            margin: 0 auto; /* Canh giữa trang */
        }

        /* Định dạng từng thẻ sản phẩm */
        .product-class {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 15px;
            text-align: center; /* Canh giữa nội dung hình ảnh, text */
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            background-color: #fff;
        }

        /* Responsive cho hình ảnh */
        .hinh {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
            border-radius: 4px;
        }

        /* Định dạng form và nút bấm cơ bản */
        .product-class form {
            margin: 10px 0;
        }

        .product-class input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 5px;
        }

        .product-class input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .view-cart-link {
            display: inline-block;
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<p>
    <a href="cart" class="view-cart-link">View Cart</a>
</p>
<div class="product-grid">
    <c:forEach items="${products}" var="p">
        <div class="product-class">
            <b> ${p.model}</b>
            <br/>
            <img src="https://placehold.co/150x150?text=No+Image" class="hinh"> <br/>
            Price: ${p.price}<br/>
            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="number" style="width: 50px; text-align: center;" value="1" min="1" name="quantity"> <br/>
                <input type="hidden" name="id" value="${p.id}">
                <input type="hidden" name="price" value="${p.price}">
                <input type="hidden" name="model" value="${p.model}">
                <input type="hidden" name="action" value="add"><br/>
                <input type="submit" name="addToCart" value="Add To Cart"><br/>
            </form>
            <a href="${pageContext.request.contextPath}/product?id=${p.id}">Product Detail</a><br/>
        </div>
    </c:forEach>
</div>
</body>
</html>