package br.inatel.projeto.poo.controller;

public class Jogador extends Empregado{
    private int lucro;

    public Jogador(String nome, String cpf, String telefone, int idade, int lucro) {

        super(nome, cpf, telefone, idade);
        this.lucro = lucro;
    }
    public Jogador(){
        super();
    };

    public int getLucro() {
        return lucro;
    }
    @Override
    public int getIdade() {
        return super.getIdade();
    }
    @Override
    public String getCpf() {
        return super.getCpf();
    }
    @Override
    public String getNome() {
        return super.getNome();
    }
    @Override
    public String getTelefone() {
        return super.getTelefone();
    }

    @Override
    public void setCpf(String cpf) {
    }
    @Override
    public void setIdade(int idade) {
        super.setIdade(idade);
    }
    @Override
    public void setNome(String nome) {
        super.setNome(nome);
    }
    @Override
    public void setTelefone(String telefone) {
        super.setTelefone(telefone);
    }
    public void setLucro(int lucro) {
        this.lucro = lucro;
    }
}
