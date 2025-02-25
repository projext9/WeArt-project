package we.are.travelers.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import we.are.travelers.service.MyService;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.PageMaker;
import we.are.travelers.vo.SearchCriteria;

@Controller
public class MyController {

	private MyService myService;
	
	@Autowired
	public MyController(MyService myService) {
		this.myService = myService;
	}
	
	@GetMapping("/info.do")
	public String info(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String member_idx = (String) session.getAttribute("member_idx");
		
		List<MemberVo> info = myService.getInfo(member_idx);
		model.addAttribute("info", info);
		return "myPage/info";
	}
	
	@GetMapping("/info_check.do")
	public String info_check() {
		return "myPage/info_check";
	}
	
	@PostMapping("/info_checkPwd.do")
	public String info_checkPwd(MemberVo mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="member_pwd") String member_pwd) throws NoSuchAlgorithmException {
		
		String SHA_pwd = member_pwd;
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		 
        md.update(SHA_pwd.getBytes());
 
        StringBuilder builder = new StringBuilder();
 
        for (byte b: md.digest()) {
            builder.append(String.format("%02x", b));
        }
        String pwd_result = builder.toString();
        
        System.out.println(pwd_result); //88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589
		
		HttpSession session = request.getSession();
		
		mv.setMember_idx((String) session.getAttribute("member_idx"));
		mv.setMember_pwd(pwd_result);
		
		int result = myService.info_checkPwd(mv);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/info.do";
		}else {
			viewPage = "myPage/info_check";
		}return viewPage;
	}
	
	@ResponseBody	//
	@PostMapping("/modify_info.do")
	public int modify_info(MemberVo memberVo,
			@RequestParam(value="member_idx") String member_idx,
			@RequestParam(value="member_name") String member_name,
			@RequestParam(value="member_pwd") String member_pwd,
			@RequestParam(value="member_nick") String member_nick,
			@RequestParam(value="member_phone") String member_phone,
			@RequestParam(value="member_address") String member_address,
			@RequestParam(value="member_delyn") char member_delyn) throws NoSuchAlgorithmException {
		
		String SHA_pwd = member_pwd;
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		 
        md.update(SHA_pwd.getBytes());
 
        StringBuilder builder = new StringBuilder();
 
        for (byte b: md.digest()) {
            builder.append(String.format("%02x", b));
        }
        String pwd_result = builder.toString();
        
		
		memberVo.setMember_idx(member_idx);
		memberVo.setMember_name(member_name);
		memberVo.setMember_pwd(pwd_result);
		memberVo.setMember_nick(member_nick);
		memberVo.setMember_phone(member_phone);
		memberVo.setMember_address(member_address);
		memberVo.setMember_delyn(member_delyn);
				
		int result = myService.modify_info(memberVo);
		
		return result;
	}
	
	@GetMapping("/payment.do")
	public String payment(Model model, HttpServletRequest request, 
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="num") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		HttpSession session = request.getSession();
		scri.setMember_idx((String) session.getAttribute("member_idx"));
		
		int cnt = myService.payment_total(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<OrderLastVo> payment = myService.getPayment(scri);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		model.addAttribute("payment", payment);
		return "myPage/payment";
	}
	
	@GetMapping("/paymentContent.do")
	public String paymentContent(Model model, OrderVo orderVo, HttpServletRequest request,
			@RequestParam(value="orderLast_num") String orderLast_num) {
		
		HttpSession session = request.getSession();
		
		String member_idx = (String) session.getAttribute("member_idx");
		
		orderVo.setMember_idx(member_idx);
		orderVo.setOrderLast_num(orderLast_num);
		List<OrderVo> paymentContent = myService.getPaymentContent(orderVo);
		model.addAttribute("paymentContent", paymentContent);
		return "myPage/paymentContent";
	}
	
	/*
	 * @GetMapping("/inquiry_list.do") public String inquiry_list(Model model,
	 * HttpServletRequest request) {
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * String member_idx = (String) session.getAttribute("member_idx");
	 * 
	 * List<BoardVo> inquiry_list = myService.inquiry_list(member_idx);
	 * model.addAttribute("inquiry_list", inquiry_list); return
	 * "board/inquiry_list"; }
	 */
	
	@GetMapping("/myNotice.do")
	public String myNotice(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		String member_idx = (String) session.getAttribute("member_idx");

		List<BoardVo> myNotice = myService.getMyNotice(member_idx);
		model.addAttribute("myNotice", myNotice);
		return "myPage/myNotice";
	}

	@GetMapping("/myNoticeContent.do")
	public String myNoticeContent(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String board_subject = (String) session.getAttribute("board_subject");

		List<BoardVo> myNoticeContent = myService.getMyNoticeContent(board_subject);
		model.addAttribute("myNoticeContent", myNoticeContent);
		return "myPage/myNoticeContent";
	}
	
}