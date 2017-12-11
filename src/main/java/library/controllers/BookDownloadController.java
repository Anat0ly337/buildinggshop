package library.controllers;

import library.entity.PostBook;
import library.service.PostService;
import library.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;

@Component
@RequestMapping("/download")
public class BookDownloadController {
    private final Logger LOGGER = Logger.getLogger(getClass());

    @Autowired
    MessageSource messageSource;
    @Autowired
    private PostService postService;

    @RequestMapping(path = "/{filename}", method = RequestMethod.GET)
    public void getFile(@PathVariable("filename") String text, HttpServletResponse response) throws IOException,ServletException {
        response.setContentType("application/pdf");
        try(OutputStream outputStream = response.getOutputStream())
        {
            PostBook filename = postService.getPostByText(text);
            byte[] book = filename.getBook();
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(text, "UTF-8") + ".pdf");
            outputStream.write(book);
        }catch (Exception ex){
            ex.printStackTrace();
            LOGGER.info("exception download file");
        }

    }

}
