<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <title>Manage Orders</title>

    <style>

        body{
            font-family: Arial;
            background:#f5f5f5;
            padding:30px;
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:white;
        }

        th,td{
            border:1px solid #ddd;
            padding:12px;
            text-align:center;
        }

        th{
            background:#222;
            color:white;
        }

        select{
            padding:6px;
        }

        button{
            padding:8px 12px;
            background:#222;
            color:white;
            border:none;
            cursor:pointer;
        }

    </style>

</head>
<body>

<h2>Manage Orders</h2>

<table>

    <tr>

        <th>ID</th>

        <th>User</th>

        <th>Email</th>

        <th>Phone</th>

        <th>Book</th>

        <th>Total</th>

        <th>Address</th>

        <th>Status</th>

        <th>Action</th>

    </tr>

    <c:forEach var="o" items="${orders}">

        <tr>

            <td>${o.id}</td>

            <td>${o.userName}</td>

            <td>${o.userEmail}</td>

            <td>${o.phone}</td>

            <td>${o.bookTitle}</td>

            <td>₹${o.totalPrice}</td>

            <td>${o.address}</td>

            <td>

                <select id="status-${o.id}">

                    <option value="PLACED"
                        ${o.status=='PLACED'?'selected':''}>
                        PLACED
                    </option>

                    <option value="SHIPPED"
                        ${o.status=='SHIPPED'?'selected':''}>
                        SHIPPED
                    </option>

                    <option value="DELIVERED"
                        ${o.status=='DELIVERED'?'selected':''}>
                        DELIVERED
                    </option>

                    <option value="CANCELLED"
                        ${o.status=='CANCELLED'?'selected':''}>
                        CANCELLED
                    </option>

                    <option value="REJECTED"
                        ${o.status=='REJECTED'?'selected':''}>
                        REJECTED
                    </option>

                </select>

            </td>

            <td>

                <button onclick="updateStatus(${o.id})">
                    Update
                </button>

            </td>

        </tr>

    </c:forEach>

</table>

<script>

    function updateStatus(orderId){

        let status =
            document.getElementById(
                "status-" + orderId
            ).value;

        fetch(
            "${pageContext.request.contextPath}/admin/orders",
            {
                method:"POST",

                headers:{
                    "Content-Type":
                    "application/x-www-form-urlencoded"
                },

                body:
                    "orderId=" + orderId
                    + "&status=" + status
            }
        )

        .then(res => res.text())

        .then(data => {

            if(data.trim() === "success"){

                alert("Status Updated");

            }else{

                alert("Failed");
            }
        });
    }

</script>

</body>
</html>