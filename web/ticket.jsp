<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
       String root=request.getContextPath();

       // delete ".jsp"
       String URI=request.getRequestURI();
       URI=URI.substring(0, URI.length() - 4);
       %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="<%=root%>/assets/images/logo.png" type="image/gif" sizes="16x16">
        <title>Ticket</title>
        <script src="<%=root%>/tailwind/tailwind.js"></script>
        <link href="<%=root%>/assets/css/aos.css" rel="stylesheet">
      </head>

      <body>
        <!-- component header -->
        <jsp:include page="./Component/header.jsp">
          <jsp:param name="activeTab" value="ticket" />
        </jsp:include>

        <!--content-->
        <div class="flex flex-col min-h-screen">
          <div class="mb-auto">
            <div class="container px-20 py-20 mx-auto flex items-center justify-center flex-col" data-aos="fade-up">
              <c:if test="${state == 'fail'}">
                <div class="flex items-center p-4 mb-4 text-sm rounded-lg bg-gray-800 text-red-500"
                     role="alert">
                  <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                       xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                    <path
                          d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                  </svg>
                  <div>
                    <span class="font-medium">Refund fail, you can only refund before 2 days of showdate</span>
                  </div>
                </div>
              </c:if>
              <c:if test="${state == 'success'}">
                <div class="flex items-center p-4 mb-4 text-sm rounded-lg bg-gray-800 text-green-500"
                     role="alert">
                  <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                       xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                    <path
                          d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                  </svg>
                  <div>
                    <span class="font-medium">Refund success</span>
                  </div>
                </div>
              </c:if>

              <c:choose>
                <c:when test="${empty invoices}">
                  <div class="font-bold text-xl">You have no ticket</div>
                </c:when>
                <c:otherwise>

                  <table class="w-full text-sm text-left rtl:text-right text-gray-700 text-gray-600">
                    <thead class="text-xs uppercase bg-gray-200 text-gray-700">
                      <tr>
                        <th scope="col" class="px-6 py-3">Invoice ID</th>
                        <th scope="col" class="px-6 py-3">Movie Title</th>
                        <th scope="col" class="px-6 py-3">Bought Date</th>
                        <th scope="col" class="px-6 py-3">Show Date</th>
                        <th scope="col" class="px-6 py-3">Start Time</th>
                        <th scope="col" class="px-6 py-3">Room number</th>
                        <th scope="col" class="px-6 py-3">Quantity of tickets</th>
                        <th scope="col" class="px-6 py-3">Total Price</th>
                        <th scope="col"></th>
                        <th scope="col" class="px-4"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="invoice" items="${invoices}">
                        <tr class="border-b bg-gray-100 border-gray-200">
                          <th scope="row" class="px-6 py-2 font-bold">
                            ${invoice.getInvoiceID()}
                          </th>
                          <th scope="row"
                              class="px-6 py-2 font-bold">
                            ${invoice.getTickets().get(0).showtime.movie.getTitle()}
                          </th>
                          <th scope="row"
                              class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                            ${invoice.getboughtDate()}
                          </th>
                          <th scope="row"
                              class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                            ${invoice.getTickets().get(0).showtime.getDate()}
                          </th>
                          <th scope="row"
                              class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                            ${invoice.getTickets().get(0).showtime.getStartTimeStr()}
                          </th>
                          <th scope="row"
                              class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                            ${invoice.getTickets().get(0).showtime.room.getRoomNumber()}
                          </th>
                          <th scope="row"
                              class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                            ${invoice.getTickets().size()}
                          </th>
                          <th scope="row"
                              class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                            ${invoice.getTotalPrice().intValue()} VND
                          </th>
                          <td>
                            <button class="flex detail-button block text-white focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-blue-600 hover:bg-blue-700 focus:ring-blue-800"
                                    data-modal-target="detail_modal"
                                    data-modal-toggle="detail_modal">
                              <input type="hidden" name="movieTitle"
                                     value="${invoice.getTickets().get(0).showtime.movie.getTitle()}">
                              <input type="hidden" name="vipSeat"
                                     value=${invoice.getVipSeats()}>
                              <input type="hidden" name="standardSeats"
                                     value=${invoice.getStandardSeats()}>
                              <input type="hidden" name="standardPrice"
                                     value=${invoice.getStandardTotalPrice()}>
                              <input type="hidden" name="vipPrice"
                                     value=${invoice.getVipTotalPrice()}>
                              <input type="hidden" name="movieImg"
                                     value="<%=root%>/assets/images/${invoice.getTickets().get(0).showtime.movie.getImg()}">
                              <input type="hidden" name="director"
                                     value="${invoice.getTickets().get(0).showtime.movie.getDirector()}">
                              <input type="hidden" name="mainActor"
                                     value="${invoice.getTickets().get(0).showtime.movie.getMainActor()}">
                              <input type="hidden" name="genre"
                                     value="${invoice.getTickets().get(0).showtime.movie.getGenre()}">
                              <svg width="20px" height="20px" aria-hidden="true" style="margin-right: 5px;"
                                   xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                              </svg>
                              Detail
                            </button>
                          </td>
                          <td class="px-4">
                            <button class="flex block text-white focus:ring-4 focus:outline-none 
                      font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-blue-600 
                      hover:bg-blue-700 focus:ring-blue-800"
                                    data-modal-target="refund_modal"
                                    data-modal-toggle="refund_modal"
                                    data-refund=${invoice.getInvoiceID()}>
                              <svg width="20px" height="20px" viewBox="0 0 24 24" fill="white"
                                   style="margin-right: 5px;"
                                   xmlns="http://www.w3.org/2000/svg">
                                <path d="M13 14.0008L7 14M13 14.0008L10.5 11.5M13 14.0008L10.5 16.5M21 12V11.2C21 10.0799 21 9.51984 20.782 9.09202C20.5903 8.71569 20.2843 8.40973 19.908 8.21799C19.4802 8 18.9201 8 17.8 8H3M21 12V16M21 12H19C17.8954 12 17 12.8954 17 14C17 15.1046 17.8954 16 19 16H21M21 16V16.8C21 17.9201 21 18.4802 20.782 18.908C20.5903 19.2843 20.2843 19.5903 19.908 19.782C19.4802 20 18.9201 20 17.8 20H6.2C5.0799 20 4.51984 20 4.09202 19.782C3.71569 19.5903 3.40973 19.2843 3.21799 18.908C3 18.4802 3 17.9201 3 16.8V8M18 8V7.2C18 6.0799 18 5.51984 17.782 5.09202C17.5903 4.71569 17.2843 4.40973 16.908 4.21799C16.4802 4 15.9201 4 14.8 4H6.2C5.07989 4 4.51984 4 4.09202 4.21799C3.71569 4.40973 3.40973 4.71569 3.21799 5.09202C3 5.51984 3 6.0799 3 7.2V8"
                                      stroke="#000000" stroke-width="2" stroke-linecap="round"
                                      stroke-linejoin="round" />
                              </svg>
                              Refund
                            </button>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </c:otherwise>
              </c:choose>

            </div>

            <div id="detail_modal" tabindex="-1"
                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
              <div class="relative w-full max-w-md max-h-full">
                <div class="relative bg-white rounded-lg shadow">
                  <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t">
                    <h3 id="modalMovieTitle" class="text-lg font-bold text-gray-900">
                    </h3>
                    <button type="button"
                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm h-8 w-8 ms-auto inline-flex justify-center items-center"
                            data-modal-toggle="detail_modal">
                      <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                           viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                      </svg>
                      <span class="sr-only">Close modal</span>
                    </button>
                  </div>

                  <div class="flex flex-col items-center bg-white border border-gray-200 shadow md:flex-row md:max-w-xl hover:bg-gray-100">
                    <img id="modalImg"
                         class="object-cover w-full h-96 md:h-auto md:w-48"
                         src="" alt="">
                    <div class="flex flex-col justify-between p-4 leading-normal">
                      <p id="modalDirector" class="mb-3 font-bold text-black-700"></p>
                      <p id="modalActor" class="mb-3 font-bold text-black-700"></p>
                      <p id="modalGenre" class="mb-3 font-bold text-black-700"></p>
                    </div>
                  </div>

                  <div class="p-4 md:p-5">
                    <ol class="relative border-s border-gray-200 ms-3.5 mb-4 md:mb-5">
                      <li class="mb-10 ms-8">
                        <span class="absolute flex items-center justify-center w-6 h-6 bg-gray-100 rounded-full -start-3.5 ring-8 ring-white">
                          <svg class="w-2.5 h-2.5 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                               fill="none" viewBox="0 0 20 20">
                            <path fill="currentColor"
                                  d="M6 1a1 1 0 0 0-2 0h2ZM4 4a1 1 0 0 0 2 0H4Zm7-3a1 1 0 1 0-2 0h2ZM9 4a1 1 0 1 0 2 0H9Zm7-3a1 1 0 1 0-2 0h2Zm-2 3a1 1 0 1 0 2 0h-2ZM1 6a1 1 0 0 0 0 2V6Zm18 2a1 1 0 1 0 0-2v2ZM5 11v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 11v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 15v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 15v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 11v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM5 15v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM2 4h16V2H2v2Zm16 0h2a2 2 0 0 0-2-2v2Zm0 0v14h2V4h-2Zm0 14v2a2 2 0 0 0 2-2h-2Zm0 0H2v2h16v-2ZM2 18H0a2 2 0 0 0 2 2v-2Zm0 0V4H0v14h2ZM2 4V2a2 2 0 0 0-2 2h2Zm2-3v3h2V1H4Zm5 0v3h2V1H9Zm5 0v3h2V1h-2ZM1 8h18V6H1v2Zm3 3v.01h2V11H4Zm1 1.01h.01v-2H5v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H5v2h.01v-2ZM9 11v.01h2V11H9Zm1 1.01h.01v-2H10v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM9 15v.01h2V15H9Zm1 1.01h.01v-2H10v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM14 15v.01h2V15h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM14 11v.01h2V11h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM4 15v.01h2V15H4Zm1 1.01h.01v-2H5v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H5v2h.01v-2Z" />
                          </svg>
                        </span>
                        <div class="flex">
                          <span class="bg-purple-100 text-purple-800 font-bold mr-2 px-2.5 mb-1 rounded flex items-center">
                            Standard
                          </span>
                          <h3 id="modalStandardSeats" class="flex items-start mb-1 text-lg font-semibold text-gray-900">
                          </h3>
                        </div>
                        <div id="modalStandardPrice" class="block mb-3 text-sm font-normal leading-none text-gray-500">
                          Price
                        </div>
                      </li>
                      <li class="mb-10 ms-8">
                        <span class="absolute flex items-center justify-center w-6 h-6 bg-gray-100 rounded-full -start-3.5 ring-8 ring-white">
                          <svg class="w-2.5 h-2.5 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                               fill="none" viewBox="0 0 20 20">
                            <path fill="currentColor"
                                  d="M6 1a1 1 0 0 0-2 0h2ZM4 4a1 1 0 0 0 2 0H4Zm7-3a1 1 0 1 0-2 0h2ZM9 4a1 1 0 1 0 2 0H9Zm7-3a1 1 0 1 0-2 0h2Zm-2 3a1 1 0 1 0 2 0h-2ZM1 6a1 1 0 0 0 0 2V6Zm18 2a1 1 0 1 0 0-2v2ZM5 11v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 11v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 15v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 15v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 11v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM5 15v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM2 4h16V2H2v2Zm16 0h2a2 2 0 0 0-2-2v2Zm0 0v14h2V4h-2Zm0 14v2a2 2 0 0 0 2-2h-2Zm0 0H2v2h16v-2ZM2 18H0a2 2 0 0 0 2 2v-2Zm0 0V4H0v14h2ZM2 4V2a2 2 0 0 0-2 2h2Zm2-3v3h2V1H4Zm5 0v3h2V1H9Zm5 0v3h2V1h-2ZM1 8h18V6H1v2Zm3 3v.01h2V11H4Zm1 1.01h.01v-2H5v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H5v2h.01v-2ZM9 11v.01h2V11H9Zm1 1.01h.01v-2H10v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM9 15v.01h2V15H9Zm1 1.01h.01v-2H10v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM14 15v.01h2V15h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM14 11v.01h2V11h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM4 15v.01h2V15H4Zm1 1.01h.01v-2H5v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H5v2h.01v-2Z" />
                          </svg>
                        </span>
                        <div class="flex">
                          <span class="bg-purple-100 text-purple-800 font-bold mr-2 px-2.5 mb-1 rounded flex items-center">
                            VIP
                          </span>
                          <h3 id="modalVipSeats" class="flex items-start mb-1 text-lg font-semibold text-gray-900">
                          </h3>
                        </div>
                        <div id="modalVipPrice" class="block mb-3 text-sm font-normal leading-none text-gray-500">Price
                        </div>
                      </li>
                    </ol>
                  </div>
                </div>
              </div>
            </div>

            <div id="refund_modal" tabindex="-2"
                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
              <div class="relative p-4 w-full max-w-md max-h-full">
                <div class="relative rounded-lg shadow bg-white">
                  <button type="button"
                          class="absolute top-3 end-2.5 text-gray-600 bg-transparent rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center hover:bg-gray-200 hover:text-black"
                          data-modal-hide="refund_modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                         viewBox="0 0 14 14">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                            stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                    </svg>
                    <span class="sr-only">Close modal</span>
                  </button>
                  <div class="p-4 md:p-5 text-center">
                    <svg class="mx-auto mb-4 w-12 h-12 text-gray-400" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                            stroke-width="2" d="M10 11V6m0 8h.01M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                    </svg>
                    <h3 class="mb-5 text-xl font-bold text-black">Are you sure to refund?</h3>

                    <form method="post" action="<%=root%>/ticket">
                      <input type="hidden" name="InvoiceID" value="">
                      <button
                              class="text-white bg-red-600 px-5 py-2.5 hover:bg-red-800 focus:ring-4 
                focus:outline-none focus:ring-red-800 font-medium rounded-lg text-sm 
                inline-flex items-center text-center me-2"
                              type="submit">YES

                      </button>

                      <button data-modal-hide="refund_modal" type="button"
                              class="text-white bg-gray-600 px-5 py-2.5 hover:bg-gray-800 focus:ring-4 
                focus:outline-none focus:ring-gray-800 font-medium rounded-lg text-sm 
                inline-flex items-center text-center me-2">NO
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <jsp:include page="./Component/footer.jsp">
          <jsp:param name="" value="" />
        </jsp:include>

        <script src="<%=root%>/tailwind/flowbite.min.js"></script>

        <script>
          document.querySelectorAll('[data-modal-target="refund_modal"]').forEach(item => {
            item.addEventListener('click', event => {
              let refundValue = event.target.getAttribute('data-refund');
              let InvoiceIDInput = document.querySelector('[name="InvoiceID"]');
              InvoiceIDInput.value = refundValue;
            });
          });
          document.querySelectorAll('.detail-button').forEach(function (button) {
            button.addEventListener('click', function () {
              var vipSeat = this.querySelector('input[name="vipSeat"]').value;
              var vipPrice = this.querySelector('input[name="vipPrice"]').value;
              var standardSeats = this.querySelector('input[name="standardSeats"]').value;
              var standardPrice = this.querySelector('input[name="standardPrice"]').value;
              var movieTitle = this.querySelector('input[name="movieTitle"]').value;

              var modalMovieTitle = document.getElementById('modalMovieTitle');
              modalMovieTitle.innerHTML = movieTitle;

              if (vipSeat == "") {
                vipSeat = "None";
              }
              if (standardSeats == "") {
                standardSeats = "None";
              }
              if (vipPrice == "0") {
                vipPrice = "";
              }
              else {
                vipPrice = vipPrice + " VND";
              }
              if (standardPrice == "0") {
                standardPrice = "";
              }
              else {
                standardPrice = standardPrice + " VND";
              }

              var modalVipSeats = document.getElementById('modalVipSeats');
              modalVipSeats.innerHTML = vipSeat;

              var modalStandardSeats = document.getElementById('modalStandardSeats');
              modalStandardSeats.innerHTML = standardSeats;

              var modalStandardPrice = document.getElementById('modalStandardPrice');
              modalStandardPrice.innerHTML = standardPrice;

              var modalVipPrice = document.getElementById('modalVipPrice');
              modalVipPrice.innerHTML = vipPrice;

              var modalImg = document.getElementById('modalImg');
              modalImg.src = this.querySelector('input[name="movieImg"]').value;

              var modalDirector = document.getElementById('modalDirector');
              modalDirector.innerHTML = "Director: " + this.querySelector('input[name="director"]').value;

              var modalActor = document.getElementById('modalActor');
              modalActor.innerHTML = "Main Actor: " + this.querySelector('input[name="mainActor"]').value;

              var modalGenre = document.getElementById('modalGenre');
              modalGenre.innerHTML = "Genre: " + this.querySelector('input[name="genre"]').value;

            });
          });
        </script>
        <script src="<%=root%>/assets/js/aos.js"></script>
        <script>
          AOS.init();
        </script>
      </body>

      </html>