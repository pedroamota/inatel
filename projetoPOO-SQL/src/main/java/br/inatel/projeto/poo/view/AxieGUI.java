package br.inatel.projeto.poo.view;

import br.inatel.projeto.poo.controller.Axie;
import br.inatel.projeto.poo.model.AxieBD;
import sun.management.jdp.JdpGenericPacket;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class AxieGUI extends JFrame {

    private final JLabel labelAdd;
    private final JLabel labelDel;
    private final JLabel labelList;
    private final JLabel labelNome;
    private final JLabel labelNomeD;
    private final JLabel labelTipo;
    private final JLabel labelPoder;
    private final JLabel labelConta;
    private final JLabel labelContaD;

    private final JTextField txtNome;
    private final JTextField txtNomeD;
    private final JTextField txtTipo;
    private final JTextField txtPoder;
    private final JTextField txtConta;
    private final JTextField txtContaL;
    private final JTextField txtContaD;

    private final JButton botaoAdd;
    private final JButton botaoDel;
    private final JButton botaoListar;

    public AxieGUI(){
        super();
        this.setTitle("Axie Manegement");
        this.setSize(500,800);

        this.setLayout(new GridLayout(0,1));
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);//Dispose ou close

        labelAdd = new JLabel("Adicione um Axie\n");
        labelDel = new JLabel("Delete um Axie");
        labelList = new JLabel("Listar os Axies da conta: ");
        labelNome = new JLabel("Nome: ");
        labelNomeD = new JLabel("Nome: ");
        labelTipo = new JLabel("Tipo: ");
        labelPoder = new JLabel("Poder: ");
        labelConta = new JLabel("Conta: ");
        labelContaD = new JLabel("Conta: ");



        txtNome = new JTextField();
        txtNome.setPreferredSize(new Dimension(200,20));
        txtNomeD = new JTextField();
        txtNome.setPreferredSize(new Dimension(200,20));
        txtTipo = new JTextField();
        txtTipo.setPreferredSize(new Dimension(200,20));
        txtPoder = new JTextField();
        txtPoder.setPreferredSize(new Dimension(200,20));
        txtConta = new JTextField();
        txtConta.setPreferredSize(new Dimension(200,20));
        txtContaD = new JTextField();
        txtConta.setPreferredSize(new Dimension(200,20));
        txtContaL = new JTextField();
        txtConta.setPreferredSize(new Dimension(200,20));

        botaoAdd = new JButton("Adicionar");
        botaoDel = new JButton("Deletar");
        botaoListar = new JButton("Listas");

        botaoAdd.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                AxieBD add = new AxieBD();
                Axie aux = new Axie(txtNome.getText(), txtTipo.getText(), txtPoder.getText());
                add.insertAxie(aux, txtConta.getText());
            }
        });

        botaoListar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                AxieBD add = new AxieBD();
                ArrayList<Axie> listAxie = new ArrayList();
                listAxie = add.listaAxie(txtConta.getText());
                for(int i=0;i<listAxie.size();i++){
                    JOptionPane.showMessageDialog(null, listAxie.get(i));
                }
            }
        });

        botaoAdd.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                AxieBD add = new AxieBD();
                add.deleteAxie(txtNome.getText(), txtConta.getText());
            }
        });

        this.add(labelAdd);
        this.add(labelNome);
        this.add(txtNome);
        this.add(labelTipo);
        this.add(txtTipo);
        this.add(labelPoder);
        this.add(txtPoder);
        this.add(labelConta);
        this.add(txtConta);
        this.add(botaoAdd);

        this.add(labelList);
        this.add(txtContaL);
        this.add(botaoListar);

        this.add(labelDel);
        this.add(labelNomeD);
        this.add(txtNomeD);
        this.add(labelContaD);
        this.add(txtContaD);
        this.add(botaoDel);

        this.setVisible(true);
    }
}
