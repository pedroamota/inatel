package br.inatel.projeto.poo.model;

import br.inatel.projeto.poo.controller.Jogador;
import br.inatel.projeto.poo.controller.Supervisor;

import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;

public class SupervisorBD {
    Connection connection;
    Statement statement;
    ResultSet result;
    PreparedStatement pst;
    ResultSet rs;

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

    public boolean addSupervisor(Supervisor s){

        connect();
        String sql = "INSERT INTO supervisor(nome,cpf,telefone,idade,horas,salario) VALUES (?,?,?,?,?,?)";
        try{
            pst = connection.prepareStatement(sql);
            pst.setString(1,s.getNome());
            pst.setString(2,s.getCpf());
            pst.setString(3,s.getTelefone());
            pst.setInt(4,s.getIdade());
            pst.setInt(5,s.getHoras_semana());
            pst.setDouble(6,s.getSalario());

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

    //Busca um supervisor
    public Supervisor buscarSupervisor(String cpf) {

        Supervisor aux = new Supervisor();
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
            aux.setHoras_semana(result.getInt("horas"));
            aux.setSalario(result.getDouble("salario"));


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

    public boolean updateSalarioSupervisor(String cpf, Double salario) {

        connect();

        String sql = "UPDATE Supervisor SET salario = ? WHERE cpf = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setDouble(1, salario);
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

    //----------------------Deletar Supervisor --------------------
    public boolean deleteSupervisor(String cpf) {

        connect(); //Conecta ao banco de dados

        String sql = "DELETE FROM Supervisor WHERE cpf = (?)";
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

    public ArrayList<Supervisor> listSup() {

        ArrayList<Supervisor> listSup = new ArrayList<>();
        connect();

        String sql = "SELECT * FROM supervisor";
        try {

            pst = connection.prepareStatement(sql);
            result = pst.executeQuery();

            while (result.next()) {
                Supervisor aux = new Supervisor(result.getString("nome"),
                        result.getString("cpf"),
                        result.getString("telefone"),
                        result.getInt("idade"),
                        result.getInt("horas"),
                        result.getDouble("salario"));

                listSup.add(aux);
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

        return listSup;
    }
}
