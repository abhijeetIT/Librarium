<%@ page import="java.util.*" %>
<%@ page import="model.Book" %>
<%@ page import="dao.BookDAO" %>

<%
    List<Book> books = new BookDAO().getAllBooks();
%>

<!DOCTYPE html>
<html>
<head>

    <title>Admin Dashboard</title>

    <style>

        body{
            margin:0;
            padding:20px;
            background:#f5f7fb;
            font-family:Arial;
        }

        h1{
            margin-bottom:20px;
        }

        .top-bar{
            display:flex;
            justify-content:space-between;
            margin-bottom:20px;
        }

        button{
            border:none;
            padding:10px 18px;
            border-radius:8px;
            cursor:pointer;
        }

        .add-btn{
            background:#2563eb;
            color:white;
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:white;
            border-radius:10px;
            overflow:hidden;
        }

        th{
            background:#111827;
            color:white;
        }

        th,td{
            padding:14px;
            text-align:left;
            border-bottom:1px solid #eee;
        }

        img{
            width:60px;
            height:90px;
            object-fit:cover;
            border-radius:6px;
        }

        .edit-btn{
            background:#f59e0b;
            color:white;
        }

        .delete-btn{
            background:#ef4444;
            color:white;
        }

        .modal{
            position:fixed;
            inset:0;
            background:rgba(0,0,0,.5);
            display:none;
            justify-content:center;
            align-items:center;
        }

        .modal-content{
            background:white;
            width:400px;
            padding:25px;
            border-radius:12px;
        }

        input{
            width:100%;
            margin-bottom:12px;
            padding:10px;
            border:1px solid #ccc;
            border-radius:6px;
        }

    </style>

</head>

<body>

<div class="top-bar">

    <h1>Admin Dashboard</h1>

    <button class="add-btn"
            onclick="openAddModal()">
        + Add Book
    </button>

    <a href="${pageContext.request.contextPath}/admin/orders">
        Manage Orders
    </a>

</div>

<table>

    <tr>
        <th>ID</th>
        <th>Image</th>
        <th>Title</th>
        <th>Author</th>
        <th>Category</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>

    <% for(Book b : books){ %>

    <tr id="row-<%= b.getId() %>">

        <td><%= b.getId() %></td>

        <td>
            <img src="<%= request.getContextPath() %>/<%= b.getImageUrl() %>">
        </td>

        <td><%= b.getTitle() %></td>

        <td><%= b.getAuthor() %></td>

        <td><%= b.getCategory() %></td>

        <td>Rs.<%= b.getPrice() %></td>

        <td>

            <button class="edit-btn"

                onclick="openEditModal(
                    '<%= b.getId() %>',
                    '<%= b.getTitle() %>',
                    '<%= b.getAuthor() %>',
                    '<%= b.getCategory() %>',
                    '<%= b.getPrice() %>',
                    '<%= b.getImageUrl() %>'
                )">

                Edit

            </button>

            <button class="delete-btn"
                    onclick="deleteBook(<%= b.getId() %>)">

                Delete

            </button>

        </td>

    </tr>

    <% } %>

</table>

<!-- ================= MODAL ================= -->

<div class="modal" id="modal">

    <div class="modal-content">

        <h2 id="modalTitle">Add Book</h2>

        <input type="hidden" id="bookId">

        <input type="text"
               id="title"
               placeholder="Title">

        <input type="text"
               id="author"
               placeholder="Author">

        <input type="text"
               id="category"
               placeholder="Category">

        <input type="number"
               id="price"
               placeholder="Price">

        <input type="text"
               id="imageUrl"
               placeholder="Image URL">

        <button class="add-btn"
                onclick="saveBook()">
            Save
        </button>

    </div>

</div>

<script>

    let editMode = false;

    function openAddModal(){

        editMode = false;

        document.getElementById("modal").style.display = "flex";

        clearFields();
    }

    function openEditModal(id,title,author,category,price,imageUrl){

        editMode = true;

        document.getElementById("modal").style.display = "flex";

        document.getElementById("bookId").value = id;
        document.getElementById("title").value = title;
        document.getElementById("author").value = author;
        document.getElementById("category").value = category;
        document.getElementById("price").value = price;
        document.getElementById("imageUrl").value = imageUrl;
    }

    function clearFields(){

        document.getElementById("bookId").value="";
        document.getElementById("title").value="";
        document.getElementById("author").value="";
        document.getElementById("category").value="";
        document.getElementById("price").value="";
        document.getElementById("imageUrl").value="";
    }

    function saveBook(){

        let data = new URLSearchParams();

        data.append(
            "action",
            editMode ? "update" : "add"
        );

        data.append(
            "id",
            document.getElementById("bookId").value
        );

        data.append(
            "title",
            document.getElementById("title").value
        );

        data.append(
            "author",
            document.getElementById("author").value
        );

        data.append(
            "category",
            document.getElementById("category").value
        );

        data.append(
            "price",
            document.getElementById("price").value
        );

        data.append(
            "imageUrl",
            document.getElementById("imageUrl").value
        );

        fetch(
            "<%= request.getContextPath() %>/admin/book",
            {
                method:"POST",
                body:data
            }
        )
        .then(res=>res.text())
        .then(data=>{

            alert(data);

            location.reload();
        });
    }

    function deleteBook(id){

        if(!confirm("Delete this book?"))
            return;

        let data = new URLSearchParams();

        data.append("action","delete");
        data.append("id",id);

        fetch(
            "<%= request.getContextPath() %>/admin/book",
            {
                method:"POST",
                body:data
            }
        )
        .then(res=>res.text())
        .then(data=>{

            document
                .getElementById("row-"+id)
                .remove();

            alert(data);
        });
    }

</script>

</body>
</html>