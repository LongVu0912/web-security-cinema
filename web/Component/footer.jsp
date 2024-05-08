<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
       String root=request.getContextPath();
       %>
      <link rel="stylesheet" href="<%=root%>/assets/css/all.min.css">

      <footer class="bottom-0 w-full bg-gray-100 pt-8 pb-6">
        <div class="container mx-auto px-4">
          <div class="flex flex-wrap text-left lg:text-left">
            <div class="w-full lg:w-6/12 px-4">
              <h4 class="flex text-3xl fonat-semibold text-blueGray-700">
                <img src="<%=root%>/assets/images/logo.png" class="mr-3 h-6 sm:h-9" alt="" />NTV Cinema
              </h4>
              <h5 class="text-lg mt-0 mb-2 text-blueGray-600">
                Enjoy movies like never before.
              </h5>
              <div class="mt-6 lg:mb-0 mb-6">
                <button class="bg-white text-lightBlue-400 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                        type="button">
                  <i class="fab fa-twitter"></i></button><button
                        class="bg-white text-lightBlue-600 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                        type="button">
                  <i class="fab fa-facebook-square"></i></button><button
                        class="bg-white text-pink-400 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                        type="button">
                  <i class="fab fa-dribbble"></i></button><button
                        class="bg-white text-blueGray-800 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                        type="button">
                  <i class="fab fa-github"></i>
                </button>
              </div>
            </div>
            <div class="w-full lg:w-6/12 px-4">
              <div class="flex flex-wrap items-top mb-6">
                <div class="w-full lg:w-4/12 px-4 ml-auto">
                  <span class="block uppercase text-blueGray-500 text-sm font-bold mb-2">Name</span>
                  <ul>
                    <li>
                      <a class="text-blueGray-600 hover:text-blueGray-800 font-medium block pb-2 text-sm">Hồ Hữu
                        Nhân</a>
                    </li>
                    <li>
                      <a class="text-blueGray-600 hover:text-blueGray-800 font-medium block pb-2 text-sm">Đỗ Quang
                        Triệu</a>
                    </li>
                    <li>
                      <a class="text-blueGray-600 hover:text-blueGray-800 font-medium block pb-2 text-sm">Hoàng Long
                        Vũ</a>
                    </li>
                  </ul>
                </div>
                <div class="w-full lg:w-4/12 px-4">
                  <span class="block uppercase text-blueGray-500 text-sm font-bold mb-2">Student ID</span>
                  <ul>
                    <li>
                      <a class="text-blueGray-600 hover:text-blueGray-800 font-medium block pb-2 text-sm">21110787</a>
                    </li>
                    <li>
                      <a class="text-blueGray-600 hover:text-blueGray-800 font-medium block pb-2 text-sm">21110805</a>
                    </li>
                    <li>
                      <a class="text-blueGray-600 hover:text-blueGray-800 font-medium block pb-2 text-sm">21110113</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <hr class="my-6 border-blueGray-300">
          <div class="flex flex-wrap items-center md:justify-between justify-center">
            <div class="w-full md:w-4/12 px-4 mx-auto text-center">
              <div class="text-sm text-blueGray-500 font-semibold py-1">
                Copyright &copy; <span id="get-current-year">2023</span><a class="text-blueGray-500 hover:text-gray-800">
                  <a class="text-blueGray-500 hover:text-blueGray-800">NTV Cinema</a>
              </div>
            </div>
          </div>
        </div>
      </footer>