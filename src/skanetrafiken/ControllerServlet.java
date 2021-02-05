package skanetrafiken;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// public String URL = "http://www.labs.skanetrafiken.se/v2.2/neareststation.asp?x=6167930&y=1323215&Radius=500";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String coordinateX = request.getParameter("x");
		String coordinateY = request.getParameter("y");
		
		String URLtoSend = "http://www.labs.skanetrafiken.se/v2.2/neareststation.asp?x=" + coordinateX + "&y=" + coordinateY + "&Radius=500";
		
		
		URL line_api_url = new URL(URLtoSend);
		
		HttpURLConnection linec = (HttpURLConnection)line_api_url.openConnection();
		
		linec.setDoInput(true);
		linec.setDoOutput(true);
		linec.setRequestMethod("GET");
		
		BufferedReader in = new BufferedReader(new InputStreamReader(linec.getInputStream()));
		
		String inputLine;
		String ApiResponse = "";
		
		while((inputLine = in.readLine()) != null) {
			ApiResponse+=inputLine;
		}

		in.close();
		System.out.println(ApiResponse);
		
		Document doc = convertStringToXMLDocument(ApiResponse);
		
		doc.getDocumentElement().normalize();
		
		System.out.println("Root ele: " + doc.getDocumentElement().getNodeName());
		
		
		NodeList nList = doc.getElementsByTagName("Name");
		
		out.print("The nearest stations are: ");

		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node node = nList.item(temp);
			if(node.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element) node;;
				
				out.println(eElement.getTextContent());
			}
		}
	}

	private Document convertStringToXMLDocument(String xmlString) {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance( );
		
		DocumentBuilder builder = null; 
		
		try {
			builder = factory.newDocumentBuilder();
			
			Document doc = builder.parse(new InputSource(new StringReader(xmlString)));
			
			return doc;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
