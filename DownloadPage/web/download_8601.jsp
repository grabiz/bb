<%-- 
    Document   : download_8601
    Created on : Mar 23, 2017, 10:29:07 AM
    Author     : NGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Downloads</h1>
        <h3>86 (the band)- True life of songs and pictures</h3>
        <table>
            <tr>
                <th>Song Title</th>
                <th>Audio Format</th>
            </tr>
            <tr>
                <td>You're a star</td>
                <td><a href="./WEB-INF/musicStore/music/${producCode}star.mp3">MP3</a></td>
            </tr>
            <tr>
                <td>Don't make no difference</td>
                <td><a href="./WEB-INF/musicStore/music/${producCode}/no_difference.mp3">MP3</a></td>
            </tr>
        </table>
    </body>
</html>
