package app.servlets;

import app.entities.User;
import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/add.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("pass");
        User user = new User(name, password);
        Model model = Model.getInstance();
        model.add(user);


       /* чтобы выводилось уведомление об успешном добавлении пользователя. Для этого в методе doPost() после того, как добавили
        нового пользователя в модель, можем добавить имя этого пользователя в атрибуты объекта req и передать управление обратно во вьюху add.jsp. А в ней уже сделать участок с Java-кодом, в котором происходит
        проверка, есть ли такой атрибут в запросе, и если да — то вывод сообщения о том, что пользователь успешно добавлен.
        Тут в конце метода doPost() мы устанавливаем атрибут с именем добавленного в модель пользователя, после чего вызываем метод doGet(), в который передаем текущие запрос и ответ. А метод doGet() уже передает
        управление во вьюху, куда и отправляет объект запроса с прикрепленным именем добавленного пользователя в качестве атрибута.
        */

        req.setAttribute("userName", name);
        doGet(req, resp);
    }
}
