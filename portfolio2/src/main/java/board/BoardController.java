package board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("board/")
public class BoardController {
	@RequestMapping("list")
	public String board_list() {
		
		return "board/list";
	}
	@RequestMapping("insert")
	public String board_insert() {
		
		
		return "board/insert";
	}
	
	@RequestMapping("write")
	public String board_write() {
		
		
		return "redirect:../board/list";
	}
	
}
