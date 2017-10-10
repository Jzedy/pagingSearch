<%--
  Created by Jzedy on 2017/10/9
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="/static/pagination.css" rel="stylesheet">
<script src="/static/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/static/jquery.pagination.js" type="text/javascript"></script>
<script>

    function handlePaginationClick(new_page_index, pagination_container) {
        $("#userForm").attr("action","${ctx}/users?currentPage="+(new_page_index+1));
        $('#userForm').submit();
        return false;
    }
    $(function () {
        $("#News-Pagination").pagination(${pager.totalNums}, {
            items_per_page:${pager.showNums},
            current_page:${pager.currentPage}-1,
            num_display_entries:8,
            next_text:"下一页",
            prev_text:"上一页",
            num_edge_entries:2,
            load_first_page: false,
            callback:handlePaginationClick
        });
        $('#gender').val("${gender}")
    })
</script>
<body>
    <div style="margin-left: 100px ;margin-top: 100px;">
        <form action="/users" method="post" id="userForm">
            姓名：<input type="text" name="username" value="${username}">&nbsp;
            性别：<select name="gender" id="gender">
            <option value="0">全部</option>
            <option value="1">男</option>
            <option value="2">女</option></select>&nbsp;
            <input type="submit" value="查询">
        </form>
        <br>
            显示列表：<br>
        <br>
        
        <c:if test="${pager.dataList eq null}">没有数据</c:if>
        <c:if test="${pager.dataList!=null}">
            <table border="1"  style="border-collapse: collapse">
                <thead>
                <tr height="30">
                    <td width="130">ID</td>
                    <td width="130">姓名</td>
                    <td width="130">性别</td>
                    <td width="130">地址</td>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pager.dataList}" var="user">
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
                </tbody>
            </table>
            <br>
            <div id="News-Pagination"></div>
        </c:if>
    </div>

</body>
</html>
