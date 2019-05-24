package com.servletCode;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class News {
	DBConnection DBConn = new DBConnection();
	Function Fun = new Function();
	
	//new list search
	public String ListNewsFront(String sPage,String strPage) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			StringBuffer sb = new StringBuffer();
			
			int i;
			int intPage = 1;
			int intPageSize = 5;
			
			String sSql = "select * from new order by NewsID desc";
			rs = stmt.executeQuery(sSql);
			if(!rs.next()) {
				sb.append("<tr height=\"25\" bgcolor=\"#d6dff7\" class=\"info1\">");
				sb.append("<td colspan=\"5\">\r\n");
				sb.append("<div align=\"center\"><b>no record!</b></div></td></tr>\r\n");
			}
			else {
				intPage = Fun.StrToInt(strPage);
				sPage = Fun.CheckReplace(sPage);
				if(intPage==0) {
					intPage = 1;
				}
				rs.absolute((intPage-1)*intPageSize+1);
				i = 0;
				while(i<intPageSize && !rs.isAfterLast()) {
					int NewsID = rs.getInt("NewsID");
					String NewsTitle = rs.getString("NewsTitle");
					String NewsTime = rs.getString("NewsTime");
					String AdminName = rs.getString("AdminName");
					sb.append("<tr>");
					sb.append("<td>"+NewsTitle+"</td>");
					sb.append("<td>"+AdminName+"</td>");
					sb.append("<td>"+NewsTime+"</td>");
					sb.append("<td> <a style=\"color:#3F862E\" target=\"_blank\" href=\"newsFrontDetail.jsp?newsId="+NewsID+"\">MORE</a></td></tr>");
					rs.next();
					i++;
				}
				sb.append(Fun.PageFront(sPage, rs, intPage, intPageSize));
			}
			rs.close();
			stmt.close();
			Conn.close();
			return sb.toString();
		}catch(Exception e) {
			return "No";
		}
	}
	
	public String FrontNewsDetail(String s0) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			int NewsID = Fun.StrToInt(s0);
			if(NewsID==0) {
				return "No";
			}
			else {
				try {
					String sql = "select * from new where NewsID="+NewsID;
					rs = stmt.executeQuery(sql);
					StringBuffer sb = new StringBuffer();
					int i = 0;
					while(i<1&&!rs.isAfterLast()) {
						rs.next();
						String NewsTitle = rs.getString("NewsTitle");
						String newsContent = rs.getString("NewsContent");
						String[] content = newsContent.split("#");
						sb.append("<br><h2 style=\"font-size:28px;margin-left:30%\">"+NewsTitle+"</h2>");
						for(int j = 0;j<content.length;j++) {
							sb.append("<p>"+content[j]+"</p>");
						}
						rs.next();
						i++;
					}
					rs.close();
					stmt.close();
					Conn.close();
					return sb.toString();
				}catch(Exception e){
					Conn.rollback();
					Conn.close();
					return "No";
				}
			}
		}catch(Exception e) {
			return "No";
		}
	}
}
