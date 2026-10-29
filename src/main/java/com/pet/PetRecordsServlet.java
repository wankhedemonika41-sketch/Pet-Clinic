
package com.pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/petRecords")
public class PetRecordsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<PetVisit> visits = new ArrayList<>();

        String sql =
            "SELECT id, owner_name, pet_type, charges, visit_date " +
            "FROM pet_visits ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PetVisit visit = new PetVisit(
                    rs.getInt("id"),
                    rs.getString("owner_name"),
                    rs.getString("pet_type"),
                    rs.getBigDecimal("charges"),
                    rs.getDate("visit_date")
                );

                visits.add(visit);
            }

            request.setAttribute("visits", visits);

            request.getRequestDispatcher("/petRecords.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                "Unable to load pet visit records.", e
            );
        }
    }
}
