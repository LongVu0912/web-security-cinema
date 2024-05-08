<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
       String root=request.getContextPath();
       String csrfToken = (String) session.getAttribute("csrfToken");
       %>

      <header>
        <nav class="bg-gray-200 border-gray-200 lg:px-6 py-2.5">
          <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl">
            <a class="flex items-center" href="<%=root%>/">
              <img src="<%=root%>/assets/images/logo.png" class="mr-3 h-6 sm:h-9" alt="" />
              <span class="self-center text-xl font-semibold whitespace-nowrap">NTV Cinema</span>
            </a>
            <div class="flex items-center lg:order-2 font-medium">
              <c:choose>
                <c:when test="${sessionScope.customer == null}">
                  <a href="<%=root%>/login"
                     class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium 
               rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2">
                    Login
                  </a>
                </c:when>
                <c:otherwise>
                  ${sessionScope.customer.getFullname()} | ${sessionScope.customer.getBalance().intValue()} VND

                  <!-- Modal toggle -->
                  <button data-modal-target="authentication-modal" data-modal-toggle="authentication-modal"
                          class="flex block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none 
                    focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 ml-2 text-center" type="button">
                    <?xml version="1.0" encoding="utf-8"?>
                    <svg width="22px" height="22px" viewBox="0 0 24 24" fill="white" style="margin-right: 5px;"
                         xmlns="http://www.w3.org/2000/svg">
                      <path d="M10 16V14.0003M10 14.0003V12M10 14.0003L12 14.0005M10 14.0003L8 14M21 12V11.2C21 10.0799 21 9.51984 20.782 9.09202C20.5903 8.71569 20.2843 8.40973 19.908 8.21799C19.4802 8 18.9201 8 17.8 8H3M21 12V16M21 12H19C17.8954 12 17 12.8954 17 14C17 15.1046 17.8954 16 19 16H21M21 16V16.8C21 17.9201 21 18.4802 20.782 18.908C20.5903 19.2843 20.2843 19.5903 19.908 19.782C19.4802 20 18.9201 20 17.8 20H6.2C5.0799 20 4.51984 20 4.09202 19.782C3.71569 19.5903 3.40973 19.2843 3.21799 18.908C3 18.4802 3 17.9201 3 16.8V8M18 8V7.2C18 6.0799 18 5.51984 17.782 5.09202C17.5903 4.71569 17.2843 4.40973 16.908 4.21799C16.4802 4 15.9201 4 14.8 4H6.2C5.07989 4 4.51984 4 4.09202 4.21799C3.71569 4.40973 3.40973 4.71569 3.21799 5.09202C3 5.51984 3 6.0799 3 7.2V8"
                            stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Balance
                  </button>

                  <button data-modal-target="change-password-modal" data-modal-toggle="change-password-modal"
                          class="flex block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none 
                    focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 ml-2 text-center" type="button">
                    <svg width="22px" height="22px" viewBox="0 0 24 24" fill="white"
                         xmlns="http://www.w3.org/2000/svg" style="margin-right: 5px;">
                      <path d="M21.0667 5C21.6586 5.95805 22 7.08604 22 8.29344C22 11.7692 19.1708 14.5869 15.6807 14.5869C15.0439 14.5869 13.5939 14.4405 12.8885 13.8551L12.0067 14.7333C11.272 15.465 11.8598 15.465 12.1537 16.0505C12.1537 16.0505 12.8885 17.075 12.1537 18.0995C11.7128 18.6849 10.4783 19.5045 9.06754 18.0995L8.77362 18.3922C8.77362 18.3922 9.65538 19.4167 8.92058 20.4412C8.4797 21.0267 7.30403 21.6121 6.27531 20.5876C6.22633 20.6364 5.952 20.9096 5.2466 21.6121C4.54119 22.3146 3.67905 21.9048 3.33616 21.6121L2.45441 20.7339C1.63143 19.9143 2.1115 19.0264 2.45441 18.6849L10.0963 11.0743C10.0963 11.0743 9.3615 9.90338 9.3615 8.29344C9.3615 4.81767 12.1907 2 15.6807 2C16.4995 2 17.282 2.15509 18 2.43738"
                            stroke="#1C274C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                      <path d="M17.8851 8.29353C17.8851 9.50601 16.8982 10.4889 15.6807 10.4889C14.4633 10.4889 13.4763 9.50601 13.4763 8.29353C13.4763 7.08105 14.4633 6.09814 15.6807 6.09814C16.8982 6.09814 17.8851 7.08105 17.8851 8.29353Z"
                            stroke="#1C274C" stroke-width="1.5" />
                    </svg>
                    Password
                  </button>

                  <!-- Main modal add balance-->
                  <div id="authentication-modal" tabindex="-1" aria-hidden="true"
                       class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                    <div class="relative p-4 w-full max-w-md max-h-full">
                      <!-- Modal content -->
                      <div class="relative bg-white rounded-lg shadow">
                        <!-- Modal header -->
                        <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t ">
                          <h3 class="text-xl font-semibold text-black">
                            Add balance
                          </h3>
                          <button type="button"
                                  class="end-2.5 text-black bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center"
                                  data-modal-hide="authentication-modal">
                            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                 viewBox="0 0 14 14">
                              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                            </svg>
                            <span class="sr-only">Close modal</span>
                          </button>
                        </div>
                        <!-- Modal body -->
                        <div class="p-4 md:p-5">
                            <form class="space-y-4" method="post" action="<%=root%>/">
                              <input type="hidden" name="csrfToken" value="<%=csrfToken%>" />
                              <div>
                                <label for="balance" class="block mb-2 text-sm font-medium text-black">Balance</label>
                                <input type="number" name="balance" id="balance" class="bg-gray-50 border border-gray-300 
                                         text-black text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 
                                         block w-full p-2.5">
                              </div>
                              <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 
                                      focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg 
                                      text-sm px-5 py-2.5 text-center">Submit
                                <input type="hidden" name="action" value="addBalance">
                              </button>
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Main modal change password -->
                  <div id="change-password-modal" tabindex="-1" aria-hidden="true"
                       class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                    <div class="relative p-4 w-full max-w-md max-h-full">
                      <!-- Modal content -->
                      <div class="relative bg-white rounded-lg shadow">
                        <!-- Modal header -->
                        <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t ">
                          <h3 class="text-xl font-semibold text-black">
                            Change password
                          </h3>
                          <button type="button"
                                  class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center"
                                  data-modal-hide="change-password-modal">
                            <svg class="w-3 h-3" class="close" data-dismiss="modal" aria-hidden="true"
                                 xmlns="http://www.w3.org/2000/svg" fill="none"
                                 viewBox="0 0 14 14">
                              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2"
                                    d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                            </svg>
                            <span class="sr-only">Close modal</span>
                          </button>
                        </div>
                        <!-- Modal body -->
                        <div class="p-4 md:p-5">
                            <form class="space-y-4" method="post" action="<%=root%>/">
                              <input type="hidden" name="csrfToken" value="<%=csrfToken%>" />
                              <div>
                                <label for="current-password" class="block mb-2 text-sm font-medium text-black">Current
                                  Password</label>
                                <input type="password" name="currentPassword" id="current-password" class="bg-gray-50 border border-gray-300 
                                         text-black text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 
                                         block w-full p-2.5">
                              </div>
                              <div>
                                <label for="new-password" class="block mb-2 text-sm font-medium text-black">New
                                  Password</label>
                                <input type="password" name="newPassword" id="new-password" class="bg-gray-50 border border-gray-300 
                                         text-black text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 
                                         block w-full p-2.5">
                              </div>
                              <div>
                                <label for="confirm-new-pass" class="block mb-2 text-sm font-medium text-black">Confirm
                                  Password</label>
                                <input type="password" name="confirmNewPass" id="confirm-new-pass" class="bg-gray-50 border border-gray-300 
                                         text-black text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 
                                         block w-full p-2.5">
                              </div>
                              <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 
                                      focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg 
                                      text-sm px-5 py-2.5 text-center">Submit
                                <input type="hidden" name="action" value="changePassword">
                              </button>
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>

                  <a href="<%=root%>/?action=out"
                     class="flex text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium 
               rounded-lg text-sm px-4 lg:px-2 py-2 lg:py-1 mx-2 ">
                    <svg width="22px" height="22px" viewBox="0 0 24 24" fill="white" style="margin-right: 5px;"
                         xmlns="http://www.w3.org/2000/svg">
                      <g id="Interface / Log_Out">
                        <path id="Vector"
                              d="M12 15L15 12M15 12L12 9M15 12H4M9 7.24859V7.2002C9 6.08009 9 5.51962 9.21799 5.0918C9.40973 4.71547 9.71547 4.40973 10.0918 4.21799C10.5196 4 11.0801 4 12.2002 4H16.8002C17.9203 4 18.4796 4 18.9074 4.21799C19.2837 4.40973 19.5905 4.71547 19.7822 5.0918C20 5.5192 20 6.07899 20 7.19691V16.8036C20 17.9215 20 18.4805 19.7822 18.9079C19.5905 19.2842 19.2837 19.5905 18.9074 19.7822C18.48 20 17.921 20 16.8031 20H12.1969C11.079 20 10.5192 20 10.0918 19.7822C9.71547 19.5905 9.40973 19.2839 9.21799 18.9076C9 18.4798 9 17.9201 9 16.8V16.75"
                              stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                      </g>
                    </svg>
                    Log out
                  </a>
                </c:otherwise>
              </c:choose>
              <button data-collapse-toggle="mobile-menu-2" type="button"
                      class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200"
                      aria-controls="mobile-menu-2" aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
                        d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                        clip-rule="evenodd"></path>
                </svg>
                <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                     xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
                        d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                        clip-rule="evenodd"></path>
                </svg>
              </button>
            </div>
            <div class="hidden justify-between items-center w-full lg:flex lg:w-auto lg:order-1" id="mobile-menu-2">
              <ul class="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0">
                <li>
                  <a href="<%=root%>/"
                     class="block py-2 pr-4 pl-3 rounded bg-blue-700 lg:bg-transparent
               ${param.activeTab == " home" ? "lg:text-blue-700" : "text-gray-700" } lg:hover:text-blue-700
                     lg:p-0">Home</a>
                </li>
                <li>
                  <a href="<%=root%>/showing"
                     class="block py-2 pr-4 pl-3 ${param.activeTab == " showing" ? "lg:text-blue-700" : "text-gray-700"
                     }
                     border-b border-gray-100 hover:bg-gray-50
                     lg:hover:bg-transparent lg:border-0 lg:hover:text-blue-700 lg:p-0">Showing</a>
                </li>
                <li>
                  <a href="<%=root%>/ticket"
                     class="block py-2 pr-4 pl-3 ${param.activeTab == " ticket" ? "lg:text-blue-700" : "text-gray-700" }
                     border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0
                     lg:hover:text-blue-700 lg:p-0">Tickets</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </header>