
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pet.PetVisit" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 30px;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background: #333;
            color: white;
        }
        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background: #333;
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Pet Clinic Visit Records</h2>

    <% if ("1".equals(request.getParameter("success"))) { %>
        <p class="success">Pet visit record saved successfully!</p>
    <% } %>
    <table>
        <tr>
            <th>ID</th>
            <th>Owner</th>
            <th>Pet</th>
            <th>Charges (Rs.)</th>
            <th>Visit Date</th>
        </tr>
        <%
            List<PetVisit> visits =
                (List<PetVisit>) request.getAttribute("visits");

            if (visits != null && !visits.isEmpty()) {
                for (PetVisit visit : visits) {
        %>
        <tr>
            <td><%= visit.getId() %></td>
            <td><%= visit.getOwnerName() %></td>
            <td><%= visit.getPetType() %></td>
            <td><%= visit.getCharges().toPlainString() %></td>
            <td><%= visit.getVisitDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" class="empty">
                no pet visit records found
            </td>
        </tr>
        <%
            }
            %>
        </table>

        <a class="button"
        href="<%= request.getContextPath() %>/pet.jsp">
                Add New Visit
            </a>
        </div>
    </body>
</html>
