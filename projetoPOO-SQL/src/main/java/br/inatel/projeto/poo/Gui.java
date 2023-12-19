package br.inatel.projeto.poo;

import com.mysql.management.util.Str;
import com.sun.xml.internal.ws.api.model.wsdl.WSDLOutput;
import org.w3c.dom.ls.LSOutput;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Gui extends JFrame {

    private final JLabel labelCliente;
    private final JLabel labelIdade;
    private final JLabel labelPeso;

    private final JTextField txtCliente;
    private final JTextField intxtIdade;
    private final JTextField inpeso;

    private final JButton botao;


    public Gui(){
        super();
        this.setTitle("Menu");
        this.setSize(500,300);

        this.setLayout(new FlowLayout());
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//Dispose ou close

        labelCliente = new JLabel("Nome do Cliente ");
        txtCliente= new JTextField();
        txtCliente.setPreferredSize(new Dimension(200,20));
        botao = new JButton("Salvar");

        labelIdade = new JLabel("Idade do Cliente: ");
        intxtIdade = new JTextField();
        intxtIdade.setPreferredSize(new Dimension(100,20));

        labelPeso = new JLabel("Peso do Cliente: ");
        inpeso = new JTextField();
        inpeso.setPreferredSize(new Dimension(100,20));



        botao.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            String nome = txtCliente.getText();
            int idade = Integer.parseInt(intxtIdade.getText());
            double peso = Double.parseDouble(inpeso.getText());

            JOptionPane.showMessageDialog(null, "Nome: "+nome+"\nIdade: "+idade+"\nPeso: "+peso);
            }
        });

        this.add(labelCliente);
        this.add(txtCliente);
        this.add(labelIdade);
        this.add(intxtIdade);
        this.add(labelPeso);
        this.add(inpeso);

        this.add(botao);

        this.setVisible(true);

    }

}
