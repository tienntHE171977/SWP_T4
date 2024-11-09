<%-- 
    Document   : newjsp
    Created on : Nov 6, 2024, 6:29:30 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Chat Bot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f7f7f7;
        }
        .chat-container {
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .messages {
            padding: 10px;
            height: 300px;
            overflow-y: auto;
            border-bottom: 1px solid #ccc;
        }
        .input-container {
            display: flex;
            padding: 10px;
        }
        .input-container select {
            flex: 1;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .input-container button {
            padding: 5px 10px;
            margin-left: 5px;
            border: none;
            background-color: #333;
            color: white;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="messages" id="messages"></div>
        <div class="input-container">
            <select id="questionSelect">
                <option value="">Chọn một câu hỏi</option>
                <option value="question1">Câu hỏi 1</option>
                <option value="question2">Câu hỏi 2</option>
                <option value="question3">Câu hỏi 3</option>
            </select>
            <button onclick="getAnswer()">Hỏi</button>
        </div>
    </div>

    <script>
        const answers = {
            question1: "Đây là đáp án cho câu hỏi 1.",
            question2: "Đây là đáp án cho câu hỏi 2.",
            question3: "Đây là đáp án cho câu hỏi 3."
        };

        function getAnswer() {
            const select = document.getElementById('questionSelect');
            const messages = document.getElementById('messages');
            const selectedQuestion = select.value;

            if (selectedQuestion) {
                const answer = answers[selectedQuestion];
                const messageElement = document.createElement('div');
                messageElement.textContent = answer;
                messages.appendChild(messageElement);
                messages.scrollTop = messages.scrollHeight;
            }
        }
    </script>
</body>
</html>

