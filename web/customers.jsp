<%@page import="entity.Address"%>
<!--
=========================================================
* Soft UI Dashboard - v1.0.7
=========================================================

* Product Page: https://www.creative-tim.com/product/soft-ui-dashboard
* Copyright 2023 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="entity.Customer,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/RetrieveCustomerAdm"/>

<%
    ArrayList<Customer> custList = new ArrayList<Customer>();

    if (session.getAttribute("custList") != null) {
        custList = (ArrayList<Customer>) session.getAttribute("custList");
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <link
            rel="apple-touch-icon"
            sizes="76x76"
            href="/assets/img/apple-icon.png"
            />
        <link rel="icon" type="image/png" href="/assets/img/art_logo.png" />
        <title>Soft UI Dashboard by Creative Tim</title>
        <!--     Fonts and icons     -->
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
            rel="stylesheet"
            />
        <!-- Nucleo Icons -->
        <link href="/assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script
            src="https://kit.fontawesome.com/42d5adcbca.js"
            crossorigin="anonymous"
        ></script>
        <link href="/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link
            id="pagestyle"
            href="/assets/css/soft-ui-dashboard.css?v=1.0.7"
            rel="stylesheet"
            />
        <!-- Nepcha Analytics (nepcha.com) -->
        <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
        <script
            defer
            data-site="YOUR_DOMAIN_HERE"
            src="https://api.nepcha.com/js/nepcha-analytics.js"
        ></script>

        <script type="text/javascript">
            function confirmDelete() {
                var result = confirm('Are you sure you want to delete?');
                if (result) {
                    document.getElementById('deleteForm').submit(); // Submit the form if user confirms
                }
            }
        </script>
    </head>

    <body class="g-sidenav-show bg-gray-100">
        <!-- Aside -->
        <%@ include file="components/aside.jsp" %>
        <!-- End Aside -->

        <main
            class="main-content position-relative max-height-vh-100 h-100 border-radius-lg"
            >
            <!-- Navbar -->
            <nav
                class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
                id="navbarBlur"
                navbar-scroll="true"
                >
                <div class="container-fluid py-1 px-4">
                    <nav aria-label="breadcrumb">
                        <h6 class="font-weight-bolder mb-0">Customers</h6>
                    </nav>
                    <div class="container-fluid py-1 px-3">
                        <nav aria-label="breadcrumb">
                            <ul class="navbar-nav justify-content-end">
                                <li class="nav-item d-flex align-items-center">
                                    <a
                                        href="sign-in.jsp"
                                        class="nav-link text-body font-weight-bold px-0"
                                        >
                                        <i class="fa fa-user me-sm-1"></i>
                                        <span class="d-sm-inline d-none">Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->

            <div class="container-fluid py-4">
                <div class="row">
                    <div class="col-12">
                        <div class="card mb-4">
                            <div class="card-header pb-0 d-flex flex-row align-items-center">
                                <h6>Customer</h6>
                                <div class="input-group w-25 mx-4">
                                    <span class="input-group-text text-body"
                                          ><i class="fas fa-search" aria-hidden="true"></i
                                        ></span>
                                    <input
                                        type="text"
                                        class="form-control"
                                        placeholder="Type here..."
                                        />
                                </div>

                                <div class="w-50 text-end">
                                    <a href="addCustomer.jsp">
                                        <button id="add-product-btn" class="btn btn-primary" >
                                            Add Customer
                                        </button>
                                    </a>
                                </div>
                            </div>

                            <div class="card-body px-0 pt-0 pb-2">
                                <div class="table-responsive p-0">
                                    <table class="table align-items-center mb-0">
                                        <thead>
                                            <tr>
                                                <th
                                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                                    >
                                                    Customer
                                                </th>
                                                <th
                                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                                    >
                                                    Username
                                                </th>
                                                <th
                                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                                    >
                                                    Email
                                                </th>
                                                <th
                                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                                    >
                                                    Contact
                                                </th>
                                                <th
                                                    class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                                    >
                                                    Gender
                                                </th>
                                                <th
                                                    class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                                    >
                                                    Date of Birth
                                                </th>
                                                <th
                                                    class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                                    >
                                                    Address
                                                </th>
                                                <th
                                                    class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                                    >
                                                    Address
                                                </th>
                                                <th class="text-secondary opacity-7"></th>
                                                <th class="text-secondary opacity-7"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Customer customer = null;
                                                for (int i = 0; i < custList.size(); i++) {
                                                    customer = custList.get(i);
                                            %>
                                            <tr>
                                                <td>
                                                    <div class="d-flex px-2 py-1">
                                                        <div>
                                                            <img
                                                                src="/assets/img/team-2.jpg"
                                                                class="avatar avatar-sm me-3"
                                                                alt="user1"
                                                                />
                                                        </div>
                                                        <div
                                                            class="d-flex flex-column justify-content-center"
                                                            >
                                                            <h6 class="mb-0 text-sm">
                                                                <%= customer.getFirstName()%>&nbsp;
                                                                <%= customer.getLastName()%></h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="text-xs font-weight-bold mb-0"><%= customer.getUsername()%></p>
                                                </td>
                                                <td>
                                                    <p class="text-xs font-weight-bold mb-0">
                                                        <%= customer.getEmail()%>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="text-xs font-weight-bold mb-0">
                                                        <%= customer.getContactNo()%>
                                                    </p>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <p class="text-xs font-weight-bold mb-0">Female</p>
                                                </td>
                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold"
                                                          ><%= customer.getDateOfBirth()%></span
                                                    >
                                                </td>
                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold"
                                                          >
                                                        <% if (customer.getGender().equals('M')) {%>
                                                        Male <% } else if (customer.getGender().equals('F')) { %>
                                                        Female <% } else { %>
                                                        Prefer Not To Say <% } %>
                                                    </span>
                                                </td>

                                                <% Address custAdd = customer.getCustAdd();%>

                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold"
                                                          ><%= custAdd.getAddress()%>,&nbsp;
                                                        <%= custAdd.getPostalCode()%><%= custAdd.getAddress()%>,&nbsp;</span
                                                    >
                                                </td>
                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold"
                                                          ><%= custAdd.getPostalCode()%>,&nbsp;
                                                        <%= custAdd.getState()%>,&nbsp;
                                                        <%= custAdd.getCountry()%></span
                                                    >
                                                </td>
                                                <td class="align-middle">
                                                    <a
                                                        href="editCustomer.jsp?user=<%= customer.getUsername()%>
                                                        &email=<%= customer.getEmail()%>"
                                                        class="text-secondary font-weight-bold text-xs"
                                                        data-toggle="tooltip"
                                                        data-original-title="Edit user"
                                                        >
                                                        Edit
                                                    </a>
                                                </td>
                                                <td class="align-middle">
                                                    <a
                                                        href="#"
                                                        class="text-secondary font-weight-bold text-xs"
                                                        data-toggle="tooltip"
                                                        data-original-title="Delete user"
                                                        onclick="confirmDelete()"
                                                        >
                                                        Delete
                                                    </a>
                                                    <form id='deleteForm' action='DeleteCustomers' method='post' 
                                                          style="display:none;">
                                                        <input type='hidden' name='username' 
                                                               value='<%= customer.getUsername()%>'>
                                                        <input type='hidden' name='email' value='<%= customer.getEmail()%>'>
                                                    </form>
                                                </td>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <%@ include file="admin-components/footer.jsp" %>
            </div>
        </main>

        <!--   Core JS Files   -->
        <script src="/assets/js/core/popper.min.js"></script>
        <script src="/assets/js/core/bootstrap.min.js"></script>
        <script src="/assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="/assets/js/plugins/smooth-scrollbar.min.js"></script>
    </body>
</html>
