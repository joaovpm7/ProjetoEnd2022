/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.BancodeDados;

/**
 *
 * @author sala305b
 */
public class Usuario {

    private long id;
    private String admin;
    private String tprequerente;
    private String nome;
    private String ddd;
    private String telefone;
    private String email;
    private String documento;
    private String login;
    private String senha;
    private Date dtnascimento;
    private Timestamp dataCadastro;
    private String status;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getTprequerente() {
        return tprequerente;
    }

    public void setTprequerente(String tprequerente) {
        this.tprequerente = tprequerente;
    }

    public String getDdd() {
        return ddd;
    }

    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public Date getDtnascimento() {
        return dtnascimento;
    }

    public void setDtnascimento(Date dtnascimento) {
        this.dtnascimento = dtnascimento;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long Cadastrar() {
        try {

            Connection conn = BancodeDados.getConexao();
            String sql = "INSERT INTO tb_usuario";
            sql += "(admin, tprequerente, nome, ddd, telefone, email, documento, dtnascimento, login, senha, ativo)";
            sql += "VALUES (?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, this.getAdmin());
            ps.setString(2, this.getTprequerente());
            ps.setString(3, this.getNome());
            ps.setString(4, this.getDdd());
            ps.setString(5, this.getTelefone());
            ps.setString(6, this.getEmail());
            ps.setString(7, this.getDocumento());
            ps.setDate(8, this.getDtnascimento());
            ps.setString(9, this.getLogin());
            ps.setString(10, this.getSenha());
            ps.setString(11, this.getStatus());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int lastId = rs.getInt(1);
                    //insere o id registrado no banco no objeto
                    this.setId(lastId);
                    System.out.println(
                            "O id do cliente é:" + lastId);
                    return lastId;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public boolean BuscarPorId() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_usuario WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                //id, admin, tprequerente, nome, ddd, telefone, email, documento, dtnascimento, login, senha, dtcadastro, ativo
                this.setId(rs.getInt("id"));
                this.setAdmin(rs.getString("admin"));
                this.setTprequerente(rs.getString("tprequerente"));
                this.setNome(rs.getString("nome"));
                this.setDdd(rs.getString("ddd"));
                this.setTelefone(rs.getString("telefone"));
                this.setEmail(rs.getString("email"));
                this.setDtnascimento(rs.getDate("dtnascimento"));
                this.setDocumento(rs.getString("documento"));
                this.setLogin(rs.getString("login"));
                this.setSenha(rs.getString("senha"));
                this.setDataCadastro(rs.getTimestamp("dtcadastro"));
                this.setStatus(rs.getString("ativo"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean TemUsuario() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT id, ativo, admin, tprequerente, nome, ddd, telefone, email, documento, dtnascimento, dtcadastro "
                    + "FROM tb_usuario "
                    + "WHERE login = ? AND senha = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getLogin());
            ps.setString(2, this.getSenha());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                 this.setStatus(rs.getString("ativo"));
                this.setAdmin(rs.getString("admin"));
                this.setTprequerente(rs.getString("tprequerente"));
                this.setNome(rs.getString("nome"));
                this.setDdd(rs.getString("ddd"));
                this.setTelefone(rs.getString("telefone"));
                this.setEmail(rs.getString("email"));
                this.setDtnascimento(rs.getDate("dtnascimento"));
                this.setDocumento(rs.getString("documento"));
                
                this.setDataCadastro(rs.getTimestamp("dtcadastro"));
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean Atualizar() {
        try {
            Connection conn = BancodeDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "UPDATE tb_usuario "
                    + " SET tprequerente = ?, "
                    + " nome = ?, "
                    + " ddd = ?, "
                    + " telefone  =?, "
                    + " email = ?, "
                    + " documento = ?, "
                    + " dtnascimento = ?, "
                    + " login = ?, "
                    + " senha = ? "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getTprequerente());
            ps.setString(2, this.getNome());
            ps.setString(3, this.getDdd());
            ps.setString(4, this.getTelefone());
            ps.setString(5, this.getEmail());
            ps.setString(6, this.getDocumento());
            ps.setDate(7,this.getDtnascimento());
            ps.setString(8, this.getLogin());
            ps.setString(9, this.getSenha());
            ps.setLong(10, this.getId());
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

    public boolean DesativarUsuario() {
        try {
            Connection conn = BancodeDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "UPDATE tb_usuario "
                    + " SET ativo = 0 "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
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
    
    public boolean AtivarUsuario() {
        try {
            Connection conn = BancodeDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "UPDATE tb_usuario "
                    + " SET ativo = 1 "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
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
   

    public List<Usuario> ListarTodos() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_usuario; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Usuario> usuarios = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setId(rs.getLong("id"));
                us.setAdmin(rs.getString("admin"));
                us.setTprequerente(rs.getString("tprequerente"));
                us.setNome(rs.getString("nome"));
                us.setDocumento(rs.getString("documento"));
                us.setDtnascimento(rs.getDate("dtnascimento"));
                us.setDdd(rs.getString("ddd"));
                us.setTelefone(rs.getString("telefone"));
                us.setEmail(rs.getString("email"));
                us.setLogin(rs.getString("login"));
                us.setSenha(rs.getString("senha"));
                us.setDataCadastro(rs.getTimestamp("dtcadastro"));
                us.setStatus(rs.getString("ativo"));

                usuarios.add(us);
            }
            return usuarios;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}
