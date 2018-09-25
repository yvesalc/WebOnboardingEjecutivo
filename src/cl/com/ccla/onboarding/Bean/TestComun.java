package cl.com.ccla.onboarding.Bean;

import cl.com.ccla.onboarding.DAO.ComunesDao;

import cl.com.ccla.onboarding.VO.EstadoCreditoVO;

import java.sql.SQLException;

import java.util.List;

public class TestComun {
    public TestComun() {
        super();
    }

    public static void main(String[] args) throws SQLException {
        TestComun testComun = new TestComun();
        ComunesDao comun=new ComunesDao();
     List<EstadoCreditoVO> lista=    comun.ConsultarEstadosCredito();
     System.out.println(lista);
    }
}
