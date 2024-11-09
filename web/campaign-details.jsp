<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- jQuery và Bootstrap (đảm bảo đã thêm vào trang của bạn) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
    /* Styles for better layout and design */
    .tabcontent {
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    h4 {
        font-size: 1.4rem;
        color: #333;
        margin-bottom: 10px;
    }

    .info-list {
        margin: 20px 0;
    }

    .campaign-item {
        margin-bottom: 20px;
        padding-bottom: 15px;
        border-bottom: 2px solid #20c997;
    }

    .campaign-name {
        color: #333; /* Màu chữ */
        display: inline-block; /* Hiển thị như khối */
        position: relative; /* Để định vị gạch dưới */
        padding-bottom: 5px; /* Khoảng cách giữa chữ và gạch */
        z-index: 1; /* Đảm bảo chữ hiển thị trên gạch */
    }

    .campaign-name::before {
        content: ''; /* Nội dung rỗng */
        position: absolute; /* Định vị tuyệt đối */
        left: 0; /* Bên trái */
        bottom: 5px; /* Đặt gạch ở dưới cùng của chữ */
        width: 100%; /* Chiều rộng bằng 100% */
        height: 15px; /* Chiều cao của gạch */
        background-color: #20c997; /* Màu gạch */
        opacity: .5;
        z-index: -1;
    }


    .label {
        font-weight: bold;
        color: #333;
    }
    .comments-area h4 {
        margin-top: 20px;
        font-size: 1.3rem;
        color: #333;
        margin-bottom: 15px;
    }

    .comment-list {
        margin-bottom: 15px;
        padding: 10px;
        border-radius: 8px;
        background-color: #f1f1f1;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.05);
    }

    .single-comment .thumb img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .desc {
        margin-left: 10px;
    }

    .desc .comment {
        font-size: 1rem;
        color: #555;
    }

    .comment-form h4 {
        font-size: 1.3rem;
        margin-top: 20px;
        color: #333;
    }

    .comment_form .form-control {
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 15px;
        margin-top: 10px;
    }

    .comment_form .button {
        margin-top: 10px;
        padding: 10px 20px;
        background-color: #20c997;
        border: 2px solid #20c997;
        ;
        color: #fff !important;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .comment_form .button:hover {
        background-color: #fff;
        color: #20c997 !important;
    }
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }
    .modal-dialog {
        margin: 15% auto;
        width: 80%;
    }
</style>

<div id="Campaigns" class="tabcontent" style="height: auto">
    <%-- Hiển thị danh sách các Campaigns --%>
    <c:if test="${not empty campaigns}">
        <div class="info-list">     
            <c:forEach items="${campaigns}" var="campaign">
                <div class="campaign-item">
                    <h4 class="campaign-name">${campaign.campaignName}</h4>
                    <p><strong class="label">Ngày tạo:</strong> ${campaign.createDate}</p>
                    <p><strong class="label">Địa điểm:</strong> ${campaign.campaignLocation}</p>
                    <p style="white-space: pre-line;"><strong class="label">Mô tả:</strong> ${campaign.description}</p>
                    <p style="white-space: pre-line;"><strong class="label">Công việc:</strong> ${campaign.campaignJob}</p>


                    <div style="display: flex; gap: 5px;">
                        <!-- Nút để mở modal bình luận -->
                        <button class="btn btn-primary" onclick="showComments('${campaign.campaignID}')" style="background: #00ca6d; margin-right: 10px;">Xem Bình Luận</button>

                        <!-- Nút để mở modal member -->
                        <button class="btn btn-primary" onclick="showMembers('${campaign.campaignID}')" style="background: #FF4F42; margin-right: 10px;">Xem Thành Viên</button>

                        <!-- Nút Tham gia -->
                        <form onsubmit="event.preventDefault(); toggleJoin('${campaign.campaignID}');">
                            <button type="submit" class="btn btn-secondary" id="joinButton_${campaign.campaignID}">
                                <c:choose>
                                    <c:when test="${userJoinedCampaigns[campaign.campaignID]}">
                                        Đã Tham Gia
                                    </c:when>
                                    <c:otherwise>
                                        Tham Gia
                                    </c:otherwise>
                                </c:choose>
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty campaigns}">
        <p>Không có campaign.</p>
    </c:if>
    <div class="comment-form">
        <h4 style="font-size: xx-large">Nhập bình luận</h4>
        <form class="form-contact comment_form" id="commentForm" onsubmit="event.preventDefault(); submitComment();">
            <div class="mb-3">
                <label for="CID" class="form-label">Hoạt động thực tế</label>
                <select class="form-select" id="CID" name="CID" required>
                    <option value="">Hoạt động</option>
                    <c:forEach items="${campaigns}" var="campaign">
                        <option value="${campaign.campaignID}">${campaign.campaignName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="4" placeholder="Nhập bình luận" required></textarea>
            </div>
            <button type="submit" class="button button-contactForm btn_1 boxed-btn">Gửi bình luận</button>
        </form>
    </div>

    <!-- Modal cho bình luận nằm ngoài vòng lặp foreach -->
    <div id="commentModal" class="modal" style="display:none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Bình Luận</h5>
                    <button type="button" class="close" onclick="document.getElementById('commentModal').style.display = 'none'">&times;</button>
                </div>
                <div class="modal-body" id="commentContent">
                    <!-- Nội dung bình luận sẽ được chèn vào đây -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="document.getElementById('commentModal').style.display = 'none'">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <div id="memberModal" class="modal" style="display:none;">
        <div class="modal-dialog" style="max-width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thành viên</h5>
                    <button type="button" class="close" onclick="document.getElementById('memberModal').style.display = 'none'">&times;</button>
                </div>
                <div class="modal-body" id="memberContent">
                    <!-- Nội dung bình luận sẽ được chèn vào đây -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="document.getElementById('memberModal').style.display = 'none'">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Error Modal -->


    <script>
        function showComments(campaignID) {
            // Gọi servlet để lấy bình luận cho campaignId
            fetch('CampaignComment?campaignId=' + campaignID)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.text();
                    })
                    .then(data => {
                        document.getElementById('commentContent').innerHTML = data;
                        document.getElementById('commentModal').style.display = 'block';
                    })
                    .catch(error => console.error('Error:', error));
        }
        function showMembers(campaignID) {
            // Gọi servlet để lấy bình luận cho campaignId
            fetch('CampaignMember?campaignId=' + campaignID)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.text();
                    })
                    .then(data => {
                        document.getElementById('memberContent').innerHTML = data;
                        document.getElementById('memberModal').style.display = 'block';
                    })
                    .catch(error => console.error('Error:', error));
        }

        function toggleJoin(campaignID) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "JoinCampaign", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var response = JSON.parse(xhr.responseText);
                    const joinButton = document.getElementById('joinButton_' + campaignID);

                    // Kiểm tra nếu phản hồi có thành công hay không
                    if (response.success === false) {
                        alert(response.message); // Hiển thị thông báo lỗi
                        return; // Dừng xử lý nếu có lỗi
                    }

                    // Nếu không có lỗi, xử lý tham gia hoặc rời chiến dịch
                    if (response.joined) {
                        joinButton.textContent = 'Đã Tham Gia';
                        joinButton.classList.remove('btn-secondary');
                        joinButton.classList.add('btn-success');
                    } else {
                        joinButton.textContent = 'Tham Gia';
                        joinButton.classList.remove('btn-success');
                        joinButton.classList.add('btn-secondary');
                    }
                }
            };
            xhr.send("campaignId=" + campaignID); // Gửi thông tin campaignId
        }


        function submitComment() {
            const comment = document.getElementById("comment").value;
            const campaignID = document.getElementById("CID").value;

            const xhr = new XMLHttpRequest();
            xhr.open("POST", "AddCommentCampaign", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        if (response.success) {
                            alert('Comment added successfully!');
                            document.getElementById("commentForm").reset();
                        } else {
                            alert('Error adding comment: ' + response.message);
                        }
                    } else {
                        alert('Request failed with status: ' + xhr.status);
                    }
                }
            };
            xhr.send("comment=" + encodeURIComponent(comment) + "&CID=" + encodeURIComponent(campaignID));
        }

    </script>



</div>


