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
      href="../assets/img/apple-icon.png"
    />
    <link rel="icon" type="image/png" href="../assets/img/art_logo.png" />
    <title>Soft UI Dashboard by Creative Tim</title>
    <!--     Fonts and icons     -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
      rel="stylesheet"
    />
    <!-- Nucleo Icons -->
    <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script
      src="https://kit.fontawesome.com/42d5adcbca.js"
      crossorigin="anonymous"
    ></script>
    <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link
      id="pagestyle"
      href="../assets/css/soft-ui-dashboard.css?v=1.0.7"
      rel="stylesheet"
    />
    <!-- Nepcha Analytics (nepcha.com) -->
    <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
    <script
      defer
      data-site="YOUR_DOMAIN_HERE"
      src="https://api.nepcha.com/js/nepcha-analytics.js"
    ></script>

    <style>
         .modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .modal .card {
        width: 100%;
        max-width: 500px;
        margin-top: calc(50vh - 200px);
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
    </style>
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
            <h6 class="font-weight-bolder mb-0">Products</h6>
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
              <div
                class="card-header pb-0 d-flex flex-row align-items-center justify-content-between"
              >
                <div class="d-flex flex-row align-items-center w-50">
                  <h6>Products</h6>
                  <div class="input-group w-50 mx-4">
                    <span class="input-group-text text-body"
                      ><i class="fas fa-search" aria-hidden="true"></i
                    ></span>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Type here..."
                    />
                  </div>
                </div>

                <div class="w-50 text-end">
                  <button id="add-product-btn" class="btn btn-primary">
                    Add Product
                  </button>
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
                          Product
                        </th>
                        <th
                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                          Price
                        </th>
                        <th
                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                          Stock
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                        >
                          Status
                        </th>
                        <th
                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                        >
                          Added on
                        </th>
                        <th class="text-secondary opacity-7"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div>
                              <img
                                src="../assets/img/team-2.jpg"
                                class="avatar avatar-sm me-3"
                                alt="user1"
                              />
                            </div>
                            <div
                              class="d-flex flex-column justify-content-center"
                            >
                              <h6 class="mb-0 text-sm">
                                Path to Spring - Paul
                              </h6>
                              <p class="text-xs text-secondary mb-0">P0001</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">RM 600.00</p>
                        </td>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">2</p>
                        </td>
                        <td class="align-middle text-center text-sm">
                          <span class="badge badge-sm bg-gradient-success"
                            >Available</span
                          >
                        </td>
                        <td class="align-middle text-center">
                          <span class="text-secondary text-xs font-weight-bold"
                            >2024-05-01</span
                          >
                        </td>
                        <td class="align-middle">
                          <a
                            href="javascript:;"
                            class="text-secondary font-weight-bold text-xs"
                            data-toggle="tooltip"
                            data-original-title="Edit user"
                          >
                            Edit
                          </a>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- The Modal -->
        <div id="add-product-modal" class="modal">
          <div
            class="container-fluid py-4 w-50 d-flex align-items-center justify-content-center"
          >
            <div class="row">
              <div class="col-12">
                <div class="card mb-4">
                  <div class="card-body p-4">
                    <span id="close-add-product">&times;</span>
                    <form role="form">
                      <label class="form-label">Product Name</label>
                      <div class="mb-3">
                          <input type="text" class="form-control" placeholder="Product Name" aria-label="Product Name" aria-describedby="product-name-addon">
                          <div id="product-name-error" class="invalid-feedback fs-6">
                              Please provide a valid product name.
                          </div>
                          <!-- <div id="product-name-searching" class="text-muted fs-6">
                              Searching database...
                          </div> -->
                      </div>
                      <label class="form-label">Description</label>
                      <div class="mb-3">
                          <textarea class="form-control" placeholder="Description" aria-label="Description" aria-describedby="description-addon"></textarea>
                          <div id="description-error" class="invalid-feedback fs-6">
                              Please provide a valid description.
                          </div>
                      </div>
                      <label class="form-label">Price</label>
                      <div class="mb-3">
                          <input type="number" class="form-control" placeholder="Price" aria-label="Price" aria-describedby="price-addon">
                          <div id="price-error" class="invalid-feedback fs-6">
                              Please provide a valid price.
                          </div>
                      </div>
                      <label class="form-label">Stock Quantity</label>
                      <div class="mb-3">
                          <input type="number" class="form-control" placeholder="Stock Quantity" aria-label="Stock Quantity" aria-describedby="stock-quantity-addon">
                          <div id="stock-quantity-error" class="invalid-feedback fs-6">
                              Please provide a valid stock quantity.
                          </div>
                      </div>
                      <label class="form-label">Upload Image</label>
                      <div class="mb-3">
                          <input type="file" class="form-control" accept="image/*" aria-label="Upload Image" aria-describedby="upload-image-addon">
                          <div id="upload-image-error" class="invalid-feedback fs-6">
                              Please upload a valid image file.
                          </div>
                      </div>
                      <label class="form-label">Keywords</label>
                      <div class="mb-3">
                          <input type="text" class="form-control" placeholder="Keywords" aria-label="Keywords" aria-describedby="keywords-addon">
                          <div id="keywords-error" class="invalid-feedback fs-6">
                              Please provide valid keywords.
                          </div>
                      </div>
                      <div class="form-check form-switch">
                          <input class="form-check-input" type="checkbox" id="setAsMain">
                          <label class="form-check-label" for="setAsMain">Set as main product</label>
                      </div>
                      <div class="text-center">
                          <button type="button" class="btn bg-gradient-info w-100 mt-4 mb-0">Add Product</button>
                      </div>
                  </form>                  
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <%@ include file="components/footer.jsp" %>
      </div>
    </main>

    <!--   Core JS Files   -->
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script>
      // Add product modal
      var addProductModal = document.getElementById("add-product-modal");
      var addProductBtn = document.getElementById("add-product-btn");
      var closeAddProduct = document.getElementById("close-add-product");

      addProductModal.style.display = "none";

      addProductBtn.onclick = function () {
        if (addProductModal.style.display === "none") {
          addProductModal.style.display = "block";
        } else {
          addProductModal.style.display = "none";
        }
      };

      closeAddProduct.onclick = function () {
        addProductModal.style.display = "none";
      };

      window.onclick = function (event) {
        if (event.target == addProductModal) {
          addProductModal.style.display = "none";
        }
      };
    </script>
  </body>
</html>
