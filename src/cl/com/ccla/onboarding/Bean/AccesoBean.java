package cl.com.ccla.onboarding.Bean;

import cl.com.ccla.onboarding.VO.LoginVO;
import cl.com.ccla.onboarding.VO.PerfilVO;

public class AccesoBean {
    public AccesoBean() {
        super();
    }


    public LoginVO validarLogin(String usuario, String pass) {

        LoginVO loginvo = new LoginVO();


        if (usuario.equals("ives")) {

            if (pass.equals("paso")) {

                loginvo.setLogin(true);
                loginvo.setPerfilVO(new PerfilVO(1, "A", "Ejecutivo"));
            }


            if (usuario.equals("victor")) {

                if (pass.equals("paso1")) {

                    loginvo.setLogin(true);
                    loginvo.setPerfilVO(new PerfilVO(2, "A", "Administrador"));
                }

            }



        }

        return loginvo;
    }
}
