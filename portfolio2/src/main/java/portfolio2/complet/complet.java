package portfolio2.complet;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inicis.std.util.SignatureUtil;

@Controller
public class complet {
	public complet() {
		
	}
	@RequestMapping(value="complet.do",method=RequestMethod.POST)
	public String payment(Model model, String cname, String chp[], String ctel[], String cemail, HttpServletRequest request ) throws Exception {
		/*
		 
		 결제자 정보
		 결제자명
		 휴대폰번호("-"배고)
		 이메일 주소
		 상품명
		 주문번호(4~9)
		 최종결제금액(숫자만)
		 상품개수
		 회원(아이디) - 비회원(휴대폰번호)
		 
		 [이니시스 기준]
		 결제수단 - CARD (신용카드), Directbank(계좌이체)
		 
		*/
		String person_nm = request.getParameter("person_nm");
		String person_post = request.getParameter("person_post");
		String person_addr = request.getParameter("person_addr");
		String person_addrdtc = request.getParameter("person_addrdtc");
		String person_hp = request.getParameter("person_hp");
		
		String price = request.getParameter("price");
		String currency = request.getParameter("currency");
		String version = request.getParameter("version");
		String goodname = request.getParameter("goodname");
		String goodcode = request.getParameter("goodcode");
		String goodea = request.getParameter("goodea");
		String payment = request.getParameter("payment");
		
		String mid					= "INIpayTest";		                    // 상점아이디					
		String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 웹 결제 signkey
		
		String mKey = SignatureUtil.hash(signKey, "SHA-256");

		String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성
		String orderNumber			= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
		price				= "1000";								// 상품가격(특수기호 제외, 가맹점에서 직접 설정)


		Map<String, String> signParam = new HashMap<String, String>();

		signParam.put("oid", orderNumber);
		signParam.put("price", price);
		signParam.put("timestamp", timestamp);

		String signature = SignatureUtil.makeSignature(signParam);
		
		model.addAttribute("version",version);
		
		return "complet";
	}
	
}
