/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
/**
 *
 * @author samue
 */
public class Principal {
    
public static void main(String[] args) throws IOException, Exception {
    String ruta1 = "src/codigo/Lexer.flex"; // ruta relativa a la raiz del proyecto NetBeans
    String ruta2 = "src/codigo/LexerCup.flex";
    String[] rutaS = {"-parser", "Sintax", "src/codigo/Sintax.cup"};
    
    //File f = new File(ruta1);
    //System.out.println("Existe: " + f.exists());
    //System.out.println("Es archivo: " + f.isFile());
    //System.out.println("Se puede leer: " + f.canRead());
    //System.out.println("Ruta absoluta: " + f.getAbsolutePath());
    //System.out.println("Tamaño: " + f.length() + " bytes");
    generar(ruta1,ruta2,rutaS);
}
    
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        try {
            File archivo;
            archivo = new File(ruta1);
            jflex.Main.generate(new String[]{ruta1});
            archivo = new File(ruta2);
            jflex.Main.generate(new String[]{ruta2});
            
            java_cup.Main.main(rutaS);
            
            Path rutaSym = Paths.get("src/codigo/sym.java");
            if(Files.exists(rutaSym)){
                Files.delete(rutaSym);
            }
            
            Files.move(
                    Paths.get("sym.java"),
                    Paths.get("src/codigo/sym.java")
            );
            
            Path rutaSin = Paths.get("src/codigo/Sintax.java");
            if(Files.exists(rutaSin)){
                Files.delete(rutaSin);
            }
            
            Files.move(
                    Paths.get("Sintax.java"),
                    Paths.get("src/codigo/Sintax.java")
            );
            
        } catch (jflex.exceptions.SilentExit e) {
            e.printStackTrace(); 
        }
    }
    
    
}
