<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Project Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <style>
            .modal-backdrop {
                z-index: 1040 !important;
            }
            .modal {
                z-index: 1050 !important;
            }
        </style>
        <!-- CSS here -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gijgo.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <!-- Header Area -->
        <header>
            <div class="header-area ">
                <div class="header-top_area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6 col-md-12 col-lg-8">
                                <div class="short_contact_list">
                                    <ul>
                                        <li><a href="#"> <i class="fa fa-phone"></i> +1 (454) 556-5656</a></li>
                                        <li><a href="#"> <i class="fa fa-envelope"></i>Yourmail@gmail.com</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-lg-4">
                                <div class="social_media_links d-none d-lg-block">
                                    <a href="#">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-pinterest-p"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sticky-header" class="main-header-area">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-3">
                                <div class="logo">
                                    <a href="index.html">
                                        <img src="img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-9">
                                <div class="main-menu">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="index.html">home</a></li>
                                            <li><a href="About.html">About</a></li>
                                            <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">blog</a></li>
                                                    <li><a href="single-blog.html">single-blog</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="elements.html">elements</a></li>
                                                    <li><a href="Cause.html">Cause</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="contact.html">Contact</a></li>
                                        </ul>
                                    </nav>
                                    <div class="Appointment">
                                        <div class="book_btn d-none d-lg-block">
                                            <a data-scroll-nav='1' href="#">Make a Donate</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- bradcam_area_start -->
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Project Management</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end -->

        <div class="popular_causes_area section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb-55">
                            <h3><span>Manage Projects</span></h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-right mb-4">
                            <!-- Thêm nút Back -->
                            <a href="${pageContext.request.contextPath}/organization-detail?id=${param.orgId}" class="btn btn-secondary me-2">
                                <i class="fa fa-arrow-left"></i> Back to Organization
                            </a>
                            <a href="${pageContext.request.contextPath}/register-project" class="btn btn-primary">
                                <i class="fa fa-plus"></i> Register Project
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="project" items="${projects}">
                                        <tr>
                                            <td>${project.projectId}</td>
                                            <td>${project.title}</td>
                                            <td>${project.description}</td>
                                            <td><fmt:formatDate value="${project.startDate}" pattern="yyyy-MM-dd"/></td>
                                            <td><fmt:formatDate value="${project.endDate}" pattern="yyyy-MM-dd"/></td>
                                            <td>${project.roleProject}</td>
                                            <td class="action-buttons">
                                                <button onclick="openEditModal('${project.projectId}', '${project.title}', '${project.description}', '<fmt:formatDate value="${project.startDate}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate value="${project.endDate}" pattern="yyyy-MM-dd"/>', '${project.roleProject}')" 
                                                        class="btn btn-sm btn-info">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <a href="project-details?id=${project.projectId}"
                                                   class="btn btn-sm btn-success">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Modal -->
        <div class="modal fade" id="editModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit Project</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" 
                                onclick="document.querySelector('.modal-backdrop').remove();"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editForm" method="post" action="project-management">
                            <input type="hidden" id="projectId" name="projectId">

                            <div class="mb-3">
                                <label class="form-label">Title</label>
                                <input type="text" class="form-control" name="title" id="title" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" name="description" id="description" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Start Date</label>
                                <input type="date" class="form-control" name="startDate" id="startDate" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">End Date</label>
                                <input type="date" class="form-control" name="endDate" id="endDate" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Role</label>
                                <input type="text" class="form-control" name="roleProject" id="roleProject">
                            </div>

                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Area -->
        <footer class="footer">
            <div class="footer_top">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-4 col-md-6 col-lg-4 ">
                            <div class="footer_widget">
                                <div class="footer_logo">
                                    <a href="#">
                                        <img src="img/footer_logo.png" alt="">
                                    </a>
                                </div>
                                <p class="address_text">Lorem ipsum dolor sit amet, <br> consectetur adipiscing elit, sed do <br> eiusmod tempor incididunt ut labore.
                                </p>
                                <div class="socail_links">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <i class="ti-facebook"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ti-twitter-alt"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-dribbble"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 col-lg-2">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Services
                                </h3>
                                <ul class="links">
                                    <li><a href="#">Donate</a></li>
                                    <li><a href="#">Sponsor</a></li>
                                    <li><a href="#">Fundraise</a></li>
                                    <li><a href="#">Volunteer</a></li>
                                    <li><a href="#">Partner</a></li>
                                    <li><a href="#">Jobs</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Contacts
                                </h3>
                                <div class="contacts">
                                    <p>+2(305) 587-3407 <br>
                                        info@loveuscharity.com <br>
                                        Flat 20, Reynolds Neck, North
                                        Helenaville, FV77 8WS
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Top News
                                </h3>
                                <ul class="news_links">
                                    <li>
                                        <div class="thumb">
                                            <a href="#">
                                                <img src="img/news/news_1.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <a href="#">
                                                <h4>School for African 
                                                    Childrens</h4>
                                            </a>
                                            <span>Jun 12, 2019</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumb">
                                            <a href="#">
                                                <img src="img/news/news_2.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <a href="#">
                                                <h4>School for African 
                                                    Childrens</h4>
                                            </a>
                                            <span>Jun 12, 2019</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy-right_text">
                <div class="container">
                    <div class="footer_border"></div>
                    <div class="row">
                        <div class="col-xl-12">
                            <p class="copy_right text-center">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- JS here -->
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/ajax-form.js"></script>
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scrollIt.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.slicknav.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js/gijgo.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>


        <script>
                                    function openEditModal(projectId, title, description, startDate, endDate, roleProject) {
                                        // Trước khi mở modal mới, dọn dẹp modal cũ nếu có
                                        const existingBackdrop = document.querySelector('.modal-backdrop');
                                        if (existingBackdrop) {
                                            existingBackdrop.remove();
                                        }

                                        // Điền dữ liệu vào form
                                        document.getElementById('projectId').value = projectId;
                                        document.getElementById('title').value = title;
                                        document.getElementById('description').value = description;
                                        document.getElementById('startDate').value = startDate;
                                        document.getElementById('endDate').value = endDate;
                                        document.getElementById('roleProject').value = roleProject;

                                        // Khởi tạo và hiển thị modal
                                        const editModal = document.getElementById('editModal');
                                        const modal = new bootstrap.Modal(editModal);

                                        // Thêm event listener để dọn dẹp backdrop khi modal đóng
                                        editModal.addEventListener('hidden.bs.modal', function () {
                                            const backdrop = document.querySelector('.modal-backdrop');
                                            if (backdrop) {
                                                backdrop.remove();
                                            }
                                            document.body.classList.remove('modal-open');
                                        });

                                        modal.show();
                                    }

// Thêm event listener cho nút đóng modal
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const closeButtons = document.querySelectorAll('[data-bs-dismiss="modal"]');
                                        closeButtons.forEach(button => {
                                            button.addEventListener('click', function () {
                                                const backdrop = document.querySelector('.modal-backdrop');
                                                if (backdrop) {
                                                    backdrop.remove();
                                                }
                                                document.body.classList.remove('modal-open');
                                            });
                                        });
                                    });
        </script>
    </body>
</html>