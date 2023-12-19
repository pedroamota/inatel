package com.eurofeedback_brasil.eurobiva.api_eurobiva.model;
import lombok.Data;
import javax.persistence.*;
import java.io.File;

@Data //Lombok, já gera: get, set, equals e hashCode
@Entity //Define essa clara como uma tabela no database
public class Cliente {

    @Id //Define que chave primaria
    @GeneratedValue(strategy = GenerationType.IDENTITY) //Auto Increment
    private Long id;

    @Column(nullable = false)
    private File pdf;
}
