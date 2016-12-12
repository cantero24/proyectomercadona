package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.MysqlConnect;

/**
 * Servlet implementation class pedidos
 */
@WebServlet("/pedidos")
public class pedidos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pedidos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		MysqlConnect c = MysqlConnect.getDbCon();
		ResultSet rs = null;

		
		String id = (String) request.getSession().getAttribute("id");
		try {
			
			rs = c.query("select * FROM pedido Where cliente_id=" + id + "  and confirmado=0");

			int pedido_id;
			if (!rs.next()) {
				//String fp = request.getParameter("fecha_pedido");
				pedido_id = c.insert("INSERT INTO pedido ( confirmado, cliente_id) VALUES " + "( '0', '" + id + "');");
			}
			else {
				pedido_id = Integer.parseInt(rs.getString("id"));
			}

			
			String producto_id = request.getParameter("id");

			c.insert("INSERT INTO pedido_producto ( predido_id, producto_id)" + " VALUES ('" + pedido_id + "', '" + producto_id
					+ "');");
			request.setAttribute("resultados", rs);
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.sendRedirect("producto");
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
