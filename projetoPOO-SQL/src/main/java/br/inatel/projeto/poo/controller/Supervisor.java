package br.inatel.projeto.poo.controller;

public class Supervisor extends Empregado{
    private int horas_semana;
    private double salario;

    public Supervisor(String nome, String cpf, String telefone, int idade, int horas_semana, double salario) {
        super(nome, cpf, telefone, idade);
        this.horas_semana = horas_semana;
        this.salario = salario;
    }
    public Supervisor(){};

    @Override
    public String getTelefone() {
        return super.getTelefone();
    }

    @Override
    public String getNome() {
        return super.getNome();
    }

    @Override
    public String getCpf() {
        return super.getCpf();
    }

    @Override
    public int getIdade() {
        return super.getIdade();
    }

    public double getSalario() {
        return salario;
    }

    public int getHoras_semana() {
        return horas_semana;
    }

    @Override
    public void setTelefone(String telefone) {
        super.setTelefone(telefone);
    }

    @Override
    public void setCpf(String cpf) {
        super.setCpf(cpf);
    }

    @Override
    public void setNome(String nome) {
        super.setNome(nome);
    }

    @Override
    public void setIdade(int idade) {
        super.setIdade(idade);
    }

    public void setHoras_semana(int horas_semana) {
        this.horas_semana = horas_semana;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }
}
