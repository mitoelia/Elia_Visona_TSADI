/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import java.io.BufferedReader;
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

/**
 *
 * @author Elia
 */
@WebServlet(urlPatterns = {"/score"})
public class ScoreServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScoreServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScoreServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();
       
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
            
            String sql = "Select * from dbo.topFive";
            
            ResultSet rs = stmt.executeQuery(sql);
            
            response.setCharacterEncoding("utf-8");
            writer.print("[");
            boolean first = true;
            while(true){
                
                if (!rs.next()) break;
                
                if (first) first = false;
                else writer.println(",");
                
                writer.print("{");
                writer.printf(" \"Username\": \"%s\"", rs.getString("Username"));
                writer.printf(", \"Score\": \"%s\"", rs.getString("Score"));
                writer.printf(", \"Timestamp\": \"%s\"", rs.getString("Timestamp"));
                writer.printf("}");
                
            }
            
            writer.printf("]");
            
            con.close();
            
            } catch (SQLException ex) {
                Logger.getLogger(ScoreServletOLD.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        ScoreViewModel contatto = null;
        try
        {
             contatto = (ScoreViewModel)gson.fromJson(reader, ScoreViewModel.class);
        }
        catch(Exception e)
        {
            contatto = null;
        }
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
