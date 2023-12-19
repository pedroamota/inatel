package br.inatel.projeto.poo.view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Menu extends JFrame {

    private final JButton botaoj;
    private final JButton botaos;
    private final JButton botaoa;
    private final JButton botaoc;
    private final JLabel label;

    public Menu(){
        super();
        this.setTitle("Axie Manegement");
        this.setSize(500,300);

        this.setLayout(new GridLayout(0,1));
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//Dispose ou close

        label = new JLabel("Escolha o que deseja gerenciar: ");
        botaoj = new JButton("JOGADOR");
        botaoc = new JButton("CONTA");
        botaoa = new JButton("AXIE");
        botaos = new JButton("SUPERVISOR");

        botaos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        botaoj.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        botaoc.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        botaoa.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new AxieGUI();
            }
        });

        this.add(label);
        this.add(botaoj);
        this.add(botaoc);
        this.add(botaoa);
        this.add(botaos);

        this.setVisible(true);
    }
}
