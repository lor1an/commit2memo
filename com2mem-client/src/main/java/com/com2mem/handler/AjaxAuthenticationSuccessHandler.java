package com.com2mem.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler extends
        SimpleUrlAuthenticationSuccessHandler {

    public AjaxAuthenticationSuccessHandler() {
    }

    @Override
    public void onAuthenticationSuccess(final HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {

        if ("true".equals(request.getHeader("X-Ajax-call"))) {
            try {
                response.getWriter().print("ok");
                response.getWriter().flush();
            } catch (IOException e) {
            }
        } else {
            setAlwaysUseDefaultTargetUrl(false);
        }
    }
}