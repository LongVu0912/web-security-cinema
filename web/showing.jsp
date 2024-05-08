<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%
       String root=request.getContextPath();

       // delete ".jsp"
       String URI=request.getRequestURI();
       URI=URI.substring(0, URI.length() - 4);
       %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="<%=root%>/assets/images/logo.png" type="image/gif" sizes="16x16">
        <title>Showing</title>
        <script src="<%=root%>/tailwind/tailwind.js"></script>
        <link href="<%=root%>/assets/css/aos.css" rel="stylesheet">
      </head>

      <body>
        <!-- component header -->
        <jsp:include page="./Component/header.jsp">
          <jsp:param name="activeTab" value="showing" />
        </jsp:include>

        <!--content-->
        <div class="bg-white py-16 px-16" data-aos="fade-up" data-aos-delay="100">
          <div class="container mx-auto px-4">

            
            <% String csrfToken = (String) session.getAttribute("csrfToken"); %>
            <form action="<%=root%>/showing" method="get">
              <input type="hidden" name="csrfToken" value="<%=csrfToken%>">
              <label for="default-search"
                     class="mb-2 text-sm font-medium text-gray-900 sr-only">Search</label>
              <div class="relative">
                <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                  <svg class="w-4 h-4 text-gray-500" aria-hidden="true"
                       xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                  </svg>
                </div>
                <input type="search" id="default-search" name="movieName"
                       class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500"
                       placeholder="Movies Name" value="${fn:escapeXml(movieName)}" required>
                <button type="submit"
                        class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2">Search</button>
              </div>
            </form>

            <h2 class="text-3xl font-bold mb-8 text-gray-800 pt-4">Showing Movies</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-8">

              <c:forEach var="movie" items="${movies}">
                <div class="max-w-xs bg-white border border-gray-200 rounded-lg shadow">
                  <a href="<%=root%>/showing/film?movieID=${movie.getMovieID()}">
                    <img class="rounded-t-lg" src="<%=root%>/assets/images/${movie.getImg()}" alt="" />
                  </a>
                  <div class="p-5">

                    <h5 class="text-2xl font-bold tracking-tight text-gray-900 line-clamp-1">
                      <a href="<%=root%>/showing/film?movieID=${movie.getMovieID()}" class="py-2">
                        ${movie.getTitle()}
                      </a>
                    </h5>
                    <p class="mb-3 mt-2 font-medium text-gray-700 line-clamp-1">${movie.getGenre()}</p>
                    <p class="mb-3 font-medium text-gray-700 line-clamp-1">Duration: ${movie.getDuration()}</p>
                    <p class="mb-3 font-normal text-gray-700 line-clamp-3">${movie.getDescription()}</p>
                    <c:choose>
                      <c:when test="${customer != null}">
                        <a href="<%=root%>/showing/film?movieID=${movie.getMovieID()}"
                           class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                          <svg width="20px" height="20px" viewBox="0 0 24 24" fill="white" style="margin-right: 5px;"
                               xmlns="http://www.w3.org/2000/svg">
                            <path d="M16.9949 4H6.99488C3.16488 4 2.09488 4.92 2.00488 8.5C3.93488 8.5 5.49488 10.07 5.49488 12C5.49488 13.93 3.93488 15.49 2.00488 15.5C2.09488 19.08 3.16488 20 6.99488 20H16.9949C20.9949 20 21.9949 19 21.9949 15V9C21.9949 5 20.9949 4 16.9949 4Z"
                                  stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M8.99316 4V7.5" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"
                                  stroke-linejoin="round" />
                            <path d="M8.99316 16.5V20" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"
                                  stroke-linejoin="round" />
                            <path d="M15.025 9.32991L15.645 10.5799C15.705 10.6999 15.825 10.7899 15.955 10.8099L17.335 11.0099C17.675 11.0599 17.815 11.4799 17.565 11.7199L16.565 12.6899C16.465 12.7799 16.425 12.9199 16.445 13.0599L16.685 14.4299C16.745 14.7699 16.385 15.0299 16.085 14.8699L14.855 14.2199C14.735 14.1599 14.585 14.1599 14.465 14.2199L13.235 14.8699C12.925 15.0299 12.575 14.7699 12.635 14.4299L12.875 13.0599C12.895 12.9199 12.855 12.7899 12.755 12.6899L11.765 11.7199C11.515 11.4799 11.655 11.0599 11.995 11.0099L13.375 10.8099C13.515 10.7899 13.625 10.7099 13.685 10.5799L14.295 9.32991C14.435 9.01991 14.875 9.01991 15.025 9.32991Z"
                                  stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                          </svg>
                          Book
                        </a>
                      </c:when>
                      <c:otherwise>
                        <a href="<%=root%>/login"
                           class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                          <svg width="20px" height="20px" viewBox="0 0 24 24" fill="white" style="margin-right: 5px;"
                               xmlns="http://www.w3.org/2000/svg">
                            <path d="M16.9949 4H6.99488C3.16488 4 2.09488 4.92 2.00488 8.5C3.93488 8.5 5.49488 10.07 5.49488 12C5.49488 13.93 3.93488 15.49 2.00488 15.5C2.09488 19.08 3.16488 20 6.99488 20H16.9949C20.9949 20 21.9949 19 21.9949 15V9C21.9949 5 20.9949 4 16.9949 4Z"
                                  stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M8.99316 4V7.5" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"
                                  stroke-linejoin="round" />
                            <path d="M8.99316 16.5V20" stroke="#292D32" stroke-width="1.5" stroke-linecap="round"
                                  stroke-linejoin="round" />
                            <path d="M15.025 9.32991L15.645 10.5799C15.705 10.6999 15.825 10.7899 15.955 10.8099L17.335 11.0099C17.675 11.0599 17.815 11.4799 17.565 11.7199L16.565 12.6899C16.465 12.7799 16.425 12.9199 16.445 13.0599L16.685 14.4299C16.745 14.7699 16.385 15.0299 16.085 14.8699L14.855 14.2199C14.735 14.1599 14.585 14.1599 14.465 14.2199L13.235 14.8699C12.925 15.0299 12.575 14.7699 12.635 14.4299L12.875 13.0599C12.895 12.9199 12.855 12.7899 12.755 12.6899L11.765 11.7199C11.515 11.4799 11.655 11.0599 11.995 11.0099L13.375 10.8099C13.515 10.7899 13.625 10.7099 13.685 10.5799L14.295 9.32991C14.435 9.01991 14.875 9.01991 15.025 9.32991Z"
                                  stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                          </svg>
                          Book
                        </a>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>

        <jsp:include page="./Component/footer.jsp">
          <jsp:param name="" value="" />
        </jsp:include>

        <script src="<%=root%>/tailwind/flowbite.min.js"></script>
        <script src="<%=root%>/assets/js/aos.js"></script>
        <script>
          AOS.init();
        </script>
        </div>
      </body>
      </html>