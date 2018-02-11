<%@ page import="java.util.List" %>

<%--
Внутри такой конструкции мы получаем доступ к нескольким переменным:
request — наш объект запроса, который мы передали из сервлета, где он назывался просто req;
responce — объект ответа, в сервлете назывался resp;

out — объект типа JspWriter (наследуется от обычного Writer), при помощи которого можем «писать» что-либо прямо в саму html-страничку.
Запись out.println(«Hello world!») очень похожа на запись System.out.println(«Hello world!»), но не путайте их!
out.println() «пишет» в html-страничку, а System.out.println — в системный вывод. Если вызвать внутри раздела с Java-кодом
jsp-метод System.out.println() — то результаты увидите в консоли Tomcat, а не на страничке.
--%>


<%--
<ul>
    <%
        List<String> names = (List<String>) request.getAttribute("userNames");

        if (names != null && !names.isEmpty()) {
            for (String s : names) {
                out.println("<li>" + s + "</li>");
            }
        }
    %>
</ul>--%>


<%--
Если нужно выводить список только в том случае, когда есть пользователи, а иначе выводить
предупреждение, что пользователей пока нет, можем немного переписать этот участок:--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <link rel="stylesheet" href="styles/w3.css"> <%--стиль наш вписали который в файле w3.css - а туда мы его скачали, теперь всталяем везде в head--%>

</head>

<body>
<div>
    <h1>Super app!</h1>
</div>

<div>
    <div>
        <div>
            <h2>Users</h2>
        </div>
        <%
            List<String> names = (List<String>) request.getAttribute("userNames");

            if (names != null && !names.isEmpty()) {
                out.println("<ui>");
                for (String s : names) {
                    out.println("<li>" + s + "</li>");
                }
                out.println("</ui>");
            } else out.println("<p>There are no users yet!</p>");
        %>
    </div>
</div>

<div class="w3-container">
    <button class="w3-button w3-yellow w3-border w3-border-red w3-round-large"  onclick="location.href='/'">Back to main</button>
</div>
</body>
</html>
