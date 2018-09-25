package cl.com.ccla.onboarding.VO;

import java.util.List;

public class LoginVO {


    private PerfilVO perfilVO;
    private Boolean login;


    public void setPerfilVO(PerfilVO perfilVO) {
        this.perfilVO = perfilVO;
    }

    public PerfilVO getPerfilVO() {
        return perfilVO;
    }

    public void setLogin(Boolean login) {
        this.login = login;
    }

    public Boolean getLogin() {
        return login;
    }
}
