package gyum_02.cybercampus.Model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class CC_SearchPaging {
	public static String searchPaging(String pageName, int totalCnt, int listSize, int pageSize, int cp,
			Map<String, Object> searchMap) {

		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt / listSize) + 1;
		if (totalCnt % listSize == 0) {
			totalPage--;
		}
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) {
			userGroup--;
		}
		Collection<String> keyList = searchMap.keySet();
		Iterator<String> keyListSet = keyList.iterator();
		List<String> keyListforParam = new ArrayList<String>();
		while (keyListSet.hasNext()) {
			keyListforParam.add(keyListSet.next());
		}
		sb.append("<ul class=\"pagination\">");
		if (userGroup != 0) {
			sb.append("<li class=\"paginate_button previous\">");
			sb.append("<a href=\"" + pageName + "\">첫페이지</a></li>");
			sb.append("<li class=\"paginate_button \">");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?");
			for (int k = 0; k < keyListforParam.size(); k++) {
				sb.append(keyListforParam.get(k) + "=" + searchMap.get(keyListforParam.get(k)));
				sb.append("&");
			}
			sb.append("cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'>&lt;</a></li>");
		} else {
			sb.append("<li class=\"paginate_button previous disabled\">");
			sb.append("<a href=\"#\">첫페이지</a></li>");
		}
		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
			if (cp == i) {
				sb.append("<li class=\"paginate_button active\">");
			} else {
				sb.append("<li class=\"paginate_button \">");
			}
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?");
			for (int k = 0; k < keyListforParam.size(); k++) {
				sb.append(keyListforParam.get(k) + "=" + searchMap.get(keyListforParam.get(k)));
				sb.append("&");
			}
			sb.append("cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>");
			if (i == totalPage) {
				break;
			}
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<li class=\"paginate_button \">");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?");
			for (int k = 0; k < keyListforParam.size(); k++) {
				sb.append(keyListforParam.get(k) + "=" + searchMap.get(keyListforParam.get(k)));
				sb.append("&");
			}
			sb.append("cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'>&gt;</a></li>");
			sb.append("<li class=\"paginate_button next\"><a href='" + pageName + "?cp=" + totalPage
					+ "'>끝페이지</a></li></ul>");
		} else {
			sb.append("<li class=\"paginate_button next disabled\"><a href='#'>끝페이지</a></li></ul>");
		}
		return sb.toString();
	}

	public static String searchPagingForAjax(String pageName, int totalCnt, int listSize, int pageSize, int cp) {

		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt / listSize) + 1;
		if (totalCnt % listSize == 0) {
			totalPage--;
		}
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) {
			userGroup--;
		}
		sb.append("<ul class=\"pagination\">");
		if (userGroup != 0) {
			sb.append("<li class=\"paginate_button previous\">");
			sb.append("<a href=\"javascript:void " + pageName + "(1)\">첫페이지</a></li>");
			sb.append("<li class=\"paginate_button \">");
			sb.append("<a href='javascript:void ");
			sb.append(pageName);
			sb.append("(");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append(")'>&lt;</a></li>");
		} else {
			sb.append("<li class=\"paginate_button previous disabled\">");
			sb.append("<a href=\"#\">첫페이지</a></li>");
		}
		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
			if (cp == i) {
				sb.append("<li class=\"paginate_button active\">");
			} else {
				sb.append("<li class=\"paginate_button \">");
			}
			sb.append("<a href='javascript:void ");
			sb.append(pageName);
			sb.append("(");
			sb.append(i);
			sb.append(")'>");
			sb.append(i);
			sb.append("</a></li>");
			if (i == totalPage) {
				break;
			}
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<li class=\"paginate_button \">");
			sb.append("<a href='javascript:void ");
			sb.append(pageName);
			sb.append("(");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append(")'>&gt;</a></li>");
			sb.append("<li class=\"paginate_button next\"><a href='javascript:" + pageName + "(" + totalPage
					+ ")'>끝페이지</a></li></ul>");
		} else {
			sb.append("<li class=\"paginate_button next disabled\"><a href='#'>끝페이지</a></li></ul>");
		}
		return sb.toString();
	}

	public static String searchPagingMapAjax(String pageName, int totalCnt, int listSize, int pageSize, int cp,
			List<String> checkList, Map<String, Object> searchMap) {

		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt / listSize) + 1;
		if (totalCnt % listSize == 0) {
			totalPage--;
		}
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) {
			userGroup--;
		}
		Collection<String> keyList = searchMap.keySet();
		System.out.println(searchMap.keySet());
		Iterator<String> keyListSet = keyList.iterator();
		List<String> keyListforParam = new ArrayList<String>();
		while (keyListSet.hasNext()) {
			keyListforParam.add(keyListSet.next());
		}
		sb.append("<ul class=\"pagination\">");
		if (userGroup != 0) {
			sb.append("<li class=\"paginate_button previous\">");
			sb.append("<a href=\"javascript:void " + pageName + "(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(searchMap.get(checkList.get(k))));
				sb.append(",");
			}
			sb.append("1)\">첫페이지</a></li>");
			sb.append("<li class=\"paginate_button \">");
			sb.append("<a href=\"javascript:void ");
			sb.append(pageName);
			sb.append("(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(checkList.get(k)));
				sb.append(",");
			}
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append(")'>&lt;</a></li>");
		} else {
			sb.append("<li class=\"paginate_button previous disabled\">");
			sb.append("<a href=\"#\">첫페이지</a></li>");
		}

		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
			if (cp == i) {
				sb.append("<li class=\"paginate_button active\">");
			} else {
				sb.append("<li class=\"paginate_button \">");
			}
			sb.append("<a href=\"javascript:void ");
			sb.append(pageName);
			sb.append("(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(checkList.get(k)));
				sb.append(",");
			}
			sb.append(i);
			sb.append(")\">");
			sb.append(i);
			sb.append("</a></li>");
			if (i == totalPage) {
				break;
			}
		}

		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<li class=\"paginate_button \">");
			sb.append("<a href=\"javascript:void ");
			sb.append(pageName);
			sb.append("(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(checkList.get(k)));
				sb.append(",");
			}
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append(")\">&gt;</a></li>");
			sb.append("<li class=\"paginate_button next\"><a href=\"javascript:void " + pageName + "(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(searchMap.get(checkList.get(k))));
				sb.append(",");
			}
			sb.append(totalPage + ")\">끝페이지</a></li></ul>");
		} else {
			sb.append("<li class=\"paginate_button next disabled\"><a href='#'>끝페이지</a></li></ul>");
		}
		return sb.toString();
	}
	
	public static String searchPagingMapAjaxforRightSideBar(String pageName, int totalCnt, int listSize, int pageSize, int cp,
			List<String> checkList, Map<String, Object> searchMap) {

		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt / listSize) + 1;
		if (totalCnt % listSize == 0) {
			totalPage--;
		}
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) {
			userGroup--;
		}
		Collection<String> keyList = searchMap.keySet();
		Iterator<String> keyListSet = keyList.iterator();
		List<String> keyListforParam = new ArrayList<String>();
		while (keyListSet.hasNext()) {
			keyListforParam.add(keyListSet.next());
		}
		if (userGroup != 0) {
			sb.append("<a href=\"javascript:void ");
			sb.append(pageName);
			sb.append("(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(checkList.get(k)));
				sb.append(",");
			}
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append(")'>&lt;</a>");
		}
		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
			sb.append("&nbsp;&nbsp;<a href=\"javascript:void ");
			sb.append(pageName);
			sb.append("(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(checkList.get(k)));
				sb.append(",");
			}
			sb.append(i);
			sb.append(")\">");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if (i == totalPage) {
				break;
			}
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<a href=\"javascript:void ");
			sb.append(pageName);
			sb.append("(");
			for (int k = 0; k < checkList.size(); k++) {
				sb.append(searchMap.get(checkList.get(k)));
				sb.append(",");
			}
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append(")\">&gt;</a>");
		}
		return sb.toString();
	}
}
