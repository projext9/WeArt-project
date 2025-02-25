package we.are.travelers.controller;


import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.UUID;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import we.are.travelers.service.AllMemberService;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.MemberVo;


@Controller
@RequestMapping(value="/*")
public class AllMemberController {
	
	private AllMemberService AllmemberService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AllMemberController(AllMemberService AllmemberService) {
		this.AllmemberService = AllmemberService;
	}

	
	///////////////////////로그인 로직
    @RequestMapping(value="/MemberloginProcess.do" , method = RequestMethod.POST , produces="text/html; charset=UTF-8;")
	public String loginProcess (MemberVo mv , CompanyVo cv , HttpServletRequest request)
			throws Exception {
    	
    	MemberVo memberVo = AllmemberService.loginMember(mv);
    	MemberVo memberVo2 = AllmemberService.loginMemberDelynS(mv);
    	    	
    	CompanyVo companyVo = AllmemberService.loginCompany(cv);
    	CompanyVo companyVo2 = AllmemberService.loginCompany_auth(cv);
    	CompanyVo companyVo3 = AllmemberService.loginCompany_delynS(cv);

    	int msg = 0;
    	    	
    	if(memberVo != null || companyVo != null) {
			HttpSession session = request.getSession();
			HttpSession session1 = request.getSession();
    		
    	 if(memberVo != null) {	
 		 	session1.removeAttribute("company_idx");//기업회원 세션 삭제
 		 	session1.removeAttribute("company_id");//기업회원 세션 삭제
 		 	session1.removeAttribute("company_name");//기업회원 세션 삭제
 		 	session1.removeAttribute("company_auth");//기업회원 세션 삭제
 		 	session1.removeAttribute("company_delyn");//기업회원 세션 삭제

			session.setAttribute("member_idx", memberVo.getMember_idx());//회원등급 추가
			session.setAttribute("member_id",memberVo.getMember_id());//회원아이디 추가
			session.setAttribute("member_nick", memberVo.getMember_nick());//회원닉네임
			session.setAttribute("member_grade",memberVo.getMember_grade());//회원등급 추가
			session.setAttribute("member_regCode",memberVo.getMember_regCode());//회원등급 추가
			msg = 0;
			
		   if(msg==0) {
			  return "redirect:/home.do";
		 }
		   
    	 }else {
    		 	session.removeAttribute("member_idx");//일반회원 세션 삭제
    		 	session.removeAttribute("member_id");//일반회원 세션 삭제
    		 	session.removeAttribute("member_nick");//일반회원 세션 삭제
    		 	session.removeAttribute("member_grade");//일반회원 세션 삭제
    		 	session.removeAttribute("member_regCode");//일반회원 세션 삭제

				session1.setAttribute("company_idx", companyVo.getCompany_idx());//회원등급 추가
				session1.setAttribute("company_id", companyVo.getCompany_id());//회원등급 추가
				session1.setAttribute("company_name", companyVo.getCompany_name());//회사이름
				session1.setAttribute("company_auth", companyVo.getCompany_auth());//회사인증
				session1.setAttribute("company_delyn", companyVo.getCompany_delyn());//회사인증
		    msg = 0;
		    
		if(msg==0) {
			return "redirect:/home.do";
	    }
    
    	}
    	 
    	}else if(memberVo2 != null) {
			 msg=1;
			 
		 if(msg==1) {
			request.setAttribute("msg", "사용이 정지된 회원입니다.");
			request.setAttribute("url", "/travelers/login.do");
			return "alert";
		 }	
		 }else if(companyVo2 != null) {
	    	 msg=2;
	    	
		  if(msg==2){
			     request.setAttribute("msg", "기업회원은 승인절차 이후 로그인이 가능합니다.");
		    	 request.setAttribute("url", "/travelers/login.do");
		    	 return "alert";
	     }
		 }else if(companyVo3 != null) {
	    	 msg=2;
	    	
		  if(msg==2){
			     request.setAttribute("msg", "사용 정지된 기업회원 입니다.");
		    	 request.setAttribute("url", "/travelers/login.do");
		    	 return "alert";
	     } 

		  
    	 }else{	
    		msg=3;
    		request.setAttribute("msg", "아이디 혹은 비밀번호가 맞지 않습니다.");
	  		request.setAttribute("url", "/travelers/login.do");
			return "alert";
    	 }
    	 return null;
    	
    }

    /////////////////////////////////이용약관 상세 보기
    @RequestMapping(value="/WeArtTermsOfService.do", method = RequestMethod.GET)
	public String terms1() {
		return "member/agr_terms_of_service";
	}
    @RequestMapping(value="/WeArtPersnolInfo.do", method = RequestMethod.GET)
	public String terms2() {
		return "member/agr_persnol_info";
	}
    @RequestMapping(value="/WeArtMarketing.do", method = RequestMethod.GET)
	public String terms3() {
		return "member/agr_marketing";
	}
	///////////////////////////////////회원가입 로직
	@RequestMapping(value="/joinMember.do", method = RequestMethod.GET)
	public String join() {
		
		return "member/join_terms_of";
	}
	@RequestMapping(value="/joinNext.do", method = RequestMethod.GET)
	public String joinNext() {
		
		return "member/join_email";
	}
	@RequestMapping(value="/joinNext2.do", method = RequestMethod.POST)
	public String joinNext2(@RequestParam("email")String email , Model model) {
		
		model.addAttribute("email", email);
		
		return "member/join_pwd";
	}
	@RequestMapping(value="/joinNext3.do", method = RequestMethod.POST)
		public String joinNext3(@RequestParam("email")String email , @RequestParam("member_pwd") String member_pwd , Model model)  {		
		
		model.addAttribute("email", email);
		model.addAttribute("member_pwd", member_pwd);
		
		return "member/join_persnol_info";
	}
	@RequestMapping(value="/joinfinish.do", method = RequestMethod.POST)
	public String joinNext4(@RequestParam("email")String email , @RequestParam("member_pwd")String member_pwd , @RequestParam("nick") String nick
			, @RequestParam("name") String name , @RequestParam("birth") String birth, Model model) throws NoSuchAlgorithmException {
		String idx ="";
		for (int i = 1; i <= 12; i++) {
            int pick = (int)((Math.random() * (20 - 1)) + 1);
                if (pick <= 8) {
                    char ch = (char) ((Math.random() * 26) + 65);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 14) {
                    char ch = (char) ((Math.random() * 26) + 97);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 16) {
                    char ch = (char) ((Math.random() * 10) + 48);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 18) {
                    char ch = 33;
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 20) {
                    char ch = 64;
                    idx= idx + String.valueOf(ch);
            }
		}
		
		String SHA_pwd = member_pwd;
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		 
        md.update(SHA_pwd.getBytes());
 
        StringBuilder builder = new StringBuilder();
 
        for (byte b: md.digest()) {
            builder.append(String.format("%02x", b));
        }
        String pwd_result = builder.toString();
        
        System.out.println(pwd_result); //88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589
			
		model.addAttribute("idx", idx);
		model.addAttribute("email", email);
		model.addAttribute("member_pwd", pwd_result);
		model.addAttribute("nick", nick);
		model.addAttribute("name", name);
		model.addAttribute("birth", birth);

	  return "member/join_finish";
    }
	//회원가입 완료 로직
		@RequestMapping(value="/joinMemberProcess.do" , method = RequestMethod.POST)
		public String joinMemberProcess(MemberVo memberVo , HttpServletRequest request) {
			//요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
			//이러한 객체를 커맨드 객체라고 함.
			int result=AllmemberService.joinMember(memberVo);
			
			String viewPage = null;
			if(result==1) {
				viewPage = "redirect:login.do";
			}else{
				 request.setAttribute("msg", "회원가입에 실패하였습니다. 다시 시도해주세요");
		    	 request.setAttribute("url", "/travelers/joinMember.do");
				viewPage = "redirect:joinMember.do";
			}
			
			return viewPage;
		
	}	
	//////////////////////////////////////기업회원 약관동의 상세보기 로직
	@RequestMapping(value="/joinCompany.do", method = RequestMethod.GET)
	public String joinCompany() {
		return "company/join_buis_terms_of";
	}
	 //이용약관 상세 보기
    @RequestMapping(value="/CompanyTermsOfService.do", method = RequestMethod.GET)
	public String termsC1() {
		return "company/agr_buis_terms_of_service";
	}
    @RequestMapping(value="/CompanyInfo.do", method = RequestMethod.GET)
	public String termsC2() {
		return "company/agr_buis_info";
	}
    @RequestMapping(value="/CompanyInfo_other.do", method = RequestMethod.GET)
	public String termsC3() {
		return "company/agr_buis_info_other";
	}
    @RequestMapping(value="/CompanyMarketing.do", method = RequestMethod.GET)
	public String termsC4() {
		return "company/agr_buis_marketing";
	}
    ///////////////////////////////////////기업회원 회원가입 로직
    @RequestMapping(value="/join_com_next.do", method = RequestMethod.GET)
	public String join_com_next() {
    	
		return "company/join_buis_number";
	}
	@RequestMapping(value="/join_com_next2.do", method = RequestMethod.POST)
	public String join_com_next2(Model model , @RequestParam("company_buis_number") String company_buis_number){
		
		model.addAttribute("company_buis_number", company_buis_number);
		
		return "company/join_buis_email";
	}
	@RequestMapping(value="/join_com_next3.do", method = RequestMethod.POST)
		public String join_com_next3(Model model , @RequestParam("company_buis_number") String company_buis_number
				, @RequestParam("company_id") String company_id)  {		
		
		model.addAttribute("company_buis_number", company_buis_number);
		model.addAttribute("company_id", company_id);
		
		return "company/join_buis_pwd";
	}
	@RequestMapping(value="/join_com_next4.do", method = RequestMethod.POST)
	public String join_com_next4(Model model , @RequestParam("company_buis_number")String company_buis_number , 
			@RequestParam("company_id")String company_id , @RequestParam("company_pwd")String company_pwd)  {		
	
	model.addAttribute("company_buis_number", company_buis_number);
	model.addAttribute("company_id", company_id);
	model.addAttribute("company_pwd", company_pwd);
	
	return "company/join_buis_info";
}
	@RequestMapping(value="/join_com_finish.do", method = RequestMethod.POST)
	public String joinCNext4(@RequestParam("company_buis_number")String company_buis_number , @RequestParam("company_id")String company_id , @RequestParam("company_pwd")String company_pwd, 
			@RequestParam("company_name") String company_name, @RequestParam("company_ceo_name") String company_ceo_name , @RequestParam("company_phone") String company_phone,
			@RequestParam("company_buis_address") String company_buis_address , @RequestParam("detail_address") String detail_address , 
			@RequestParam("company_auth_origin_file") MultipartFile company_auth_origin_file , Model model , HttpServletRequest request) throws NoSuchAlgorithmException  {
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null)
			ip = req.getRemoteAddr();
	
		String idx = "";
		for (int i = 1; i <= 12; i++) {
            int pick = (int)((Math.random() * (20 - 1)) + 1);
                if (pick <= 8) {
                    char ch = (char) ((Math.random() * 26) + 65);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 14) {
                    char ch = (char) ((Math.random() * 26) + 97);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 16) {
                    char ch = (char) ((Math.random() * 10) + 48);
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 18) {
                    char ch = 33;
                    idx= idx + String.valueOf(ch);
                } else if (pick <= 20) {
                    char ch = 64;
                    idx= idx + String.valueOf(ch);
            }
		}
		
        String SHA_pwd = company_pwd;
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		 
        md.update(SHA_pwd.getBytes());
 
        StringBuilder builder = new StringBuilder();
 
        for (byte b: md.digest()) {
            builder.append(String.format("%02x", b));
        }
        String pwd_result = builder.toString();
        
        System.out.println(pwd_result); //88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589
        	
		model.addAttribute("company_idx", idx);
		model.addAttribute("company_buis_number", company_buis_number);
		model.addAttribute("company_id", company_id);
		model.addAttribute("company_pwd", pwd_result);
		model.addAttribute("company_name", company_name );
		model.addAttribute("company_ceo_name", company_ceo_name);
		model.addAttribute("company_phone", company_phone);
		model.addAttribute("company_buis_address" , (company_buis_address + detail_address) );
		model.addAttribute("company_ip" , ip);
		
		
		//시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
		String fileRealName = company_auth_origin_file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		System.out.println("filenaem"+fileRealName);
		long size = company_auth_origin_file.getSize(); //파일 사이즈
		
		model.addAttribute("company_auth_origin_file" , fileRealName );
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		//String upload_dir = "C:\\Users\\MYCOM\\git\\WeArt-Project\\we_are_travelers\\src\\main\\webapp\\resources\\AuthUpload";
		String upload_dir = "C:\\tomcat\\webapps\\travelers\\resources\\AuthUpload\\";

		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		
		//지정된 경로에 파일 저장
		//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
	
		//파일업로드가 정상적으로 이루어진 것을 gallery_home.jsp에서 확인
		//model객체에 입력내용(content)와 system_fileName을 추가함
		//model.addAttribute("content", content);
		//model.addAttribute("fileName", system_fileName);
		
		//파일 업로드 디렉토리에 저장된 모든 파일이름을 가져와서 model객체에 추가
		/*File[] files = new File(realPath).listFiles();
		String[] fileNames = new String[files.length];
		
		for(int i=0; i<files.length; i++) {
			fileNames[i] = files[i].getName();
		}*/
		
		
		File saveFile = new File(upload_dir+"\\"+uniqueName + fileExtension); 
		File saveFile1 = new File(uniqueName + fileExtension); 
		
		model.addAttribute("company_auth_system_file" , saveFile1 );
		
		try {
			company_auth_origin_file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "company/join_buis_finish"; 
	}
	
	@RequestMapping(value="/joinCompanyProcess.do" , method = RequestMethod.POST)
	public String joinCompanyProcess(CompanyVo companyVo) {
		//요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		//이러한 객체를 커맨드 객체라고 함.
		int result=AllmemberService.joinCompany(companyVo);
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:login.do";
		}else{
			viewPage = "redirect:joinCompany.do";
		}
		
		return viewPage;
	
    }	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:login.do";
	}
	
	@RequestMapping("/find_id_pwd.do")
	public String find_id_pwd(HttpServletRequest request) {
		
		return "find/find_id_pwd";
	}
///////////////////////////////////////////////////////////////////////////////////////////일반회원 아이디 비밀번호 찾기
	@RequestMapping("/find_id.do")
	public String find_id() {
		
		return "find/find_id";
	}
	@RequestMapping("/result_id.do")
	public String result_id(MemberVo mv, HttpServletRequest request, Model model) {
		
		MemberVo result_id = AllmemberService.findId(mv);
		System.out.println("아이디 찾기 결과값 :" + result_id);
		
		if(result_id != null) {
		   model.addAttribute("member_id" , result_id.getMember_id());
		   model.addAttribute("member_name" , result_id.getMember_name());
			
		}else{
			request.setAttribute("msg", "해당하는 가입 정보가 없습니다");
			request.setAttribute("url", "/travelers/find_id.do");
			return "alert";
		}
		
		return "find/result_id";
	}
	
	
	@RequestMapping("/find_pwd.do")
	public String find_pwd() {
		
		return "find/find_pwd";
	}
	
	@RequestMapping("/result_pwd.do")
	public String result_pwd(@RequestParam("member_id") String member_id, HttpServletRequest request , Model model) {
	
		int member_id_auth = AllmemberService.findPwd(member_id);
			
		if(member_id_auth == 1) {
			
			model.addAttribute("member_id", member_id);	
			
		   
		}else{
			request.setAttribute("msg", "해당하는 아이디(이메일) 정보가 없습니다");
			request.setAttribute("url", "/travelers/find_pwd.do");
			
			return "alert";
		}
		return "find/result_com_pwd";			
	}
	
	@RequestMapping("/change_pwd.do")
	public String change_pwd(MemberVo mv, HttpServletRequest request, @RequestParam("member_id") String member_id, @RequestParam("member_pwd")String member_pwd) throws NoSuchAlgorithmException {
				
		HashMap<String, Object> target_id = new HashMap<>();
		
		target_id.put("member_id", member_id);
		target_id.put("member_pwd", member_pwd);
		
		MemberVo change_pwd = AllmemberService.changePwd(target_id);
		
		System.out.println("변경된 비밀번호 :" + change_pwd );
	
	  return "login";  
	}
	///////////////////////////////////////////////////////////////////////////////////////////기업회원 아이디 비밀번호 찾기
	@RequestMapping("/find_com_id.do")
	public String find_com_id() {
		
		return "find/find_com_id";
	}
	@RequestMapping("/result_com_id.do")
	public String result_com_id(CompanyVo cv, HttpServletRequest request, Model model) {
		
		CompanyVo result_com_id = AllmemberService.findComId(cv);
		System.out.println("아이디 찾기 결과값 :" + result_com_id);
		
		if(result_com_id != null) {
		   model.addAttribute("company_id" , result_com_id.getCompany_id());
		   model.addAttribute("company_name" , result_com_id.getCompany_name());
			
		}else{
			request.setAttribute("msg", "해당하는 가입 정보가 없습니다");
			request.setAttribute("url", "/travelers/find_com_id.do");
			return "alert";
		}
		
		return "find/result_com_id";
	}
	@RequestMapping("/find_com_pwd.do")
	public String find_com_pwd() {
		
		return "find/find_com_pwd";
	}
	@RequestMapping("/result_com_pwd.do")
	public String result_com_pwd(@RequestParam("company_id") String company_id, HttpServletRequest request , Model model) {
	
		int company_id_auth = AllmemberService.findComPwd(company_id);
			
		if(company_id_auth == 1) {
			
			model.addAttribute("company_id", company_id);	
			
		   
		}else{
			request.setAttribute("msg", "해당하는 아이디(이메일) 정보가 없습니다");
			request.setAttribute("url", "/travelers/find_com_pwd.do");
			
			return "alert";
		}
		return "find/result_com_pwd";			
	}
	@RequestMapping("/change_com_pwd.do")
	public String change_com_pwd(CompanyVo mv, HttpServletRequest request, @RequestParam("company_id") String company_id, @RequestParam("company_pwd")String company_pwd) throws NoSuchAlgorithmException {
				
		HashMap<String, Object> target_com_id = new HashMap<>();
		
		target_com_id.put("company_id", company_id);
		target_com_id.put("company_pwd", company_pwd);
		
		CompanyVo change_com_pwd = AllmemberService.changeComPwd(target_com_id);
		
		System.out.println("변경된 비밀번호 :" + change_com_pwd );
	
	  return "login";  
	}

}


