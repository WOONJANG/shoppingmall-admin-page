package portfolio2.cs;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class cs {
	@Autowired
	BasicDataSource dataSource;
	
	String sql;
	@RequestMapping("/cs.do")
	public String page(HttpServletRequest req, Model m) throws Exception {

		String cate = req.getParameter("cate");
		Connection con = dataSource.getConnection();

		sql = null;
		if (cate != null && cate != "") {
			sql = "select * from FAQ where FPRINT='Y' and FCATEGORY='" + cate + "'";
		} 
		else {
			sql = "select * from FAQ where FPRINT='Y' limit 0, 5";
		}

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		ArrayList<Map<String, String>> data = new ArrayList<Map<String, String>>();

		while (rs.next()) {
			Map<String, String> mp = new HashMap<String, String>();
			dao da = new dao();

			da.setFINDEX(rs.getString("FINDEX"));
			String msg = "";
			switch (rs.getString("FCATEGORY")) {
			case "1":
				msg = "배송문의";
				break;
			case "2":
				msg = "반품/교환문의";
				break;
			case "3":
				msg = "상품문의";
				break;
			case "4":
				msg = "쿠폰내역";
				break;
			case "5":
				msg = "마일리지내역";
				break;
			default:
				msg = "기타질문";
				break;
			}

//			da.setFCATEGORY(msg);
			mp.put("FINDEX", rs.getString("FINDEX"));
			mp.put("FCATEGORY", msg);
			mp.put("FUSER", rs.getString("FUSER"));
			mp.put("FQ", rs.getString("FQ"));
			mp.put("FA", rs.getString("FA"));
			data.add(mp);
//			da.setFUSER(rs.getString("FUSER"));
//			da.setFQ(rs.getString("FQ"));
//			da.setFA(rs.getString("FA"));
//			da.setFPRINT(rs.getString("FPRINT"));
//			da.setFINDATE(rs.getString("FINDATE"));
//			m.addAttribute("FINDEX", da.getFINDEX());

		}
		m.addAttribute("data", data);
		con.close();
//		System.out.println(cate);
		return "cs";
	}
}

