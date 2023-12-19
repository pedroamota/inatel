package br.inatel.projeto.poo.model;

import br.inatel.projeto.poo.controller.Axie;
import br.inatel.projeto.poo.controller.Conta;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;

public class AxieBD {

    Connection connection;
    Statement statement;
    ResultSet result;
    PreparedStatement pst;

    static final String user = "root";
    static final String password = "17208";
    static final String database = "projetobd";

    // String com URL de conexão com o servidor
    static final String url = "jdbc:mysql://localhost:3306/" + database + "?useTimezone=true&serverTimezone=UTC&useSSL=false";
    private boolean check = false;


    public void connect(){
        try{
            connection = DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            System.out.println("Erro de conexão: " + e.getMessage());
        }
    }

    //-------------------------Inserir Axie --------------------------
    public boolean insertAxie(Axie a, String nomeConta){

        connect();

        ContaBD bdconta = new ContaBD();
        int idConta = bdconta.getIdConta(nomeConta);

        connect();
        String sql = "INSERT INTO axie(nome,ripo,poder,conta_idconta) VALUES (?,?,?)";
        try{
            pst = connection.prepareStatement(sql);
            pst.setString(1,a.getNome());
            pst.setString(2,a.getTipo());
            pst.setString(3,a.getPoder());
            pst.setInt(4, idConta);

            pst.execute();
            check = true;
            JOptionPane.showMessageDialog(null, "Axie inserido com sucesso!");

        }catch (SQLException e){
            System.out.println("Erro de conexão: " + e.getMessage());
            check = false;
        }
        finally {
            try{
                connection.close();
                pst.close();
            } catch (SQLException e){
                System.out.println("Erro ao fechar conexão: " + e.getMessage());
            }
        }
        return check;
    }

    //------------------------Lista de Axies --------------------
    public ArrayList<Axie> listaAxie(String nomeConta) {

        ArrayList<Axie> listaAxie = new ArrayList<>();
        connect();

        ContaBD conta = new ContaBD();
        int idConta = conta.getIdConta(nomeConta);

        String sql = "SELECT * FROM Axie WHERE Conta_idConta = ? ";
        try {

            pst = connection.prepareStatement(sql);
            pst.setInt(1, idConta);
            result = pst.executeQuery();

            while (result.next()) {
                Axie aux = new Axie(result.getString("nome"), result.getString("tipo"),
                        result.getString("poder"));

                listaAxie.add(aux);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
        } finally {
            try {
                connection.close();
                pst.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
            }
        }

        return listaAxie;
    }

    //----------------------Deletar Axie --------------------
    public boolean deleteAxie(String nomeAxie,  String nomeConta) {

        connect(); //Conecta ao banco de dados

        ContaBD conta = new ContaBD();
        int idConta = conta.getIdConta(nomeConta);

        int idAxie = 0;

        String sqlGetId = "SELECT * FROM Axie WHERE nome = (?) AND conta_idconta = (?)";
        String sqlDelete = "DELETE FROM Axie WHERE idAxie = (?)";
        try {
            pst = connection.prepareStatement(sqlGetId);
            pst.setString(1, nomeAxie);
            pst.setInt(2, idConta);
            result = pst.executeQuery();

            while (result.next()) {
                idAxie = result.getInt("idaxie");
            }

            pst = connection.prepareStatement(sqlDelete);
            pst.setInt(1, idAxie);
            pst.execute();
            check = true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
        } finally {
            try {
                connection.close();
                pst.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
            }
        }
        return check;
    }
}
