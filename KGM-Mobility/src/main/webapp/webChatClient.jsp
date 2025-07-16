<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>KGM Web Chat</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Pretendard&display=swap" rel="stylesheet">
  <style>
    * {
      font-family: 'Pretendard', sans-serif;
      box-sizing: border-box;
    }

    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      background: url('https://210.119.103.168:8080/uploads/gg551098/KGMCHATBACK.png');
      display: flex;
      justify-content: center;
      align-items: center; 
    }

    #main-container {
      width: 100%;
      max-width: 500px;
      height: 100%;
      max-height: 720px;
      background: rgba(255, 255, 255, 0.04);
      border-radius: 18px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.4);
      backdrop-filter: blur(14px);
      border: 1px solid rgba(255,255,255,0.08);
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }

    #chat-container {
      flex: 1;
      padding: 20px;
      overflow-y: auto;
      font-size: 15px;
      color: #f1f1f1;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    .chat, .my-chat {
      padding: 12px 16px;
      max-width: 78%;
      line-height: 1.5;
      border-radius: 18px;
      word-break: break-word;
      display: inline-block;
    }

    .chat {
      background: rgba(255,255,255,0.08);
      color: #ccc;
      align-self: flex-start;
    }

    .my-chat {
      background: #00b894;
      color: white;
      align-self: flex-end;
    }

    .notice {
      text-align: center;
      color: #999;
      font-size: 13px;
      margin: 10px 0;
    }

    #bottom-container {
      display: flex;
      padding: 14px;
      gap: 10px;
      background: rgba(255, 255, 255, 0.035);
      border-top: 1px solid rgba(255,255,255,0.07);
    }

    #inputMessage {
      flex: 1;
      padding: 11px 15px;
      border: none;
      border-radius: 10px;
      font-size: 15px;
      background-color: rgba(255,255,255,0.1);
      color: #fff;
      outline: none;
      transition: box-shadow 0.2s ease;
    }

    #inputMessage:focus {
      box-shadow: 0 0 5px #00b894;
    }

    #btnSubmit, #btnBack {
      padding: 10px 18px;
      min-width: 90px;
      border: none;
      border-radius: 6px;
      font-size: 15px;
      font-weight: 600;
      letter-spacing: 1px;
      cursor: pointer;
      transition: 0.2s ease;
    }

    #btnSubmit {
      background-color: #00b894;
      color: white;
    }

    #btnSubmit:hover {
      background-color: #019170;
    }

    #btnBack {
      background-color: #636e72;
      color: white;
    }

    #btnBack:hover {
      background-color: #2d3436;
    }

    @media (max-width: 600px) {
      #main-container {
        width: 100%;
        height: 100%;
        border-radius: 0;
      }

      #bottom-container {
        flex-direction: column;
      }

      #btnSubmit, #btnBack {
        width: 100%;
        margin-top: 4px;
      }
    }
  </style>
</head>
<body>

<div id="main-container">
  <div id="chat-container"></div>
  <div id="bottom-container">
    <input id="inputMessage" type="text" placeholder="메시지 입력..." autocomplete="off">
    <button id="btnSubmit">전송</button>
    <button id="btnBack" onclick="goBack()">나가기</button>
  </div>
</div>

<%
  String wsSite;
  boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
  if (isWindows)
    wsSite = "ws://localhost:8080/KJWPRJ/webChatServer";
  else
    wsSite = "wss://210.119.103.168:8080/gg551098/webChatServer";
%>

<script>
  const webSocket = new WebSocket("<%= wsSite %>");
  const chatContainer = document.getElementById("chat-container");
  const inputMessage = document.getElementById("inputMessage");

  webSocket.onmessage = function (e) {
    const message = document.createElement("div");
    message.className = "chat";
    message.textContent = e.data;
    chatContainer.appendChild(message);
    chatContainer.scrollTop = chatContainer.scrollHeight;
  };

  webSocket.onopen = function () {
    const notice = document.createElement("div");
    notice.className = "notice";
    notice.textContent = "🚗 KGM 채팅 서버에 연결되었습니다";
    chatContainer.appendChild(notice);
  };

  webSocket.onerror = function (e) {
    alert("에러 발생: " + e.data);
  };

  function send() {
    const text = inputMessage.value.trim();
    if (text === "") return;

    const myMsg = document.createElement("div");
    myMsg.className = "my-chat";
    myMsg.textContent = text;
    chatContainer.appendChild(myMsg);

    webSocket.send(text);
    inputMessage.value = "";
    chatContainer.scrollTop = chatContainer.scrollHeight;
  }

  function goBack() {
    window.location.href = "index.jsp";
  }

  $(function () {
    $('#btnSubmit').click(send);
    $('#inputMessage').keydown(function (key) {
      if (key.keyCode === 13) send();
    });
  });
</script>

</body>
</html>
