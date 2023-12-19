package br.inatel.projeto.poo.controller;

public class Conta {
    private String nickname;
    private String password;

    public Conta(String nickname, String password) {
        this.nickname = nickname;
        this.password = password;
    }
    public Conta(){};
    public String getNickname() {
        return nickname;
    }
    public String getPassword() {
        return password;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
