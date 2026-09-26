/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.awt.Color;
import java.awt.Insets;
import javax.swing.JTextArea;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class NumerosDeLinea extends JTextArea implements DocumentListener {

    private final JTextArea editor;

    public NumerosDeLinea(JTextArea editor) {
        this.editor = editor;
        setEditable(false);
        setFocusable(false);
        setFont(editor.getFont());
        setBackground(editor.getBackground());
        setForeground(new Color(110, 118, 129));
        setMargin(new Insets(0, 5, 0, 5));
        editor.getDocument().addDocumentListener(this);
        actualizar();
    }

    private void actualizar() {
        int lineas = editor.getLineCount();
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= lineas; i++) {
            sb.append(i).append("\n");
        }
        setText(sb.toString());
    }

    @Override
    public void insertUpdate(DocumentEvent e) { actualizar(); }

    @Override
    public void removeUpdate(DocumentEvent e) { actualizar(); }

    @Override
    public void changedUpdate(DocumentEvent e) { actualizar(); }
}