<%--
  Created by Jzedy on 2017/10/7
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/jquery-3.2.1.min.js"></script>
    <link href="/static/pagination.css">
    <script src="/static/jquery.pagination.js"></script>
    <script>
        $(function () {
            $('.gender').val('${gender}')

        })
        var totalPages = ${pager.totalPages}
            currentPage = ${pager.currentPage}
        function submit(url) {
            $('#userForm').attr('action',url)
            $('#userForm').submit();
        }
        function homePage() {
            if (currentPage==1){
                return;
            }
            submit('${ctx}/users?currentPage=1')
        }
        function prevPage() {
            if (currentPage==1){
                alert('已经是第一页')
                return;
            }
            submit("${ctx}/users?currentPage="+(${pager.currentPage}-1));
        }
        function nextPage() {
            if (currentPage==totalPages){
                alert('已经是最后页')
                return;
            }
            submit("${ctx}/users?currentPage="+(${pager.currentPage}+1));
        }

        function lastPage() {
            if (currentPage==totalPages) return;
            submit("${ctx}/users?currentPage="+${pager.totalPages});
        }

        <%--function handlePaginationClick(new_page_index, pagination_container) {--%>
            <%--$("#userForm").attr("action","${ctx}/users?currentPage="+(new_page_index+1));--%>
            <%--$('#userForm').submit();--%>
            <%--return false;--%>
        <%--}--%>

        <%--$(function () {--%>
            <%--$("#News-Pagination").pagination(${pager.totalNums}, {--%>
                <%--items_per_page:${pager.showNums},--%>
                <%--current_pages:${pager.currentPage}-1,--%>
                <%--next_text:"下一页",--%>
                <%--prev_text:"上一页",--%>
                <%--num_edge_entries:2,--%>
                <%--load_first_page: false,--%>
                <%--callback:handlePaginationClick--%>
            <%--});--%>
            <%--$('.gender').val('${gender}')--%>
        <%--});--%>
    </script>
</head>
<body>
    <div>
    <div align="center">
        <form action="/users" method="post" class="userForm" id="userForm">
            姓名：<input type="text" name="username" class="username" value="${username}">
            性别：<select name="gender" class="gender" ><option value="0">全部</option><option  value="1">男</option><option  value="2">女</option></select>
            <input type="submit" value="搜索">
        </form>
    </div>
    <div align="center" class="dataMsg">
        <c:if test="${pager.dataList eq null}">没有数据</c:if>
        <c:if test="${pager.dataList != null}">
            <table border="1">
                <thead><td>id</td><td>姓名</td><td>性别</td><td>地址</td></thead>
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
            </table>
            <div align="center">
                共${pager.totalNums}条记录&nbsp;&nbsp;${pager.totalPages}页&nbsp;&nbsp;
                当前第${pager.currentPage}页
                <a href="#" onclick="homePage()">首页</a>
                <a href="#" onclick="prevPage()">上一页</a>
                <a href="#" onclick="nextPage()">下一页</a>
                <a href="#" onclick="lastPage()">尾页</a>
            </div>
            <%--<div id="News-Pagination"></div>--%>
        </c:if>
    </div>
    </div>
</body>
</html>
