<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Process</title>

<style>

body {
    background-color: lightgreen;
    font-family: Arial;
    text-align: center;
    padding-top: 100px;
}

.messageBox {
    width: 500px;
    margin: auto;
    background-color: #1f2937;
    color: white;
    padding: 40px;
    border-radius: 10px;
}

a {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #2563eb;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

</style>

</head>

<body>

<div class="messageBox">

<%

String operation = request.getParameter("operation");

Connection con = null;

PreparedStatement ps = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/javaconnect",
        "root",
        "Vikky@sql1"
    );


    if ("insert".equals(operation)) {

        String firstname =
            request.getParameter("firstname");

        String lastname =
            request.getParameter("lastname");

        String ageString =
            request.getParameter("age");

        String phonenumber =
            request.getParameter("phonenumber");

        String joinDate =
            request.getParameter("join_date");

        String department =
            request.getParameter("department");

        int age =
            Integer.parseInt(ageString);

        String sql =
            "INSERT INTO employees "
            + "(firstname, lastname, age, phonenumber, Join_date, Department) "
            + "VALUES (?, ?, ?, ?, ?, ?)";

        ps = con.prepareStatement(sql);

        ps.setString(1, firstname);
        ps.setString(2, lastname);
        ps.setInt(3, age);
        ps.setString(4, phonenumber);
        ps.setString(5, joinDate);
        ps.setString(6, department);

        int result =
            ps.executeUpdate();

        if (result > 0) {

%>

<h1>Employee Inserted Successfully</h1>

<%

        }

    }


    else if ("update".equals(operation)) {

        String idString =
            request.getParameter("id");

        String field =
            request.getParameter("myField");

        int id =
            Integer.parseInt(idString);

        String fieldValue = null;

        String sql = null;


        if ("firstname".equals(field)) {

            fieldValue =
                request.getParameter("firstnameValue");

            sql =
                "UPDATE employees SET firstname=? WHERE id=?";

        }

        else if ("lastname".equals(field)) {

            fieldValue =
                request.getParameter("lastnameValue");

            sql =
                "UPDATE employees SET lastname=? WHERE id=?";

        }

        else if ("phonenumber".equals(field)) {

            fieldValue =
                request.getParameter("phonenumberValue");

            sql =
                "UPDATE employees SET phonenumber=? WHERE id=?";

        }

        else if ("age".equals(field)) {

            fieldValue =
                request.getParameter("ageValue");

            sql =
                "UPDATE employees SET age=? WHERE id=?";

        }

        else if ("join_date".equals(field)) {

            fieldValue =
                request.getParameter("joinDateValue");

            sql =
                "UPDATE employees SET Join_date=? WHERE id=?";

        }

        else if ("department".equals(field)) {

            fieldValue =
                request.getParameter("departmentValue");

            sql =
                "UPDATE employees SET Department=? WHERE id=?";

        }


        if (sql == null) {

            throw new Exception(
                "Please select a field."
            );

        }


        if (fieldValue == null ||
            fieldValue.trim().equals("")) {

            throw new Exception(
                "Please enter a value."
            );

        }


        ps =
            con.prepareStatement(sql);


        if ("age".equals(field)) {

            int age =
                Integer.parseInt(fieldValue);

            ps.setInt(1, age);

        }

        else {

            ps.setString(1, fieldValue);

        }


        ps.setInt(2, id);


        int result =
            ps.executeUpdate();


        if (result > 0) {

%>

<h1>Employee Updated Successfully</h1>

<%

        }

        else {

%>

<h1>Employee ID Not Found</h1>

<%

        }

    }


    else if ("delete".equals(operation)) {

        String idString =
            request.getParameter("id");

        int id =
            Integer.parseInt(idString);

        String sql =
            "DELETE FROM employees WHERE id=?";

        ps =
            con.prepareStatement(sql);

        ps.setInt(1, id);

        int result =
            ps.executeUpdate();

        if (result > 0) {

%>

<h1>Employee Deleted Successfully</h1>

<%

        }

        else {

%>

<h1>Employee ID Not Found</h1>

<%

        }

    }


    else {

%>

<h1>Invalid Operation</h1>

<%

    }

}

catch (Exception e) {

%>

<h1>Operation Failed</h1>

<p>
<%= e.getMessage() %>
</p>

<%

    e.printStackTrace();

}

finally {

    try {

        if (ps != null)
            ps.close();

    }

    catch (Exception e) {}


    try {

        if (con != null)
            con.close();

    }

    catch (Exception e) {}

}

%>

<a href="index.jsp">
Back to Employee Management
</a>

</div>

</body>

</html>