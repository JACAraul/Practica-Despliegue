package hola;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;  
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/HolaServlet")                    
public class HolaServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body><h1>Despliegue Automatico Funcionando</h1></body></html>");
    }
}
