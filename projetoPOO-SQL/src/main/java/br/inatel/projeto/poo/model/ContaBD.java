package br.inatel.projeto.poo.model;

import br.inatel.projeto.poo.controller.Axie;
import br.inatel.projeto.poo.controller.Conta;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;

public class ContaBD {
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

    //-------------------Inserir Conta--------------------
    public boolean insertConta(Conta c){

        connect();
        String sql = "INSERT INTO Conta(nickname,password) VALUES (?,?)";
        try{
            pst = connection.prepareStatement(sql);
            pst.setString(1,c.getNickname());
            pst.setString(2,c.getPassword());
            pst.execute();
            check = true;
            JOptionPane.showMessageDialog(null, "Conta inserida com sucesso!");
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

    public Integer getIdConta(String nomeConta) {

        connect();
        int idConta = 0;

        String sql = "SELECT * FROM conta WHERE nome = ?";
        //O comando NÃO recebe parâmetros -> consulta estática (st)
        try {
            pst = connection.prepareStatement(sql);
            pst.setString(1, nomeConta);
            result = pst.executeQuery();

            while (result.next()) {
                idConta = result.getInt("idConta");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
        }
        return idConta;
    }

    //-------------------Lista de Contas----------------------------
    public ArrayList<String> listaConta() {

        ArrayList<String> listaContas = new ArrayList<>();
        connect();

        String sql = "SELECT nickname FROM Conta";
        try {
            statement = connection.createStatement();
            result = statement.executeQuery(sql); //ref. a tabela resultante da busca
            while (result.next()) {
                listaContas.add(result.getString("nome"));
            }
            check = true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
            check = false;
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
            }
        }
        return listaContas;
    }
    //---------------------Atualizar Nickname ----------------------
    public boolean mudarNickname(String nomeConta, String novoNome) {

        connect();
        int idConta = this.getIdConta(nomeConta);

        String sql = "UPDATE conta SET nome = ? WHERE idconta = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setString(1, novoNome);
            pst.setInt(2, idConta);

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
    //-----------------------Mudar Senha-------------------------------
    public boolean mudarSenha(String nomeConta, String senha) {

        connect();
        int idConta = this.getIdConta(nomeConta);

        String sql = "UPDATE conta SET password = ? WHERE idconta = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setString(1, senha);
            pst.setInt(2, idConta);

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
    //-----------------------Deletar Conta------------------------------
    public boolean deleteConta(String nomeConta) {
        connect();

        int opcao = JOptionPane.showConfirmDialog(null, "Deseja realmente excluir?", "Excluir Conta", JOptionPane.YES_NO_OPTION);

        if (opcao == 0) {

            int idConta = this.getIdConta(nomeConta);

            String sql = "DELETE FROM conta WHERE idconta=?";
            try {
                pst = connection.prepareStatement(sql);
                pst.setInt(1, idConta);
                pst.execute();
                check = true;
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
                check = false;
            } finally {
                try {
                    connection.close();
                    pst.close();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, "Erro = " + ex.getMessage());
                }
            }
        } else {
            check = false;
        }
        return check;
    }
}
