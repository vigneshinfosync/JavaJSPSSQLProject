<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Employee Management System</title>

<style>

body {
    background-color: lightblue;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 40px 20px;
}

.container {
    width: 650px;
    margin: auto;
}

h1 {
    text-align: center;
    color: #172033;
    margin-bottom: 35px;
}

.formBox {
    width: 100%;
    box-sizing: border-box;
    padding: 35px;
    margin-bottom: 45px;
    border-radius: 12px;
    text-align: center;
}

.formBox h2 {
    margin-top: 0;
    margin-bottom: 30px;
}

.insertBox {
    background-color: #ffd1dc;
}

.updateBox {
    background-color: #7fc7e8;
}

.viewBox {
    background-color: orange;
}

.deleteBox {
    background-color: #ffff99;
}

.insertForm {
    width: 500px;
    margin: auto;
}

.insertRow {
    display: grid;
    grid-template-columns: 170px 250px;
    column-gap: 15px;
    align-items: center;
    margin-bottom: 18px;
}

.insertRow label {
    text-align: right;
    font-size: 16px;
}

.insertRow input {
    width: 250px;
    box-sizing: border-box;
    margin: 0;
}

.updateForm {
    width: 560px;
    margin: auto;
}

.updateRow {
    display: grid;
    grid-template-columns: 150px 390px;
    column-gap: 15px;
    align-items: center;
    margin-bottom: 18px;
    min-height: 38px;
}

.updateLabel {
    text-align: right;
    font-size: 16px;
}

input,
select {
    padding: 9px;
    border: 1px solid #999;
    border-radius: 5px;
    font-size: 14px;
    box-sizing: border-box;
}

.updateRow select {
    width: 80px;
}

.checkboxField {
    display: flex;
    align-items: center;
    gap: 8px;
}

.checkboxField input[type="checkbox"] {
    width: 18px;
    height: 18px;
    margin: 0;
    cursor: pointer;
}

.checkboxField label {
    cursor: pointer;
    white-space: nowrap;
}

.fieldValue {
    width: 170px;
    margin-left: 12px;
}

input[type="submit"] {
    background-color: #2563eb;
    color: white;
    border: none;
    padding: 11px 28px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 14px;
    margin-top: 10px;
}

input[type="submit"]:hover {
    background-color: #1d4ed8;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: white;
    margin-top: 25px;
}

th,
td {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
}

th {
    background-color: #1f2937;
    color: white;
}

.message {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
}

</style>

</head>

<body>

<div class="container">

<h1>Employee Management System</h1>


<div class="formBox insertBox">

<h2>Insert Record</h2>

<form action="process.jsp"
      method="POST"
      class="insertForm">

<div class="insertRow">

<label>First Name:</label>

<input type="text"
       name="firstname"
       placeholder="Enter First Name"
       required>

</div>

<div class="insertRow">

<label>Last Name:</label>

<input type="text"
       name="lastname"
       placeholder="Enter Last Name"
       required>

</div>

<div class="insertRow">

<label>Age:</label>

<input type="number"
       name="age"
       placeholder="Enter Age"
       required>

</div>

<div class="insertRow">

<label>Phone Number:</label>

<input type="text"
       name="phonenumber"
       placeholder="Enter Phone Number"
       required>

</div>

<div class="insertRow">

<label>Join Date:</label>

<input type="date"
       name="join_date"
       required>

</div>

<div class="insertRow">

<label>Department:</label>

<input type="text"
       name="department"
       placeholder="Enter Department"
       required>

</div>

<input type="hidden"
       name="operation"
       value="insert">

<input type="submit"
       value="Insert">

</form>

</div>


<div class="formBox updateBox">

<h2>Update Record</h2>

<form action="process.jsp"
      method="POST"
      class="updateForm">


<div class="updateRow">

<div class="updateLabel">
ID:
</div>

<select name="id">

<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>

</select>

</div>


<div class="updateRow">

<div class="updateLabel">
First Name:
</div>

<div class="checkboxField">

<input type="checkbox"
       name="myField"
       value="firstname"
       id="firstname">

<label for="firstname">Select</label>

<input type="text"
       name="firstnameValue"
       class="fieldValue"
       placeholder="Enter value">

</div>

</div>


<div class="updateRow">

<div class="updateLabel">
Last Name:
</div>

<div class="checkboxField">

<input type="checkbox"
       name="myField"
       value="lastname"
       id="lastname">

<label for="lastname">Select</label>

<input type="text"
       name="lastnameValue"
       class="fieldValue"
       placeholder="Enter value">

</div>

</div>


<div class="updateRow">

<div class="updateLabel">
Phone Number:
</div>

<div class="checkboxField">

<input type="checkbox"
       name="myField"
       value="phonenumber"
       id="phonenumber">

<label for="phonenumber">Select</label>

<input type="text"
       name="phonenumberValue"
       class="fieldValue"
       placeholder="Enter value">

</div>

</div>


<div class="updateRow">

<div class="updateLabel">
Age:
</div>

<div class="checkboxField">

<input type="checkbox"
       name="myField"
       value="age"
       id="age">

<label for="age">Select</label>

<input type="number"
       name="ageValue"
       class="fieldValue"
       placeholder="Enter value">

</div>

</div>


<div class="updateRow">

<div class="updateLabel">
Join Date:
</div>

<div class="checkboxField">

<input type="checkbox"
       name="myField"
       value="join_date"
       id="join_date">

<label for="join_date">Select</label>

<input type="date"
       name="joinDateValue"
       class="fieldValue">

</div>

</div>


<div class="updateRow">

<div class="updateLabel">
Department:
</div>

<div class="checkboxField">

<input type="checkbox"
       name="myField"
       value="department"
       id="department">

<label for="department">Select</label>

<input type="text"
       name="departmentValue"
       class="fieldValue"
       placeholder="Enter value">

</div>

</div>


<input type="hidden"
       name="operation"
       value="update">

<input type="submit"
       value="Update">

</form>

</div>


<div class="formBox viewBox">

<h2>Get All Employees</h2>

<form action="index.jsp"
      method="GET">

<input type="submit"
       name="show"
       value="Show Employees">

</form>

</div>


<div class="formBox deleteBox">

<h2>Delete Record</h2>

<form action="process.jsp"
      method="POST">

<div class="updateRow">

<div class="updateLabel">
ID:
</div>

<select name="id">

<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>

</select>

</div>

<input type="hidden"
       name="operation"
       value="delete">

<input type="submit"
       value="Delete">

</form>

</div>


<%

String show = request.getParameter("show");

if (show != null) {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/javaconnect",
            "root",
            "Vikky@sql1"
        );

        st = con.createStatement();

        rs = st.executeQuery(
            "SELECT * FROM employees"
        );

%>

<h2 style="text-align:center;">
All Employees
</h2>

<table>

<tr>

<th>ID</th>
<th>First Name</th>
<th>Last Name</th>
<th>Age</th>
<th>Phone</th>
<th>Join Date</th>
<th>Department</th>

</tr>

<%

while (rs.next()) {

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td><%= rs.getString("firstname") %></td>

<td><%= rs.getString("lastname") %></td>

<td><%= rs.getInt("age") %></td>

<td><%= rs.getString("phonenumber") %></td>

<td><%= rs.getDate("Join_date") %></td>

<td><%= rs.getString("Department") %></td>

</tr>

<%

}

%>

</table>

<%

    } catch (Exception e) {

        out.println(
            "<p class='message'>"
            + e.getMessage()
            + "</p>"
        );

    } finally {

        try {
            if (rs != null) rs.close();
        } catch (Exception e) {}

        try {
            if (st != null) st.close();
        } catch (Exception e) {}

        try {
            if (con != null) con.close();
        } catch (Exception e) {}

    }

}

%>

</div>

</body>

</html>