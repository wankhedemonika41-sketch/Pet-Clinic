
package com.pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.LocalDate;

@WebServlet("/pet")
public class PetServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String owner = request.getParameter("user");
        String pet = request.getParameter("action");
        String charge = request.getParameter("charge");
        String date = request.getParameter("dt");

        try {
            if (owner == null || owner.trim().isEmpty()) {
                throw new IllegalArgumentException("Enter owner name.");
            }

            if (pet == null ||
                    !(pet.equals("dog") || pet.equals("cat")
                    || pet.equals("bird") || pet.equals("rabbit"))) {
                throw new IllegalArgumentException("Select a valid pet.");
            }

            BigDecimal charges = new BigDecimal(charge);

            if (charges.compareTo(BigDecimal.ZERO) <= 0) {
                throw new IllegalArgumentException(
                    "Charges must be greater than zero."
                );
            }

            LocalDate visitDate = LocalDate.parse(date);

            if (visitDate.isAfter(LocalDate.now())) {
                throw new IllegalArgumentException(
                    "Visit date cannot be in the future."
                );
            }

            String sql = "INSERT INTO pet_visits "
                    + "(owner_name, pet_type, charges, visit_date) "
                    + "VALUES (?, ?, ?, ?)";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, owner.trim());
                ps.setString(2, pet);
                ps.setBigDecimal(3, charges);
                ps.setDate(4, Date.valueOf(visitDate));

                ps.executeUpdate();
            }

            response.sendRedirect(
                request.getContextPath() + "/petRecords?success=1"
            );

        } catch (IllegalArgumentException e) {
            response.setContentType("text/plain;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(e.getMessage());

        } catch (Exception e) {
            throw new ServletException(
                "Unable to save pet visit record.", e
            );
        }
    }
}
