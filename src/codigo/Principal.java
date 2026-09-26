/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.io.File;
/**
 *
 * @author samue
 */
public class Principal {
    
public static void main(String[] args) {
    String ruta = "src/codigo/Lexer.flex"; // ruta relativa a la raiz del proyecto NetBeans
    File f = new File(ruta);
    System.out.println("Existe: " + f.exists());
    System.out.println("Es archivo: " + f.isFile());
    System.out.println("Se puede leer: " + f.canRead());
    System.out.println("Ruta absoluta: " + f.getAbsolutePath());
    System.out.println("Tamaño: " + f.length() + " bytes");
    generarLexer(ruta);
}
    
    public static void generarLexer(String ruta){
        try {
            jflex.Main.generate(new String[]{ruta});
        } catch (jflex.exceptions.SilentExit e) {
            e.printStackTrace(); 
        }
    }
}
