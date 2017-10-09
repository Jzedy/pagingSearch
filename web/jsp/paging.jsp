<%--
  Created by Jzedy on 2017/10/7
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/pagination.css">
    <script type="text/javascript" src="/static/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/jquery.pagination.js"></script>
    <script>

        function handlePaginationClick(new_page_index, pagination_container) {
            $("#userForm").attr("action","${ctx}/users?currentPage="+(new_page_index+1));
            $('#userForm').submit();
            return false;
        }
        $(document).ready(function () {
            $("#News-Pagination").pagination(${pagers.totalNums}, {
                items_per_page:${pagers.currentNums},
                current_pages:${pagers.currentPage}-1,
                next_text:"下一页",
                prev_text:"上一页",
                num_edge_entries:2,
                load_first_page: false,
                callback:handlePaginationClick
            });
        })
        $('.gender').val("${gender}")
    </script>
</head>
<body>
<div align="center">
    <form action="/users" method="post" class="userForm" id="userForm">
        姓名：<input type="text" name="username" class="username" value="${username}">
        性别：<select name="gender" class="gender"><option value="0">全部</option><option  value="1">男</option><option  value="2">女</option></select>
        <input type="submit" value="搜索" class="btn">
    </form>
</div>
<div align="center" class="dataMsg">
    <c:if test="${pagers.dataList eq null}">没有数据</c:if>
    <c:if test="${pagers.dataList != null}">
        <table border="1">
            <thead><td>id</td><td>姓名</td><td>性别</td><td>地址</td></thead>
            <c:forEach items="${pagers.dataList}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>
                        <c:if test="${user.gender eq 1}">男</c:if>
                        <c:if test="${user.gender eq 2}">女</c:if>
                    </td>
                    <td>${user.address}</td>
                </tr>
            </c:forEach>
        </table>
        <div id="News-Pagination"></div>
    </c:if>
</div>
</body>
</html>
