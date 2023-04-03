<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*"%>
<%@page import="com.google.gson.*"%>
<%
    // Load the JSON data from file
    InputStream inputStream = new FileInputStream(new File("students.json"));
    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
    Gson gson = new Gson();
    JsonElement jsonElement = gson.fromJson(reader, JsonElement.class);
    JsonArray jsonArray = jsonElement.getAsJsonArray();
%>

<html>
<head>
    <title>Student Table</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Student</th>
                <th>Rollno</th>
            </tr>
        </thead>
        <tbody>
            <% for (JsonElement element : jsonArray) {
                   JsonObject jsonObject = element.getAsJsonObject();
                   String name = jsonObject.get("name").getAsString();
                   int rollno = jsonObject.get("rollno").getAsInt();
               %>
               <tr>
                   <td><%= name %></td>
                   <td><%= rollno %></td>
               </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>