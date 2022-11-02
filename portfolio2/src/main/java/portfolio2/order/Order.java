package portfolio2.order;

import java.text.DecimalFormat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Order {
	public Order() {

	}

	@PostMapping("/order")
	public String orders(@RequestParam("productnm") String productnm, 
			@RequestParam("productnm_dtc") String productnm_dtc,
			@RequestParam("price") String price, 
			@RequestParam("point") String point,
			@RequestParam("total") String total, 
			@RequestParam("product_ea") String product_ea, 
			Model model) {

		model.addAttribute("productnm", productnm);
		model.addAttribute("productnm_dtc", productnm_dtc);
		DecimalFormat fr = new DecimalFormat("###,###");
		int total2 = Integer.parseInt(total);
		int price2 = Integer.parseInt(price);
		model.addAttribute("price", fr.format(price2));
		model.addAttribute("point", point);
		model.addAttribute("total", total); // 실제 결제 금액
		model.addAttribute("total", fr.format(total2)); // 사용자가 보는 금액
		model.addAttribute("product_ea", product_ea);

		return "order";
	}
}

