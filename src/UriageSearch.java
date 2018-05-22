

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UriageSearch
 */
@WebServlet("/UriageSearch")
public class UriageSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UriageSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);


		HttpSession session = request.getSession();

		String name=request.getParameter("syouhinName");
		String category=request.getParameter("category");


		DBAccess db=new DBAccess();
		if(name=="" && category=="") {

			request.getRequestDispatcher("Uriage")
			.forward(request, response);

		}else {

		ArrayList<String[]> n = db.UriageSerch(name,category);
		session.setAttribute("URIAGE", n);

		request.getRequestDispatcher("uriage.jsp")
		.forward(request, response);
		}




	}

}
