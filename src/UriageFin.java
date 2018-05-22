

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UriageIn
 */
@WebServlet("/UriageFin")
public class UriageFin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UriageFin() {
        super();
        // TODO Auto-generated constructor stub
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

	try {
		String syouID = request.getParameter("syouID");
		String day = request.getParameter("day");
		String salNum = request.getParameter("salNum");
		String tanka = request.getParameter("tanka");
		String br= request.getParameter("break");



		//テキストに入力されていない項目があった場合の処理
		if(syouID != "" && day != "" && salNum != "" && tanka != "") {

		String hason;

		if(br != null && br.equals("hason")) {
			hason="1";
		}else {
			hason="0";

		}
		String[] ymd=day.split("/");
		if(ymd.length >= 3) {
			String day2 = ymd[0] + ymd[1];

			int id = Integer.parseInt(syouID);
			int date = Integer.parseInt(day2);
			int num = Integer.parseInt(salNum);
			int tan = Integer.parseInt(tanka);

			int i = Integer.parseInt(tanka);
			int n = Integer.parseInt(salNum);

			DBAccess da=new DBAccess();

			int tax=da.getTax();
			int taxOnly=i*tax/100;
			int taxIn=i+taxOnly;


			da.register(syouID, day, salNum,tanka,hason,taxIn);
			int salNum2=-n;
			da.zaikoReduce(syouID, salNum2);

			request.getRequestDispatcher("uriageFin.jsp")
			.forward(request, response);
		}else {
			request.getRequestDispatcher("uriageErr.jsp")
			.forward(request, response);
		}


		}else {
			request.getRequestDispatcher("uriageErr.jsp")
			.forward(request, response);
		}
	}catch (NumberFormatException e) {
		request.getRequestDispatcher("uriageErr.jsp")
		.forward(request, response);
	}
	}

}