/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.BancodeDados;

/**
 *
 * @author sala303b
 */
public class Itens {

    private long id;
    private String imagem;
    private String titulo;
    private Timestamp dtcadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Timestamp getDtcadastro() {
        return dtcadastro;
    }

    public void setDtcadastro(Timestamp dtcadastro) {
        this.dtcadastro = dtcadastro;
    }

    public List<Itens> ListarTodos() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_item; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Itens> itens = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Itens i = new Itens();
                i.setId(rs.getLong("id"));
                i.setImagem(rs.getString("imagem"));
                i.setTitulo(rs.getString("titulo"));

                itens.add(i);
            }
            return itens;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public boolean Excluir(long id) {
        try {
            Connection conn = BancodeDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "DELETE FROM tb_item WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("Apagou!!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
    
    public boolean Atualizar() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "UPDATE tb_item ";
            sql += " SET imagem = ?, ";
            sql += " titulo = ?, ";
            sql += " WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, this.getImagem());
            ps.setString(2, this.getTitulo());
            ps.setLong(3, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("atualizou!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
    
}
