package com.vast.web;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.vast.dao.LearnfinityDao;
import com.vast.dao.UserDao;

/**
 * Servlet implementation class LearnfinityServlet
 */
//@WebServlet("/LearnfinityServlet")
public class LearnfinityServlet extends HttpServlet {
	public static Logger logger=Logger.getLogger("vast");
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LearnfinityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void init()
    {
    	LearnfinityDao dao=UserDao.getDaoInstance();
    	Map<String, String> eventMap=readUriMappings();
		logger.debug(eventMap);
		getServletContext().setAttribute("mappings", eventMap);
		Map<String, Action> map=new HashMap<>();
		getServletContext().setAttribute("instanceMap", map);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		String email=request.getParameter("textemail");
		getServletContext().setAttribute("email", email);
		Map<String, String> actionMap = (Map<String, String>) getServletContext().getAttribute("mappings");
		Map<String, Action> map = (Map<String, Action>) getServletContext().getAttribute("instanceMap");
		String view = null;
		if (actionMap.containsKey(path)) {
			String cls = actionMap.get(path);
			createInstanceIfNotExists(map, cls);
			Action action = map.get(cls);
			view = action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private Map<String, String> readUriMappings() {
		DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
		Map<String, String> eventMap=new HashMap<String, String>();
		try {
			DocumentBuilder	builder= factory.newDocumentBuilder();
			InputStream in = getServletContext().getResourceAsStream("WEB-INF/action.xml");
			Document doc= builder.parse(in);
			NodeList nlist= doc.getElementsByTagName("action");
			for (int i = 0; i < nlist.getLength(); i++) {
				//Event event=new Event();
				String uri=nlist.item(i).getAttributes().getNamedItem("uri").getTextContent();
				String cls=nlist.item(i).getAttributes().getNamedItem("class").getTextContent();
				logger.debug(uri);
				eventMap.put(uri, cls);
			}
		} catch (ParserConfigurationException | SAXException | IOException e) {
			
			e.printStackTrace();
		}
		
		return eventMap;
	}

	private void createInstanceIfNotExists(Map<String,Action> instanceMap ,String cls)
	{
		if (!instanceMap.containsKey(cls)) {
			try {
				Class clazz=Class.forName(cls);
				Action obj=(Action)clazz.newInstance();
				instanceMap.put(cls, obj);
				
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				
				e.printStackTrace();
			}
		}
	}

}
