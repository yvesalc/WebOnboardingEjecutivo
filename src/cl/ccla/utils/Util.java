package cl.ccla.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;

import org.apache.log4j.Logger;


/**
 * Clase utilitaria donde se deben incluir m�todos de uso comun de validaci�n
 * y/o de transformaci�n de tipos de datos
 */
public class Util {
    private static Logger LOGGER = Logger.getLogger(Util.class);
    
    /**
     * Valida que un String sea s�lo n�meros
     * @param string
     * @return
     */
    public static boolean isNumber(String string) {
        if (string == null || string.isEmpty()) {
            return false;
        }
        int i = 0;
        if (string.charAt(0) == '-') {
            if (string.length() > 1) {
                i++;
            } else {
                return false;
            }
        }
        for (; i < string.length(); i++) {
            if (!Character.isDigit(string.charAt(i))) {
                return false;
            }
        }
        return true;
    }
    
    /**
     * Valida que una cadena de digitos sea solo numeros
     * @param cadena
     * @return
     */
    public static boolean isNumeric(String cadena) {
        try {
            Integer.parseInt(cadena);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }

    /**
     * Convierte de String a Date ("dd/MM/yyyy")
     * @param fechaString
     * @return
     */
    public Date stringToDate(String fechaString) {
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
        Date fecha = null;
        try {
            fecha = formatoDelTexto.parse(fechaString);
        } catch (ParseException e) {
            LOGGER .error(e.getMessage(), e);
        }
        return fecha;

    }

    /**
     * Valida que una fecha String tenga el formato dd/MM/yyyy
     * @param fecha
     * @return
     */
    public boolean validarFecha(String fecha) {

        if (fecha == null && !fecha.isEmpty()) {
            return false;
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

        if (fecha.trim().length() != dateFormat.toPattern().length()) {
            return false;
        }

        dateFormat.setLenient(false);

        try {
            dateFormat.parse(fecha.trim());
        } catch (ParseException pe) {
            return false;
        }
        return true;
    }
    
    /**
     * Comprueba que un nombre no tenga n�meros
     * @param cadena
     * @return
     */
    public boolean comprobarNombre(String cadena) {
        Boolean resp = false;
        for (int i = 0; i < cadena.length(); i++){
            if (Character.isDigit(cadena.charAt(i))) {
                resp =  false;
                break;
            } else {
                resp = true;
                break;
            }
        }
      return resp;
    }
    public static void validaDV(String digito) throws ProyectoBaseException {        
        if(digito.length()>1){
            throw new ProyectoBaseException(Constant.PARAMETROS);
        } else {
            if(!Util.isNumber(digito) && !"K".equals(digito.toUpperCase())){
                throw new ProyectoBaseException(Constant.PARAMETROS);
            } 
        }
    }

    /**
     * Valida que el rut est� bien formado
     * @param rut
     * @return
     */
    public static boolean validarRut(String rut) {

        boolean validacion = false;
        try {
            rut = rut.toUpperCase();
            rut = rut.replace(".", "");
            rut = rut.replace("-", "");
            int rutAux = Integer.parseInt(rut.substring(0, rut.length() - 1));

            char dv = rut.charAt(rut.length() - 1);

            int m = 0, s = 1;
            for (; rutAux != 0; rutAux /= 10) {
                s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
            }
            if (dv == (char)(s != 0 ? s + 47 : 75)) {
                validacion = true;
            }

        } catch (java.lang.NumberFormatException e) {
            LOGGER .error(e.getMessage(), e);
        } catch (Exception e) {
            LOGGER .error(e.getMessage(), e);
        }
        return validacion;
    }
    
    /**
     * Valida si un String es null
     * @param arg
     * @return
     */
    public boolean emptyNull(String arg){
        if (arg == null || arg.isEmpty()){
            return true;
        } else {
            return false;
        }
    }
    
    /**
     *
     * @param rut
     * @return
     * @throws ProyectoBaseException
     */
    public int parteEnteraRut (String rut) throws ProyectoBaseException {
        int rutParteEntera = 0;
        if(!Util.isNumber(rut)){
            throw new ProyectoBaseException(Constant.PARAMETROS);
        } else {
            if(Integer.parseInt(rut) < 0){
              throw new ProyectoBaseException(Constant.RUT);
            } else {
              rutParteEntera = Integer.parseInt(rut);
            }
        }
        return rutParteEntera;
    }
    
    /**
     * Valida un rut
     * @param parteEntera
     * @param digito
     * @return
     * @throws ProyectoBaseException
     */
    public static boolean validaRut(String parteEntera, String digito)throws ProyectoBaseException{
        boolean resp = false;
        
        if(!isNumeric(parteEntera)){
           throw new ProyectoBaseException(Constant.PARAMETROS);
        }
        
        validaDV(digito);
        int rut = Integer.parseInt(parteEntera);
        
        char dv = digito.toUpperCase().charAt(0);
        int m = 0;
        int s = 1;
        for(; rut!=0; rut/=10){
            s = (s + rut % 10 *(9 - m++ % 6))%11;
        }
        
        resp = dv == (char)(s != 0 ? s+47 : 75);
        
        if(!resp){
          throw new ProyectoBaseException(Constant.RUT_NOT_OK);
        }
        return resp;
    }
}