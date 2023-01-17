/*
* @author HieuNT121
* @date 22 Mar 2021
*/
package fa.training.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fa.training.model.Employee;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
	private List<String> excludedRequests;
	private List<String> employeeRequests;
	private List<String> parkingRequests;
	private List<String> serviceRequests;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		excludedRequests = new ArrayList<>();
		excludedRequests.add(new String("/loginController"));
		excludedRequests.add(new String("/logoutController"));
		excludedRequests.add(new String(".js"));
		excludedRequests.add(new String(".css"));
		excludedRequests.add(new String(".woff"));
		excludedRequests.add(new String(".woff2"));
		excludedRequests.add(new String(".ttf"));

		employeeRequests = new ArrayList<>();
		employeeRequests.add(new String("/AddEmployeeController"));
		employeeRequests.add(new String("/DeleteEmployeeController"));
		employeeRequests.add(new String("/ViewListEmployee"));

		parkingRequests = new ArrayList<>();
		parkingRequests.add(new String("/AddCarController"));
		parkingRequests.add(new String("/AddParkingServlet"));
		parkingRequests.add(new String("/addOfficeController"));
		parkingRequests.add(new String("/DeleteCarController"));
		parkingRequests.add(new String("/DeleteParkingServlet"));
		parkingRequests.add(new String("/bookingOfficeController"));
		parkingRequests.add(new String("/DisplayListCarController"));
		parkingRequests.add(new String("/ViewParkingServlet"));

		serviceRequests = new ArrayList<>();
		serviceRequests.add(new String("/addTicketController"));
		serviceRequests.add(new String("/AddTripController"));
		serviceRequests.add(new String("/deleteTicketController"));
		serviceRequests.add(new String("/DeleteTripController"));
		serviceRequests.add(new String("/ticketListController"));
		serviceRequests.add(new String("/ViewTripController"));
		serviceRequests.add(new String("/TripListController"));
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();
		boolean loggedIn = session != null && session.getAttribute("LoggedIn") != null;
		String department = null;
		String userRequest = request.getRequestURI();
		if (loggedIn) {
			department = ((Employee) session.getAttribute("LoggedIn")).getDepartment();
		}
		if (department != null) {
			if (department.equals("Employee")
					&& (isValidEmployee(userRequest) || isValidRequest(userRequest))) {
				chain.doFilter(request, response);
			} else if (department.equals("Parking")
					&& (isValidParking(userRequest) || isValidRequest(userRequest))) {
				chain.doFilter(request, response);
			} else if (department.equals("Service")
					&& (isValidService(userRequest) || isValidRequest(userRequest))) {
				chain.doFilter(request, response);
			}else {
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
		} else if (isValidRequest(userRequest)) {
			chain.doFilter(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/loginController");
		}
	}

	private boolean isValidRequest(String request) {
		for (String excludedRequest : excludedRequests) {
			if (request.endsWith(excludedRequest)) {
				return true;
			}
		}
		return false;
	}

	private boolean isValidEmployee(String request) {
		for (String employeeRequests : employeeRequests) {
			if (request.endsWith(employeeRequests)) {
				return true;
			}
		}
		return false;
	}

	private boolean isValidParking(String request) {
		for (String parkingRequests : parkingRequests) {
			if (request.endsWith(parkingRequests)) {
				return true;
			}
		}
		return false;
	}

	private boolean isValidService(String request) {
		for (String serviceRequests : serviceRequests) {
			if (request.endsWith(serviceRequests)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
}
