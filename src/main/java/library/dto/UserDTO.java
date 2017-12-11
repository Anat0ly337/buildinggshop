package library.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserDTO {
    @NotNull
    @Size(min = 3, max = 10, message = "asd")
    private String nickname;
    @NotNull
    @Size(min = 5,max = 10, message = "dsa")
    private String password;
    @NotNull
    @Pattern(regexp = "([a-z0-9A-Z][\\.]?[_]?)*[a-z0-9A-Z]@([a-z0-9])+\\.[a-zа-я]{2,6}")
    private String email;
    public UserDTO() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
