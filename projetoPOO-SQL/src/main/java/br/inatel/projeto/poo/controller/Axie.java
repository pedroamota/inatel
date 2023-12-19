package br.inatel.projeto.poo.controller;

public class Axie {
    private String nome;
    private String tipo;
    private String poder;

    public Axie(String nome, String tipo, String poder) {
        this.nome = nome;
        this.tipo = tipo;
        this.poder = poder;
    }
    public Axie(){};

    public String getNome() {
        return nome;
    }
    public String getTipo() {
        return tipo;
    }
    public String getPoder() {
        return poder;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public void setPoder(String poder) {
        this.poder = poder;
    }
}
