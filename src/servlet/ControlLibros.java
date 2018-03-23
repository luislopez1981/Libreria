package servlet;

import java.io.IOException;
import java.math.BigDecimal;
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

/**
 * Servlet implementation class ControlLibros
 */
@WebServlet("/ControlLibros")
public class ControlLibros extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControlLibros() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<LineaPedido> carrito = null;
		

		switch (request.getParameter("opcion")) {
		case "eligeLibros":
			List<Libro> listaLibro = null;
			RequestDispatcher rd = null;
			TemaDAO tdao = new TemaDAO();
			Tema tema1 = new Tema();

			tema1 = tdao.findById(Long.valueOf(request.getParameter("tema")));

			listaLibro = tdao.getListaLibro(tema1);
			request.getSession().setAttribute("listaLibro", listaLibro);
			rd = request.getRequestDispatcher("ElegirLibros.jsp");
			rd.forward(request, response);
			break;

		case "desconn":
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
			break;

		case "addLibros":

			List<LineaPedido> lineaPedido = null;
			if (request.getSession().getAttribute("lineaPedido") == null) {
				lineaPedido = new ArrayList<>();
			} else {
				lineaPedido = (List<LineaPedido>) request.getSession().getAttribute("lineaPedido");
			}

			LineaPedido linea = null;
			Libro libro = null;
			LibroDAO ldao = null;
			
			if(request.getParameterValues("libroElegido")!=null){
				String[] lista = request.getParameterValues("libroElegido");
			for (String ele : lista) {
				ldao = new LibroDAO();
				linea = new LineaPedido();
				libro = new Libro();
				libro = ldao.findById(ele);
				linea.setLibro(libro);
				linea.setCantidad(BigDecimal.valueOf(1));
				linea.setPrecioVenta(libro.getPrecioUnitario());
				if (!lineaPedido.contains(linea))
					lineaPedido.add(linea);

			}
			request.getSession().setAttribute("lineaPedido", lineaPedido);
			rd = request.getRequestDispatcher("Carrito.jsp");
			rd.forward(request, response);
				
			}else{
				
				rd = request.getRequestDispatcher("ElegirLibros.jsp");
				rd.forward(request, response);
			}
			
			break;

		case "borrar":
			((List<LineaPedido>) request.getSession().getAttribute("lineaPedido"))
					.remove(Integer.parseInt(request.getParameter("isbn")));
			request.getRequestDispatcher("Carrito.jsp").forward(request, response);
			break;

		case "vaciar":
			carrito = (List<LineaPedido>) request.getSession().getAttribute("lineaPedido");
			if(carrito!=null){
				carrito.clear();
				request.getRequestDispatcher("Carrito.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("Carrito.jsp").forward(request, response);
				
			}
			
			
			break;
		case "comprar":
			Pedido pedido = new Pedido();
			PedidoDAO pdao = new PedidoDAO();

			pedido.setUsuario((Usuario) request.getSession().getAttribute("usuario"));
			pedido.setDireccionEntrega(((Usuario) request.getSession().getAttribute("usuario")).getDireccion());
			pedido.setEstado("Comprado");
			pedido.setFechaAlta(new Date());
			carrito = (List<LineaPedido>) request.getSession().getAttribute("lineaPedido");

			if (carrito!=null) {
				for (LineaPedido ele : carrito) {
					ele.setPedido(pedido);

				}

				pedido.setLineaPedidos(carrito);

				if (pdao.insertar(pedido) == 1) {
					System.out.println("registrado : " + pedido);
					request.getSession().removeAttribute("lineaPedido");
					response.sendRedirect("MenuCliente.jsp");
				} else {
					System.out.println("error insertar y existe");
					request.getRequestDispatcher("Carrito.jsp").forward(request, response);
				}

			} else {
				request.getRequestDispatcher("Carrito.jsp").forward(request, response);
			}

			break;
			default:
				System.out.println("se sale por 'servlet ControlLibros'");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
