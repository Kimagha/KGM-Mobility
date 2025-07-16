<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<%
	String sessionId = (String) session.getAttribute("userId");
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = "", password = "", name = "", gender = "", birth = "", mail = "", phone = "", address = "";
String year = "", month = "", day = "", mail1 = "", mail2 = "", number = "";

try {
    String sql = "SELECT * FROM member WHERE id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, sessionId);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
        id = rs.getString("id");
        password = rs.getString("password");
        name = rs.getString("name");
        gender = rs.getString("gender");
        birth = rs.getString("birth");
        mail = rs.getString("mail");
        phone = rs.getString("phone");
        address = rs.getString("address");
        number = rs.getString("number");

        String[] birthParts = birth.split("/");
        year = birthParts[0];
        month = birthParts[1];
        day = birthParts[2];

        String[] mailParts = mail.split("@");
        mail1 = mailParts[0];
        mail2 = mailParts[1];
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
}
%>
	
	<title>회원 수정</title>
</head>
<body onload="init()">
	<div class="top-nav">
    <jsp:include page="/menu.jsp" />
    </div>
    
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
		<h1 class="display-3">회원 수정</h1>
		</div>
	</div>		
	

	<div class="container">
        <form name="newMember" class="form-horizontal" action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()">
            <div class="form-group row">
                <label class="col-sm-2">아이디</label>
                <div class="col-sm-3">
                    <input name="id" type="text" class="form-control" placeholder="id" value="<%= id %>" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">비밀번호</label>
                <div class="col-sm-3">
                    <input name="password" type="text" class="form-control" placeholder="password" value="<%= password %>" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">비밀번호확인</label>
                <div class="col-sm-3">
                    <input name="password_confirm" type="text" class="form-control" placeholder="password_confirm" value="<%= password %>" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">성명</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" placeholder="name" value="<%= name %>" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">성별</label>
                <div class="col-sm-10">
                    <input name="gender" type="radio" value="남" <%= gender.equals("남") ? "checked" : "" %>> 남
                    <input name="gender" type="radio" value="여" <%= gender.equals("여") ? "checked" : "" %>> 여
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">생일</label>
                <div class="col-sm-4">
                    <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" value="<%= year %>">
                    <select name="birthmm" id="birthmm">
                        <option value="">월</option>
                        <option value="01" <%= month.equals("01") ? "selected" : "" %>>1</option>
                        <option value="02" <%= month.equals("02") ? "selected" : "" %>>2</option>
                        <option value="03" <%= month.equals("03") ? "selected" : "" %>>3</option>
                        <option value="04" <%= month.equals("04") ? "selected" : "" %>>4</option>
                        <option value="05" <%= month.equals("05") ? "selected" : "" %>>5</option>
                        <option value="06" <%= month.equals("06") ? "selected" : "" %>>6</option>
                        <option value="07" <%= month.equals("07") ? "selected" : "" %>>7</option>
                        <option value="08" <%= month.equals("08") ? "selected" : "" %>>8</option>
                        <option value="09" <%= month.equals("09") ? "selected" : "" %>>9</option>
                        <option value="10" <%= month.equals("10") ? "selected" : "" %>>10</option>
                        <option value="11" <%= month.equals("11") ? "selected" : "" %>>11</option>
                        <option value="12" <%= month.equals("12") ? "selected" : "" %>>12</option>
                    </select>
                    <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="<%= day %>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">이메일</label>
                <div class="col-sm-10">
                    <input type="text" name="mail1" maxlength="50" value="<%= mail1 %>">@
                    <select name="mail2" id="mail2">
                        <option value="naver.com" <%= mail2.equals("naver.com") ? "selected" : "" %>>naver.com</option>
                        <option value="daum.net" <%= mail2.equals("daum.net") ? "selected" : "" %>>daum.net</option>
                        <option value="gmail.com" <%= mail2.equals("gmail.com") ? "selected" : "" %>>gmail.com</option>
                        <option value="nate.com" <%= mail2.equals("nate.com") ? "selected" : "" %>>nate.com</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">전화번호</label>
                <div class="col-sm-3">
                    <input name="phone" type="text" class="form-control" placeholder="phone" value="<%= phone %>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">주소</label>
                <div class="col-sm-5">
                    <input name="address" type="text" class="form-control" placeholder="address" value="<%= address %>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">주민번호</label>
                <div class="col-sm-5">
                    <input name="number" type="text" class="form-control" placeholder="number" value="<%= number %>">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="회원수정">
                    <a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
                </div>
            </div>
        </form>
    </div>
    <div class="container py-4">
	<div class="container-fluid py-5">
	</div>
	</div>
	
	<div class="row text-center">
 <div class="col-md-12">
	<img src="https://210.119.103.168:8080/uploads/gg551098/KGMFOOT.png" style="width : 100%; height :100%;"/>
  </div>
 </div>
</body>
</html>

<script type="text/javascript">
    function init() {
        setComboMailValue("<%= mail2 %>");
        setComboBirthValue("<%= month %>");
    }

    function setComboMailValue(val) {
        var selectMail = document.getElementById('mail2');
        for (var i = 0; i < selectMail.length; i++) {
            if (selectMail.options[i].value == val) {
                selectMail.options[i].selected = true;
                break;
            }
        }
    }

    function setComboBirthValue(val) {
        var selectBirth = document.getElementById('birthmm');
        for (var i = 0; i < selectBirth.length; i++) {
            if (selectBirth.options[i].value == val) {
                selectBirth.options[i].selected = true;
                break;
            }
        }
    }

    function checkForm() {
        if (!document.newMember.id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (!document.newMember.password.value) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if (document.newMember.password.value != document.newMember.password_confirm.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
    }
</script>