package hola;

import jakarta.*;
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
