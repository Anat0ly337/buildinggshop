package ishop.tag;

import org.apache.log4j.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Base64;

public class ImageTag extends TagSupport {
    private final Logger LOGGER = Logger.getLogger(getClass());
    private byte[] imageByte;

    public void setImageByte(byte[] imageByte) {
        this.imageByte = imageByte;
    }

    @Override
    public int doStartTag() throws JspException {
        if(imageByte!=null && imageByte.length > 0){
            String base64encoding = Base64.getEncoder().encodeToString(imageByte);
            try {
                pageContext.getOut().print("data:image/jpg;base64," + base64encoding);

            }catch (IOException e){
                LOGGER.info("- - - ");
            }
        }
        return EVAL_BODY_INCLUDE;
    }
}
