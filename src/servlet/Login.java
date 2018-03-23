package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Libro;
import model.LineaPedido;
import model.Tema;
import model.TemaDAO;
import model.Usuario;
import model.UsuarioDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = null;
		UsuarioDAO udao =  new UsuarioDAO();
		TemaDAO tdao = new TemaDAO();
		RequestDispatcher rd = null;
		List<Tema> listaTema = null;
		//List<LineaPedido> lineaPedido = new ArrayList<>();
		List<LineaPedido> lineaPedido = null;
		switch (request.getParameter("opcion")) {
		case "validar":
			//usuario = udao.findById(request.getParameter("usuario"));
			
			
			usuario = udao.findById(request.getParameter("usuario").toLowerCase());
			if(usuario!=null && usuario.getPassword().equals(request.getParameter("password").toLowerCase())){
				listaTema = tdao.findAll();
				if(usuario.getTipoUsuario().equals("ADMON")){
					request.setAttribute("usuario", usuario);
					request.getSession().setAttribute("usuario", usuario);
					request.getSession().setAttribute("listaTema", listaTema);
					rd = request.getRequestDispatcher("Admon.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("usuario", usuario);
					request.getSession().setAttribute("usuario", usuario);
					request.getSession().setAttribute("listaTema", listaTema);
					request.getSession().setAttribute("lineaPedido", lineaPedido);
					rd = request.getRequestDispatcher("MenuCliente.jsp");
					rd.forward(request, response);
				}
					
			}
			
			break;
			
		case "registrarBean":
			usuario = (Usuario)request.getAttribute("miusuario");
			usuario.setFechaAlta(new Date());
			if (udao.insertar(usuario) == 1){
				System.out.println("registrado : " + usuario);
				response.sendRedirect("index.jsp");
				}else{
					System.out.println("error insertar y existe");
					response.sendRedirect("index.jsp");
					}

					break;
					
		case"desconn" :
		request.getSession().invalidate();
		response.sendRedirect("index.jsp");			
		}
		
	
			
		
	}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	

}
