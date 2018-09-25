package cl.ccla.utils;

import java.io.Serializable;

public class ProyectoBaseException extends Exception implements Serializable{
  public ProyectoBaseException(String message) {
      super(message);
  }

  public ProyectoBaseException(String message, Throwable cause) {
      super(message, cause);
  }
}
