/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplikasikasir;

import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Alex
 */
public class Barang {
    public String kode;
    public String nama;
    public float harga;
    
    static ArrayList<Barang> daftarBarang = new ArrayList<Barang>();
    
    public String getNama(){
        return nama;
    }
    
    public String getKode(){
        return kode;
    }
    
    public static void loadBarang(){
        Barang barang;
        try {
            Statement stmt = DBConnector.conn.createStatement();
            String sql = "SELECT * FROM barang";
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()){
                barang = new Barang();
                barang.kode = Integer.toString(rs.getInt("kode"));
                barang.nama = rs.getString("nama");
                barang.harga = rs.getFloat("harga");
                
                daftarBarang.add(barang);
            }
        }
        catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
