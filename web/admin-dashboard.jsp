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
            href="assets/img/apple-icon.png"
            />
        <link rel="icon" type="image/png" href="assets/img/art_logo.png" />
        <title>Bong Bong | Admin Dashboard</title>
        <!--     Fonts and icons     -->
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
            rel="stylesheet"
            />
        <!-- Nucleo Icons -->
        <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script
            src="https://kit.fontawesome.com/42d5adcbca.js"
            crossorigin="anonymous"
        ></script>
        <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link
            id="pagestyle"
            href="assets/css/soft-ui-dashboard.css?v=1.0.7"
            rel="stylesheet"
            />
        <!-- Nepcha Analytics (nepcha.com) -->
        <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
        <script
            defer
            data-site="YOUR_DOMAIN_HERE"
            src="https://api.nepcha.com/js/nepcha-analytics.js"
        ></script>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    </head>

    <body class="g-sidenav-show bg-gray-100">
        <%@ include file="admin-components/aside.jsp" %>

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
                        <h6 class="font-weight-bolder mb-0">Dashboard</h6>
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
                <!-- Top Tree Boxes -->
                <div class="row">
                    <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
                        <div class="card">
                            <div class="card-body p-3">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="numbers">
                                            <p class="text-sm mb-0 text-capitalize font-weight-bold">
                                                Today's Earning
                                            </p>
                                            <h5 class="font-weight-bolder mb-0">
                                                $53,000
                                                <span class="text-success text-sm font-weight-bolder"
                                                      >+55%</span
                                                >
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
                        <div class="card">
                            <div class="card-body p-3">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="numbers">
                                            <p class="text-sm mb-0 text-capitalize font-weight-bold">
                                                Today's Orders
                                            </p>
                                            <h5 class="font-weight-bolder mb-0">
                                                2,300
                                                <span class="text-success text-sm font-weight-bolder"
                                                      >+3%</span
                                                >
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-sm-6">
                        <div class="card">
                            <div class="card-body p-3">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="numbers">
                                            <p class="text-sm mb-0 text-capitalize font-weight-bold">
                                                New Users
                                            </p>
                                            <h5 class="font-weight-bolder mb-0">
                                                10
                                                <span class="text-success text-sm font-weight-bolder"
                                                      >+5%</span
                                                >
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Top Tree Boxes -->

                <!-- Chart -->
                <div class="row mt-4">
                    <div class="col-lg-5 mb-lg-0 mb-4">
                        <div class="card z-index-2">
                            <div class="card-body">
                                <div class="border-radius-lg py-3 pe-1 mb-3">
                                    <h6 class="ms-2 mb-0"> Top 10 Sold Products </h6>
                                    <div class="chart">
                                        <canvas id="chart-bars" class="chart-canvas" height="300"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 mb-lg-0 mb-4">
                        <div class="card z-index-2">
                            <div class="card-body">
                                <div class="border-radius-lg py-3 pe-1 mb-3">
                                    <h6 class="ms-2 mb-0">Sales Overview</h6>
                                    <div class="chart">
                                        <canvas id="chart-line" class="chart-canvas" height="300"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Orders Tracking -->
                    <div class="row mt-4">
                        <div class="col-lg-6 col-md-6">
                            <div class="card h-100 mb-4">
                                <div class="card-header pb-0 px-3">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-0">Incoming Orders</h6>
                                        </div>
                                        <div
                                            class="col-md-6 d-flex justify-content-end align-items-center"
                                            >
                                            <i class="far fa-calendar-alt me-2"></i>
                                            <small>23 - 30 March 2020</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body pt-4 p-3">
                                    <h6
                                        class="text-uppercase text-body text-xs font-weight-bolder mb-3"
                                        >
                                        Today
                                    </h6>
                                    <ul class="list-group">
                                        <li
                                            class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"
                                            >
                                            <div class="d-flex align-items-center">
                                                <button
                                                    class="btn btn-icon-only btn-rounded btn-outline-success mb-0 me-3 btn-sm d-flex align-items-center justify-content-center"
                                                    >
                                                    <i class="fas fa-arrow-up"></i>
                                                </button>
                                                <div class="d-flex flex-column">
                                                    <h6 class="mb-1 text-dark text-sm">Order Id: 240509-f9b8838a5db7447f9ff8</h6>
                                                    <span class="text-xs">27 March 2020, at 04:30 AM</span>
                                                </div>
                                            </div>
                                            <div
                                                class="d-flex align-items-center text-success text-gradient text-sm font-weight-bold"
                                                >
                                                + $ 2,000
                                            </div>
                                        </li>
                                    </ul>
                                    <h6
                                        class="text-uppercase text-body text-xs font-weight-bolder my-3"
                                        >
                                        Yesterday
                                    </h6>
                                    <ul class="list-group">
                                        <li
                                            class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"
                                            >
                                            <div class="d-flex align-items-center">
                                                <button
                                                    class="btn btn-icon-only btn-rounded btn-outline-success mb-0 me-3 btn-sm d-flex align-items-center justify-content-center"
                                                    >
                                                    <i class="fas fa-arrow-up"></i>
                                                </button>
                                                <div class="d-flex flex-column">
                                                    <h6 class="mb-1 text-dark text-sm">Order Id: 240508-f9b8838a5db7447f9ff8</h6>
                                                    <span class="text-xs">26 March 2020, at 13:45 PM</span>
                                                </div>
                                            </div>
                                            <div
                                                class="d-flex align-items-center text-success text-gradient text-sm font-weight-bold"
                                                >
                                                + $ 750
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Edit Log -->
                        <div class="col-lg-6 col-md-6">
                            <div class="card h-100">
                                <div class="card-header pb-0">
                                    <h6>Edit Logs</h6>
                                    <p class="text-sm">
                                        <span class="font-weight-bold">2 activities</span> this month
                                    </p>
                                </div>
                                <div class="card-body p-3">
                                    <div class="timeline timeline-one-side">
                                        <div class="timeline-block mb-3">
                                            <span class="timeline-step">
                                                <i class="ni ni-circle-08 text-dark text-gradient"></i>
                                            </span>
                                            <div class="timeline-content">
                                                <h6 class="text-dark text-sm font-weight-bold mb-0">
                                                    Staff a added one products
                                                </h6>
                                                <p
                                                    class="text-secondary font-weight-bold text-xs mt-1 mb-0"
                                                    >
                                                    22 DEC 7:20 PM
                                                </p>
                                            </div>
                                        </div>
                                        <div class="timeline timeline-one-side">
                                            <div class="timeline-block mb-3">
                                                <span class="timeline-step">
                                                    <i class="ni ni-circle-08 text-dark text-gradient"></i>
                                                </span>
                                                <div class="timeline-content">
                                                    <h6 class="text-dark text-sm font-weight-bold mb-0">
                                                        Staff a added one products
                                                    </h6>
                                                    <p
                                                        class="text-secondary font-weight-bold text-xs mt-1 mb-0"
                                                        >
                                                        22 DEC 7:20 PM
                                                    </p>
                                                </div>
                                            </div>
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
                    <script src="/assets/js/plugins/chartjs.min.js"></script>
                    <script>
                        var ctx = document.getElementById("chart-bars").getContext("2d");

                        new Chart(ctx, {
                            type: "bar",
                            data: {
                                labels: ["A", "B", "C", "D", "E", "F", "G", "H", "I"],
                                datasets: [
                                    {
                                        label: "Sales",
                                        tension: 0.4,
                                        borderWidth: 0,
                                        borderRadius: 4,
                                        borderSkipped: false,
                                        backgroundColor: "#3b5d50",
                                        data: [450, 200, 100, 220, 500, 100, 400, 230, 500],
                                        maxBarThickness: 6,
                                    },
                                ],
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        display: false,
                                    },
                                },
                                interaction: {
                                    intersect: false,
                                    mode: "index",
                                },
                                scales: {
                                    y: {
                                        grid: {
                                            drawBorder: false,
                                            display: false,
                                            drawOnChartArea: false,
                                            drawTicks: false,
                                        },
                                        ticks: {
                                            suggestedMin: 0,
                                            suggestedMax: 500,
                                            beginAtZero: true,
                                            padding: 15,
                                            font: {
                                                size: 14,
                                                family: "Open Sans",
                                                style: "normal",
                                                lineHeight: 2,
                                            },
                                            color: "#000", // Set the color to black
                                        },
                                    },
                                    x: {
                                        grid: {
                                            drawBorder: false,
                                            display: false,
                                            drawOnChartArea: false,
                                            drawTicks: false,
                                        },
                                        ticks: {
                                            color: "#000", // Set the color to black
                                        },
                                    },
                                },
                            },
                        });



                        var ctx2 = document.getElementById("chart-line").getContext("2d");

                        var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);

                        gradientStroke1.addColorStop(1, "rgba(203,12,159,0.2)");
                        gradientStroke1.addColorStop(0.2, "rgba(72,72,176,0.0)");
                        gradientStroke1.addColorStop(0, "rgba(203,12,159,0)"); //purple colors

                        var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

                        gradientStroke2.addColorStop(1, "rgba(20,23,39,0.2)");
                        gradientStroke2.addColorStop(0.2, "rgba(72,72,176,0.0)");
                        gradientStroke2.addColorStop(0, "rgba(20,23,39,0)"); //purple colors

                        new Chart(ctx2, {
                            type: "line",
                            data: {
                                labels: [
                                    "Apr",
                                    "May",
                                    "Jun",
                                    "July",
                                    "Aug",
                                    "Sep",
                                    "Oct",
                                    "Nov",
                                    "Dec",
                                ],
                                datasets: [
                                    {
                                        label: "Mobile apps",
                                        tension: 0.4,
                                        borderWidth: 0,
                                        pointRadius: 0,
                                        borderColor: "#3b5d50",
                                        borderWidth: 3,
                                        backgroundColor: gradientStroke1,
                                        fill: true,
                                        data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
                                        maxBarThickness: 6,
                                    },
                                    {
                                        label: "Websites",
                                        tension: 0.4,
                                        borderWidth: 0,
                                        pointRadius: 0,
                                        borderColor: "#3A416F",
                                        borderWidth: 3,
                                        backgroundColor: gradientStroke2,
                                        fill: true,
                                        data: [30, 90, 40, 140, 290, 290, 340, 230, 400],
                                        maxBarThickness: 6,
                                    },
                                ],
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        display: false,
                                    },
                                },
                                interaction: {
                                    intersect: false,
                                    mode: "index",
                                },
                                scales: {
                                    y: {
                                        grid: {
                                            drawBorder: false,
                                            display: true,
                                            drawOnChartArea: true,
                                            drawTicks: false,
                                            borderDash: [5, 5],
                                        },
                                        ticks: {
                                            display: true,
                                            padding: 10,
                                            color: "#b2b9bf",
                                            font: {
                                                size: 11,
                                                family: "Open Sans",
                                                style: "normal",
                                                lineHeight: 2,
                                            },
                                        },
                                    },
                                    x: {
                                        grid: {
                                            drawBorder: false,
                                            display: false,
                                            drawOnChartArea: false,
                                            drawTicks: false,
                                            borderDash: [5, 5],
                                        },
                                        ticks: {
                                            display: true,
                                            color: "#b2b9bf",
                                            padding: 20,
                                            font: {
                                                size: 11,
                                                family: "Open Sans",
                                                style: "normal",
                                                lineHeight: 2,
                                            },
                                        },
                                    },
                                },
                            },
                        });
                    </script>

                    </body>
                    </html>
