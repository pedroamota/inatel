package br.inatel.projeto.poo.model;

import br.inatel.projeto.poo.controller.Jogador;
import br.inatel.projeto.poo.controller.Supervisor;

import java.sql.*;

public class Sup_has_jogador {

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
    public boolean sup_has_jogador(String j, String s){

        connect();

        String sql = "INSERT INTO jogador_has_supervisor(jogador_cpf,supervisor_cpf) VALUES (?,?)";
        try{
            pst = connection.prepareStatement(sql);
            pst.setString(1,j);
            pst.setString(2,s);

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

}
