package gyum_02.masterpage.Controller;

public class Seongyun_PageModule {

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
		sb.append("<ul class=\"pagination\">");
		sb.append("<li ");
		
		if (userGroup != 0) {
			sb.append("class=\"paginate_button previous\" id=\"datatables-"
					+ "example_previous\"><a onclick='");
			sb.append(pageName);
			sb.append("(\"");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("\")'");
		}else{
			sb.append("class=\"paginate_button next disabled\" id=\"datatables-"
					+ "example_previous\"><a onclick=\"");
			sb.append("\"#\"");
		}
		sb.append("aria-controls=\"datatables"
				+ "-example\" data-dt-idx=\"0\" tabindex=\"0\">Previous</a>"
				+ "</li>");
		
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){		
			sb.append("<li class=\"paginate_button \"><a onclick='");
			sb.append(pageName);
			sb.append("(\"");
			sb.append(i);
			sb.append("\")' aria-controls"+
					"=\"datatables-example\" data-dt-idx=\""+i+"\" "+
					"tabindex=\"0\" >");
			sb.append(i);
			sb.append("</a></li>");
			if(i==totalPage){
				break;
			}
		}
		sb.append("<li ");
				
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("class=\"paginate_button previous\" "
					+ "id=\"datatables-example_next\">"
					+ "<a onclick='");
			sb.append(pageName);
			sb.append("(\"");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("\")'");
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
				sb.append("<a onclick='");
				sb.append(pageName);
				sb.append("?");
				sb.append(ooo);
				sb.append("cp=");
				int temp = (userGroup - 1) * pageSize + pageSize;
				sb.append(temp);
				sb.append("'>&lt;&lt;</a>");
			}
			
			for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){		
				sb.append("&nbsp;&nbsp;<a onclick='");
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
				sb.append("<a onclick='");
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

			if (userGroup != 0) {
				sb.append("<a onclick='");
				sb.append(functionName);
//				sb.append("?cp=");
				int temp = (userGroup - 1) * pageSize + pageSize ;
				sb.append(temp);
				sb.append(")'>&lt;&lt;</a>");
			}
			for (int i = (userGroup * pageSize + 1); i <= (userGroup 
					* pageSize + pageSize); i++) {
				sb.append("&nbsp;&nbsp;<a onclick='");
				sb.append(functionName);
//				sb.append("?cp=");
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
//				sb.append("?cp=");
				int temp = (userGroup + 1) * pageSize + 1 ;
				sb.append(temp);
				sb.append(")'>&gt;&gt;</a>");
			}
			
			return sb.toString();
		}
		
		public static String mp_pageMakeAcademy(String functionName,String data, int totalCnt,
				int listSize, int pageSize, int cp){
			StringBuffer sb = new StringBuffer();
			int totalPage = totalCnt / listSize + 1;
			if (totalCnt % listSize == 0) totalPage--;

			int userGroup = cp / pageSize;
			if (cp % pageSize == 0) userGroup--;
			
			if (userGroup != 0) {
				sb.append("<a onclick=\"");
				sb.append(functionName);
//				sb.append("?cp=");
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
//				sb.append("?cp=");
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
//				sb.append("?cp=");
				int temp = (userGroup + 1) * pageSize + 1 ;
				sb.append(temp);
				sb.append(",'");
				sb.append(data);
				sb.append("')\">&gt;&gt;</a>");
			}
			return sb.toString();
		}
		
		public static String mp_pageMakeCustom(String functionName, int totalCnt,
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
						+ "example_previous\"><a onclick=\"");
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
						+ "<a onclick=\"");
				sb.append("\"#\"");
			}
			sb.append("aria-controls=\"datatables-example\" "
				+ "tabindex=\"0\">Next</a></li>");

			sb.append("</ul>");
			
			return sb.toString();
		}
		
}
