package br.inatel.projeto.poo.model;

import br.inatel.projeto.poo.controller.Axie;
import br.inatel.projeto.poo.controller.Jogador;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;

public class JogadorBF {
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
    //Adicionar jogador
    public boolean addJogador(Jogador j, String nomeConta){

        connect();

        ContaBD conta = new ContaBD();
        int idConta = conta.getIdConta(nomeConta);

        String sql = "INSERT INTO jogador(nome,cpf, telefone, idade, lucro, conta_idconta) VALUES (?,?,?,?,?,?)";
        try{
            pst = connection.prepareStatement(sql);
            pst.setString(1,j.getNome());
            pst.setString(2,j.getCpf());
            pst.setString(3,j.getTelefone());
            pst.setInt(4,j.getIdade());
            pst.setInt(5,j.getLucro());
            pst.setInt(6,idConta);
            pst.execute();
            check = true;
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

    //Busca um jogador
    public Jogador buscarJogador(String cpf) {

        Jogador aux = new Jogador();
        connect();

        String sql = "SELECT * FROM Jogador WHERE cpf = ? ";
        try {

            pst = connection.prepareStatement(sql);
            pst.setString(1, cpf);
            result = pst.executeQuery();

                aux.setNome(result.getString("nome"));
                aux.setCpf(result.getString("cpf"));
                aux.setTelefone(result.getString("telefone"));
                aux.setIdade(result.getInt("idade"));
                aux.setLucro(result.getInt("lucro"));


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

        return aux;
    }

    //Muda a conta do jogador
    public boolean updateContaJogador(String cpf, String novaConta) {

        connect();

        ContaBD conta = new ContaBD();
        int idConta = conta.getIdConta(novaConta);

        String sql = "UPDATE Jogador SET Conta_idConta = ? WHERE cpf = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, idConta);
            pst.setString(2, cpf);

            pst.execute();
            check = true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
            check = false;
        } finally {
            try {   //Encerra a conexão
                connection.close();
                pst.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
            }
        }

        return check;
    }

    //----------------------Deletar Jogador --------------------
    public boolean deleteJogador(String cpf) {

        connect(); //Conecta ao banco de dados

        String sql = "DELETE FROM Jogador WHERE cpf = (?)";
        try {

            pst = connection.prepareStatement(sql);
            pst.setString(1, cpf);
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

    //_---------Lista de Jogadores-------------------
    public ArrayList<Jogador> listaJogador() {

        ArrayList<Jogador> listJogador = new ArrayList<>();
        connect();

        String sql = "SELECT * FROM Jogador";
        try {

            pst = connection.prepareStatement(sql);
            result = pst.executeQuery();

            while (result.next()) {
                Jogador aux = new Jogador(result.getString("nome"),
                        result.getString("cpf"),
                        result.getString("telefone"),
                        result.getInt("idade"),
                        result.getInt("lucro"));

                listJogador.add(aux);
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

        return listJogador;
    }

}
