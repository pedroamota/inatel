package br.inatel.projeto.poo.controller;

public abstract class Empregado{
    private String nome;
    private String cpf;
    private String telefone;
    private int idade;

    public Empregado(String nome, String cpf, String telefone, int idade) {
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
        this.idade = idade;
    }
    public Empregado(){};

    public String getNome() {
        return nome;
    }
    public String getCpf() {
        return cpf;
    }
    public int getIdade() {
        return idade;
    }
    public String getTelefone() {
        return telefone;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public void setIdade(int idade) {
        this.idade = idade;
    }
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
