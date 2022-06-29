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
import java.sql.Statement;
import java.sql.Timestamp;
import modelo.Cliente;
import modelo.Itens;
import util.BancodeDados;

/**
 *
 * @author sala303b
 */
public class Ponto_item {

    private long id;
    private Cliente idponto;
    private Itens iditem;

    public Itens getIditem() {
        return iditem;
    }

    public void setIditem(Itens iditem) {
        this.iditem = iditem;
    }
    private Timestamp dtcadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Cliente getIdponto() {
        return idponto;
    }

    public void setIdponto(Cliente idponto) {
        this.idponto = idponto;
    }

    public Timestamp getDtcadastro() {
        return dtcadastro;
    }

    public void setDtcadastro(Timestamp dtcadastro) {
        this.dtcadastro = dtcadastro;
    }

    public boolean Cadastrar() {
        try {

            Connection conn = BancodeDados.getConexao();
            String sql = "INSERT INTO `bdecoleta`.`tb_ponto_item` "
                    + "(idponto, iditem)"
                    + "VALUES (?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);

            ps.setLong(1, this.getIdponto().getId());
            ps.setLong(2, this.getIditem().getId());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final long lastId = rs.getLong(1);
                    System.out.println("O numero do id é:"
                            + lastId);
                    this.setId(lastId);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean BuscarPorId(String id) {
        try {
            long idpontoa = Long.parseLong(id);
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_ponto_item WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idpontoa);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setDtcadastro(rs.getTimestamp("dtcadastro"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

}
