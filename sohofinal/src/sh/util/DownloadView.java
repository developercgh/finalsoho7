package sh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import sh.service.ShEbbsService;

public class DownloadView extends AbstractView {

	@Autowired
	ShEbbsService ShEbbsService;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("DownloadView rendenMergedOutputModel");
		
		File file = (File)model.get("downloadFile");	// getAttribute
		response.setContentType(this.getContentType());
		response.setContentLength((int)file.length());
		
		//	IE/chrome
		String userAgent = request.getHeader("user-Agent");
		boolean ie = userAgent.indexOf("MSIE")	> -1;
		
		String filename = null;
		if(ie) {
			filename = URLEncoder.encode(file.getName(), "utf-8");
		}else {
			filename = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
		}
		// window download 설정(다운로드 창) 
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary;");
			response.setHeader("Content-Length", "" + file.length());
			response.setHeader("Pragma", "no-cache;"); 
			response.setHeader("Expires", "-1;");
			
			OutputStream out = response.getOutputStream();
			FileInputStream fi = null;
			
			fi = new FileInputStream(file);
			FileCopyUtils.copy(fi, out);
			
			// download count 증가
			
			if(fi != null) {
				fi.close();
			}
	}

}
