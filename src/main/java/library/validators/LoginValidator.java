package library.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
@Component
public class LoginValidator implements Validator {
    @Autowired
    MessageSource messageSource;
    public boolean isValidEmailAddress(String email) {
        String ePattern = "([a-z0-9A-Z][\\.]?[_]?)*[a-z0-9A-Z]@([a-z0-9])+\\.[a-zа-я]{2,6}";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);
        return m.matches();
    }
    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "empty.email", "email mustn't be empty.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "empty.password", "password mustn't be empty.");



    }
}
