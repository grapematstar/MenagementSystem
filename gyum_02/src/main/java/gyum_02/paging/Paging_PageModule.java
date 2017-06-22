package gyum_02.paging;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Paging_PageModule {
	public static String pageMake(String pageName, int totalCnt, int listSize, int pageSize, int cp) {
		
		StringBuffer sb = new StringBuffer();
		
		int totalPage=(totalCnt/listSize)+1;
		if(totalCnt%listSize==0){
		 	totalPage--;
		}
		int userGroup=cp/pageSize;
		if(cp%pageSize==0){
			userGroup--;
		}
		
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		}
		
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){		
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if(i==totalPage){
				break;
			}
		}
				
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		}
		
		return sb.toString();
		
	}
	
	public static String replyPageMake(String pageName, int totalCnt, int listSize, int pageSize, int cp, String key, int param) {
			
			StringBuffer sb = new StringBuffer();
			
			int totalPage=(totalCnt/listSize)+1;
			if(totalCnt%listSize==0){
			 	totalPage--;
			}
			int userGroup=cp/pageSize;
			if(cp%pageSize==0){
				userGroup--;
			}
			String ooo = key+"="+param+"&";
			
			if (userGroup != 0) {
				sb.append("<a href='");
				sb.append(pageName);
				sb.append("?");
				sb.append(ooo);
				sb.append("cp=");
				int temp = (userGroup - 1) * pageSize + pageSize;
				sb.append(temp);
				sb.append("'>&lt;&lt;</a>");
			}
			
			for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){		
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pageName);
				sb.append("?");
				sb.append(ooo);
				sb.append("cp=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
				if(i==totalPage){
					break;
				}
			}
					
			if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
				sb.append("<a href='");
				sb.append(pageName);
				sb.append("?");
				sb.append(ooo);
				sb.append("cp=");
				int temp = (userGroup + 1) * pageSize + 1;
				sb.append(temp);
				sb.append("'>&gt;&gt;</a>");
			}
			
			return sb.toString();
		}

	public static String mp_pageMakeAcademy(String functionName, int totalCnt,
			int listSize, int pageSize, int cp){
		StringBuffer sb = new StringBuffer();

		int totalPage = totalCnt / listSize + 1;
		if (totalCnt % listSize == 0) totalPage--;

		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) userGroup--;
		
		sb.append("<ul class=\"pagination\">");
		sb.append("<li ");
		
		if (userGroup != 0) {
			sb.append("class=\"paginate_button previous\" id=\"datatables-"
				+ "example_previous\"><a onclick=\"");
			sb.append(functionName);
			int temp = (userGroup - 1) * pageSize + pageSize ;
			sb.append(temp);
			sb.append(")\" ");
		}else{
			sb.append("class=\"paginate_button next disabled\" id=\"datatables-"
					+ "example_previous\"><a onclick=");
			sb.append("\"#\"");
		}
		sb.append("aria-controls=\"datatables"
			+ "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
			+ "</li>");
		
		for (int i = (userGroup * pageSize + 1); i <= (userGroup 
				* pageSize + pageSize); i++) {
			sb.append("<li class=\"paginate_button \"><a onclick=\""+
				functionName+i+")\" aria-controls"+
				"=\"datatables-example\" data-dt-idx=\""+i+"\" "+
				"tabindex=\"0\">"+i+"</a></li>");
			
			if (i == totalPage) break;
		}
		
		sb.append("<li ");
		
		if (userGroup != (totalPage / pageSize - 
				(totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("class=\"paginate_button previous\" "
					+ "id=\"datatables-example_next\">"
					+ "<a onclick=\"");
			sb.append(functionName);
			int temp = (userGroup + 1) * pageSize + 1 ;
			sb.append(temp);
			sb.append(")\" ");
		}else{
			sb.append("class=\"paginate_button next disabled\" "
					+ "id=\"datatables-example_next\">"
					+ "<a onclick=");
			sb.append("\"#\"");
		}
		sb.append("aria-controls=\"datatables-example\" "
			+ "tabindex=\"0\">Next</a></li>");

		sb.append("</ul>");
		
		/*
		 * 
		
		if (userGroup != 0) {
			sb.append("<a onclick='");
			sb.append(functionName);
//			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize ;
			sb.append(temp);
			sb.append(")'>&lt;&lt;</a>");
		}
		for (int i = (userGroup * pageSize + 1); i <= (userGroup 
				* pageSize + pageSize); i++) {
			sb.append("&nbsp;&nbsp;<a onclick='");
			sb.append(functionName);
//			sb.append("?cp=");
			sb.append(i);
			sb.append(")'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if (i == totalPage) break;
		}
		if (userGroup != (totalPage / pageSize - 
				(totalPage % pageSize == 0 ? 1 : 0))) {

			sb.append("<a onclick='");
			sb.append(functionName);
//			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1 ;
			sb.append(temp);
			sb.append(")'>&gt;&gt;</a>");
		}
		*/
		return sb.toString();
	}
	
	public static String mp_pageMakeAcademy(String functionName,String data, int totalCnt,
			int listSize, int pageSize, int cp){
		StringBuffer sb = new StringBuffer();
		int totalPage = totalCnt / listSize + 1;
		if (totalCnt % listSize == 0) totalPage--;

		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) userGroup--;
		
		
		sb.append("<ul class=\"pagination\">");
		sb.append("<li ");
		
		if (userGroup != 0) {
			sb.append("class=\"paginate_button previous\" id=\"datatables-"
				+ "example_previous\"><a onclick=\"");
			sb.append(functionName);
			int temp = (userGroup - 1) * pageSize + pageSize ;
			sb.append(temp);
			sb.append(",'");
			sb.append(data);
			sb.append("')\" ");
		}else{
			sb.append("class=\"paginate_button next disabled\" id=\"datatables-"
					+ "example_previous\"><a onclick=");
			sb.append("\"#\"");
		}
		sb.append("aria-controls=\"datatables"
			+ "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
			+ "</li>");
		
		for (int i = (userGroup * pageSize + 1); i <= (userGroup 
				* pageSize + pageSize); i++) {
			sb.append("<li class=\"paginate_button \"><a onclick=\""+
				functionName+i+",'");
			sb.append(data);
			sb.append("')\" aria-controls"+
				"=\"datatables-example\" data-dt-idx=\""+i+"\" "+
				"tabindex=\"0\">"+i+"</a></li>");
			
			if (i == totalPage) break;
		}
		
		sb.append("<li ");
		
		if (userGroup != (totalPage / pageSize - 
				(totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("class=\"paginate_button previous\" "
					+ "id=\"datatables-example_next\">"
					+ "<a onclick=\"");
			sb.append(functionName);
			int temp = (userGroup + 1) * pageSize + 1 ;
			sb.append(temp);
			sb.append(",'");
			sb.append(data);
			sb.append("')\" ");
		}else{
			sb.append("class=\"paginate_button next disabled\" "
					+ "id=\"datatables-example_next\">"
					+ "<a onclick=");
			sb.append("\"#\"");
		}
		sb.append("aria-controls=\"datatables-example\" "
			+ "tabindex=\"0\">Next</a></li>");

		sb.append("</ul>");
		
		/*
		if (userGroup != 0) {
			sb.append("<a onclick=\"");
			sb.append(functionName);
//			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize ;
			sb.append(temp);
			sb.append(",'");
			sb.append(data);
			sb.append("')\">&lt;&lt;</a>");
		}
		for (int i = (userGroup * pageSize + 1); i <= (userGroup 
				* pageSize + pageSize); i++) {
			sb.append("&nbsp;&nbsp;<a onclick=\"");
			sb.append(functionName);
//			sb.append("?cp=");
			sb.append(i);
			sb.append(",'");
			sb.append(data);
			sb.append("')\">");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if (i == totalPage) break;
		}
		if (userGroup != (totalPage / pageSize - 
				(totalPage % pageSize == 0 ? 1 : 0))) {

			sb.append("<a onclick=\"");
			sb.append(functionName);
//			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1 ;
			sb.append(temp);
			sb.append(",'");
			sb.append(data);
			sb.append("')\">&gt;&gt;</a>");
		}
		*/
		return sb.toString();
	}

	public static String mp_pageMakeCustomDo(String pageName, int totalCnt,
			int listSize, int pageSize, int cp){
		StringBuffer sb = new StringBuffer();

		int totalPage = totalCnt / listSize + 1;
		if (totalCnt % listSize == 0) totalPage--;

		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) userGroup--;
		sb.append("<ul class=\"pagination\">");
		sb.append("<li ");
		
		if (userGroup != 0) {
			sb.append("class=\"paginate_button previous\" id=\"datatables-"
				+ "example_previous\"><a href=\"");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize ;
			sb.append(temp);
			sb.append("\" ");
		}else{
			sb.append("class=\"paginate_button next disabled\" id=\"datatables-"
					+ "example_previous\"><a onclick=\"");
			sb.append("\"#\"");
		}
		sb.append("aria-controls=\"datatables"
			+ "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
			+ "</li>");
		for (int i = (userGroup * pageSize + 1); i <= (userGroup 
				* pageSize + pageSize); i++) {
			sb.append("<li class=\"paginate_button \"><a href=\""+
					pageName+"?cp="+i+"\" aria-controls"+
				"=\"datatables-example\" data-dt-idx=\""+i+"\" "+
				"tabindex=\"0\">"+i+"</a></li>");
			if (i == totalPage) break;
		}
		
		sb.append("<li ");
		
		if (userGroup != (totalPage / pageSize - 
				(totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("class=\"paginate_button previous\" "
					+ "id=\"datatables-example_next\">"
					+ "<a href=\"");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1 ;
			sb.append(temp);
			sb.append("\" ");
		}else{
			sb.append("class=\"paginate_button next disabled\" "
					+ "id=\"datatables-example_next\">"
					+ "<a onclick=\"");
			sb.append("\"#\"");
		}
		sb.append("aria-controls=\"datatables-example\" "
			+ "tabindex=\"0\">Next</a></li>");

		sb.append("</ul>");
		
		return sb.toString();
	}
	
	public static String my_pageMake_lnh(String pageName, int totalCnt, int listSize, int pageSize, int cp) {
			
			StringBuffer sb = new StringBuffer();
			
			int totalPage=(totalCnt/listSize)+1;
			if(totalCnt%listSize==0){
			 	totalPage--;
			}
			int userGroup=cp/pageSize;
			if(cp%pageSize==0){
				userGroup--;
			}
			
			sb.append("<ul class='pagination'><li");
					
			if (userGroup != 0) {
				sb.append(" class='paginate_button previous' id=\"datatables-example_previous\">"
						+ "<a onclick=\"location.href='");
				sb.append(pageName);
				sb.append("?cp=");
				int temp = (userGroup - 1) * pageSize + pageSize;
				sb.append(temp);
				sb.append("'\"");
			}else{
				sb.append(" class=\"paginate_button next disabled\" id=\"datatables-"
			               + "example_previous\"><a onclick=\"");
			    sb.append("\"#\"");
			}
			
			sb.append("aria-controls=\"datatables"
		            + "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
		            + "</li>");
			
			for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){		
				sb.append("<li class=\"paginate_button \"><a onclick=\"location.href='");
				sb.append(pageName);
				sb.append("?cp=");
				sb.append(i);
				sb.append("'\" aria-controls=\"datatables-example\" data-dt-idx=\"");
				sb.append(i);
				sb.append("\" tabindex=\"0\" >");
				sb.append(i);
				sb.append("</a></li>");
				if(i==totalPage){
					break;
				}
			}
			
			sb.append("<li ");
			
			if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
				sb.append("class=\"paginate_button previous\" id=\"datatables-example_next\">"
						+ "<a onclick=\"location.href='");
				sb.append(pageName);
				sb.append("?cp=");
				int temp = (userGroup + 1) * pageSize + 1;
				sb.append(temp);
				sb.append("'\"");
			}else{
		        sb.append("class=\"paginate_button next disabled\" "
		                 + "id=\"datatables-example_next\">"
		                 + "<a onclick=\"");
		        sb.append("\"#\"");
		    }
		        sb.append("aria-controls=\"datatables-example\" "
		              + "tabindex=\"0\">Next</a></li>");

		    sb.append("</ul>");
			
			return sb.toString();
			
		}
		
	public static String searchPaging(String pageName, int totalCnt, int listSize, int pageSize, int cp, Map<String,Object> searchMap) {
			
			StringBuffer sb = new StringBuffer();
			
			int totalPage=(totalCnt/listSize)+1;
			if(totalCnt%listSize==0){
			 	totalPage--;
			}
			int userGroup=cp/pageSize;
			if(cp%pageSize==0){
				userGroup--;
			}
			Collection<String> keyList=searchMap.keySet();
			Iterator<String> keyListSet=keyList.iterator();
			List<String> keyListforParam=new ArrayList<String>();
			while(keyListSet.hasNext()){
				keyListforParam.add(keyListSet.next());
			}
			sb.append("<ul class=\"pagination\">");
			if (userGroup != 0) {
				sb.append("<li class=\"paginate_button previous\">");
				sb.append("<a href=\""+pageName+"\">Previous</a></li>");
				sb.append("<li class=\"paginate_button \">");
				sb.append("<a href='");
				sb.append(pageName);
				sb.append("?");
				for(int k=0;k<keyListforParam.size();k++){
					sb.append(keyListforParam.get(k)+"="+searchMap.get(keyListforParam.get(k)));
					sb.append("&");
				}
				sb.append("cp=");
				int temp = (userGroup - 1) * pageSize + pageSize;
				sb.append(temp);
				sb.append("'>&lt;</a></li>");
			}else{
				sb.append("<li class=\"paginate_button previous disabled\">");
				sb.append("<a href=\"#\">Previous</a></li>");
			}
			
			for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
				if(cp==i){
					sb.append("<li class=\"paginate_button active\">");
				}else{
					sb.append("<li class=\"paginate_button \">");
				}
				sb.append("<a href='");
				sb.append(pageName);
				sb.append("?");
				for(int k=0;k<keyListforParam.size();k++){
					sb.append(keyListforParam.get(k)+"="+searchMap.get(keyListforParam.get(k)));
					sb.append("&");
				}
				sb.append("cp=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a></li>");
				if(i==totalPage){
					break;
				}
			}
					
			if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
				sb.append("<li class=\"paginate_button \">");
				sb.append("<a href='");
				sb.append(pageName);
				sb.append("?");
				for(int k=0;k<keyListforParam.size();k++){
					sb.append(keyListforParam.get(k)+"="+searchMap.get(keyListforParam.get(k)));
					sb.append("&");
				}
				sb.append("cp=");
				int temp = (userGroup + 1) * pageSize + 1;
				sb.append(temp);
				sb.append("'>&gt;</a></li>");
				sb.append("<li class=\"paginate_button next\"><a href='"+pageName+"?cp="+totalPage+"'>Next</a></li></ul>");
			}else{
				sb.append("<li class=\"paginate_button next disabled\"><a href='#'>Next</a></li></ul>");
			}
			
			
			
			
			return sb.toString();
		}
		
	public static String pageMake_sh(String pageName, int totalCnt, int listSize, int pageSize, int cp) {
			      
			      StringBuffer sb = new StringBuffer();

			        int totalPage = totalCnt / listSize + 1;
			        if (totalCnt % listSize == 0) totalPage--;

			        int userGroup = cp / pageSize;
			        if (cp % pageSize == 0) userGroup--;
			        sb.append("<ul class=\"pagination\">");
			        sb.append("<li ");
			        
			        if (userGroup != 0) {
			           sb.append("class=\"paginate_button previous\" id=\"datatables-"
			              + "example_previous\"><a href=\"");
			           sb.append(pageName);
			           sb.append("?cp=");
			           int temp = (userGroup - 1) * pageSize + pageSize ;
			           sb.append(temp);
			           sb.append("\" ");
			        }else{
			           sb.append("class=\"paginate_button next disabled\" id=\"datatables-"
			                 + "example_previous\"><a onclick=\"");
			           sb.append("\"#\"");
			        }
			        sb.append("aria-controls=\"datatables"
			           + "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
			           + "</li>");
			        for (int i = (userGroup * pageSize + 1); i <= (userGroup 
			              * pageSize + pageSize); i++) {
			           sb.append("<li class=\"paginate_button \"><a href=\""+
			                 pageName+"?cp="+i+"\" aria-controls"+
			              "=\"datatables-example\" data-dt-idx=\""+i+"\" "+
			              "tabindex=\"0\">"+i+"</a></li>");
			           if (i == totalPage) break;
			        }
			        
			        sb.append("<li ");
			        
			        if (userGroup != (totalPage / pageSize - 
			              (totalPage % pageSize == 0 ? 1 : 0))) {
			           sb.append("class=\"paginate_button previous\" "
			                 + "id=\"datatables-example_next\">"
			                 + "<a href=\"");
			           sb.append(pageName);
			           sb.append("?cp=");
			           int temp = (userGroup + 1) * pageSize + 1 ;
			           sb.append(temp);
			           sb.append("\" ");
			        }else{
			           sb.append("class=\"paginate_button next disabled\" "
			                 + "id=\"datatables-example_next\">"
			                 + "<a onclick=\"");
			           sb.append("\"#\"");
			        }
			        sb.append("aria-controls=\"datatables-example\" "
			           + "tabindex=\"0\">Next</a></li>");

			        sb.append("</ul>");
			        
			        return sb.toString();

			      
			   }
			   
	public static String replyPageMake_sh(String pageName, int totalCnt, int listSize, int pageSize, int cp, String key, int param) {
		         
		         StringBuffer sb = new StringBuffer();
		         String ooo = "?"+key+"="+param+"&";
		            int totalPage = totalCnt / listSize + 1;
		            if (totalCnt % listSize == 0) totalPage--;

		            int userGroup = cp / pageSize;
		            if (cp % pageSize == 0) userGroup--;
		            sb.append("<ul class=\"pagination\">");
		            sb.append("<li ");
		            
		            if (userGroup != 0) {
		               sb.append("class=\"paginate_button previous\" id=\"datatables-"
		                  + "example_previous\"><a href=\"");
		               sb.append(pageName);
		               sb.append(ooo);
		               sb.append("cp=");
		               int temp = (userGroup - 1) * pageSize + pageSize ;
		               sb.append(temp);
		               sb.append("\" ");
		            }else{
		               sb.append("class=\"paginate_button next disabled\" id=\"datatables-"
		                     + "example_previous\"><a onclick=\"");
		               sb.append("\"#\"");
		            }
		            sb.append("aria-controls=\"datatables"
		               + "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
		               + "</li>");
		            for (int i = (userGroup * pageSize + 1); i <= (userGroup 
		                  * pageSize + pageSize); i++) {
		               sb.append("<li class=\"paginate_button \"><a href=\""+
		                     pageName+ooo+"cp="+i+"\" aria-controls"+
		                  "=\"datatables-example\" data-dt-idx=\""+i+"\" "+
		                  "tabindex=\"0\">"+i+"</a></li>");
		               if (i == totalPage) break;
		            }
		            
		            sb.append("<li ");
		            
		            if (userGroup != (totalPage / pageSize - 
		                  (totalPage % pageSize == 0 ? 1 : 0))) {
		               sb.append("class=\"paginate_button previous\" "
		                     + "id=\"datatables-example_next\">"
		                     + "<a href=\"");
		               sb.append(pageName);
		               sb.append(ooo);
		               sb.append("cp=");
		               int temp = (userGroup + 1) * pageSize + 1 ;
		               sb.append(temp);
		               sb.append("\" ");
		            }else{
		               sb.append("class=\"paginate_button next disabled\" "
		                     + "id=\"datatables-example_next\">"
		                     + "<a onclick=\"");
		               sb.append("\"#\"");
		            }
		            sb.append("aria-controls=\"datatables-example\" "
		               + "tabindex=\"0\">Next</a></li>");

		            sb.append("</ul>");
		            
		            return sb.toString();

		      }
		      
	public static String shPageMake(String pageName, int totalCnt, int listSize, int pageSize, int cp, String key, String param) {
		         
		         StringBuffer sb = new StringBuffer();
		         String ooo = "?"+key+"="+param+"&";
		         int totalPage = totalCnt / listSize + 1;
		         if (totalCnt % listSize == 0) totalPage--;
		         
		         int userGroup = cp / pageSize;
		         if (cp % pageSize == 0) userGroup--;
		         sb.append("<ul class=\"pagination\">");
		         sb.append("<li ");
		         
		         if (userGroup != 0) {
		            sb.append("class=\"paginate_button previous\" id=\"datatables-"
		                  + "example_previous\"><a href=\"");
		            sb.append(pageName);
		            sb.append(ooo);
		            sb.append("cp=");
		            int temp = (userGroup - 1) * pageSize + pageSize ;
		            sb.append(temp);
		            sb.append("\" ");
		         }else{
		            sb.append("class=\"paginate_button next disabled\" id=\"datatables-"
		                  + "example_previous\"><a onclick=\"");
		            sb.append("\"#\"");
		         }
		         sb.append("aria-controls=\"datatables"
		               + "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
		               + "</li>");
		         for (int i = (userGroup * pageSize + 1); i <= (userGroup 
		               * pageSize + pageSize); i++) {
		            sb.append("<li class=\"paginate_button \"><a href=\""+
		                  pageName+ooo+"cp="+i+"\" aria-controls"+
		                  "=\"datatables-example\" data-dt-idx=\""+i+"\" "+
		                  "tabindex=\"0\">"+i+"</a></li>");
		            if (i == totalPage) break;
		         }
		         
		         sb.append("<li ");
		         
		         if (userGroup != (totalPage / pageSize - 
		               (totalPage % pageSize == 0 ? 1 : 0))) {
		            sb.append("class=\"paginate_button previous\" "
		                  + "id=\"datatables-example_next\">"
		                  + "<a href=\"");
		            sb.append(pageName);
		            sb.append(ooo);
		            sb.append("cp=");
		            int temp = (userGroup + 1) * pageSize + 1 ;
		            sb.append(temp);
		            sb.append("\" ");
		         }else{
		            sb.append("class=\"paginate_button next disabled\" "
		                  + "id=\"datatables-example_next\">"
		                  + "<a onclick=\"");
		            sb.append("\"#\"");
		         }
		         sb.append("aria-controls=\"datatables-example\" "
		               + "tabindex=\"0\">Next</a></li>");
		         
		         sb.append("</ul>");
		         
		         return sb.toString();
		      }
		      
}
