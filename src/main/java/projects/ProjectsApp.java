package projects;

import projects.dao.DbConnection;
import java.sql.Connection;

public class ProjectsApp {

	public static void main(String[] args) {

		DbConnection.getConnection();
		
		
	}

}
