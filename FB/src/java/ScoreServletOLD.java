/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Elia
 */

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ScoreServletOLD {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        ScoreViewModel contatto = (ScoreViewModel)gson.fromJson(reader, ScoreViewModel.class);
        
        try {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ScoreServletOLD.class.getName()).log(Level.SEVERE, null, ex);       
                        } catch (InstantiationException ex) {
                Logger.getLogger(ScoreServletOLD.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(ScoreServletOLD.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1;instanceName=ELIA_SQL;databaseName=FlappyBird;user=flappybird;password=flappybird;");
            Statement stmt = con.createStatement();
            
            String sql = "insert into dbo.Scores (Username, Score) "
                    + "VALUES("
                    + "'" + contatto.Username + "'"
                    + ", '" + contatto.Score + "'"
                    + ")";
            
            stmt.execute(sql);
            
            JsonWriter writer = new JsonWriter(response.getWriter());
            gson.toJson(
                    Risposta.OK, 
                    Risposta.class, 
                    writer
            );
            con.close();
            
            } catch (SQLException ex) {
                Logger.getLogger(ScoreServletOLD.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
}
