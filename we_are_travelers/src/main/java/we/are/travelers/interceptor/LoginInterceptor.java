package we.are.travelers.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	//HandlerInterceptor 인터페이스에서 JDK8 이후부터는 3개의 메소드를 디폴트 메소드로 정의해 둠
	//preHandle(), postHandle(), afterCompletion()
	//이들 가운데 필요한 메소드를 Override해서 사용함

	@Override//사용자 요청이 Controller로 전달되기 전에 요청을 가로채어서 메소드 실행
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		String company_idx = (String)session.getAttribute("company_idx");
		
		if(member_idx == null) { //회원idx 체크 후 기업idx 체크
			if(company_idx == null) {
				response.sendRedirect(request.getContextPath()+"/login.do");
				return false; //Controller로 사용자 요청이 전달되지 못하도록 함
			}
		}
		
		return true;//Controller로 사용자 요청이 전달되게 함
	}

}
