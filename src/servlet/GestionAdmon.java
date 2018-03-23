package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import model.LibroDAO;
import model.LineaPedido;
import model.Pedido;
import model.PedidoDAO;
import model.Tema;
import model.TemaDAO;
import model.Usuario;
import model.UsuarioDAO;

/**
 * Servlet implementation class GestionAdmon
 */
@WebServlet("/GestionAdmon")
public class GestionAdmon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionAdmon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		Tema tema = null;
		TemaDAO tdao = new TemaDAO();
		PedidoDAO pdao = null;
		List<Pedido> listaPedido = null;
		
		switch (request.getParameter("opcion")) {
		case "altaTemaBean":
			tema = (Tema)request.getAttribute("mitema");
			if (tdao.insertar(tema) == 1){
				System.out.println("registrado : " + tema);
				response.sendRedirect("AltaTemas.jsp");
				}else{
					System.out.println("error insertar y existe");
					response.sendRedirect("Admon.jsp");
					}
			break;

			
		case "altaLibro":
			Libro libro = new Libro();
			LibroDAO ldao = new LibroDAO();
			TemaDAO tdao2 = new TemaDAO();
			
			libro.setAutor(request.getParameter("autor"));
			libro.setIsbn(request.getParameter("isbn"));
			libro.setPrecioUnitario(new BigDecimal(request.getParameter("precioUnitario")));
			libro.setStock(new BigDecimal(request.getParameter("stock")));
			libro.setTema(tdao2.findById(new Long(request.getParameter("tema"))));
			libro.setTitulo(request.getParameter("titulo"));
			if (ldao.insertar(libro)==1) {
				System.out.println("registrado : " + libro);
				response.sendRedirect("Admon.jsp");
				
			} else {
				System.out.println("error insertar porque existe");
				response.sendRedirect("Admon.jsp");
			}	
				
			
			break;
			
		case "listarPedidos": 
			SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
			Date fecha = null;
			 pdao = new PedidoDAO();
			listaPedido = new ArrayList<>();
			try {
				fecha = formato.parse(request.getParameter("fecha"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				listaPedido = pdao.findByDate(fecha);
				request.setAttribute("listaPedido", listaPedido);
				request.setAttribute("fecha2", fecha);
				rd = request.getRequestDispatcher("ListarPedidos.jsp");
				rd.forward(request, response);
			
			break;	
		case "desconn":
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
			break;	
			
		case "cliente":
			UsuarioDAO udao = new UsuarioDAO();
			pdao = new PedidoDAO();
			Usuario usuario = udao.findById(request.getParameter("usuario2"));
			//listaPedido =pdao.findbyUser(usuario);
			if(usuario!=null){
				Object [] estadistica = pdao.estadisticaCliente(usuario);
				
				request.getSession().setAttribute("usuario3", usuario);
				request.getSession().setAttribute("estadistica", estadistica);
				rd = request.getRequestDispatcher("EstadisticaCliente.jsp");
				rd.forward(request, response);
				
			}else{
				response.sendRedirect("EstadisticaCliente.jsp");
			}
			
			
			break;
		case "cliente2":
			
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
