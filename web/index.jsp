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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="<%=root%>/assets/images/logo.png" type="image/gif" sizes="16x16">
        <title>Home</title>
        <script src="<%=root%>/tailwind/tailwind.js"></script>
        <link href="<%=root%>/assets/css/aos.css" rel="stylesheet">
      </head>

      <!-- component header -->
      <jsp:include page="./Component/header.jsp">
        <jsp:param name="activeTab" value="home" />
      </jsp:include>

      <!--content-->

      <div class="flex justify-center mt-4">
        <c:if test="${sessionScope.state == 'successChangedPassword'}">
          <div class="flex items-center p-4 mb-4 text-sm text-green-400 rounded bg-gray-800 w-fit" role="alert">
            <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                 fill="currentColor" viewBox="0 0 20 20">
              <path
                    d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
            </svg>
            <div>
              <span class="font-medium">Your password change was successful.

              </span>
            </div>
          </div>
          <c:remove var="state" scope="session" />
        </c:if>

        <c:if test="${sessionScope.state == 'inCorrectCurrentPassword'}">
          <div class="flex items-center  p-4 mb-4 text-sm text-red-400 rounded bg-gray-800 w-fit" role="alert">
            <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                 fill="currentColor" viewBox="0 0 20 20">
              <path
                    d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
            </svg>
            <div>
              <span class="font-medium">Current password is incorrect.</span>
            </div>
          </div>
          <c:remove var="state" scope="session" />
        </c:if>

        <c:if test="${sessionScope.state == 'inCorrectConfirmPassword'}">
          <div class="flex items-center  p-4 mb-4 text-sm text-red-400 rounded bg-gray-800 w-fit" role="alert">
            <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                 fill="currentColor" viewBox="0 0 20 20">
              <path
                    d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
            </svg>
            <div>
              <span class="font-medium">Confirm password is incorrect.</span>
            </div>
          </div>
          <c:remove var="state" scope="session" />
        </c:if>

        <c:if test="${sessionScope.state == 'samePassword'}">
          <div class="flex items-center  p-4 mb-4 text-sm text-red-400 rounded bg-gray-800 w-fit" role="alert">
            <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                 fill="currentColor" viewBox="0 0 20 20">
              <path
                    d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
            </svg>
            <div>
              <span class="font-medium">The new password cannot be the same as the current password.</span>
            </div>
          </div>
          <c:remove var="state" scope="session" />
        </c:if>
      </div>

      <div class="mx-auto py-16 px-32" data-aos="fade-up">
        <div class="rounded-lg text-white py-14 bg-center bg-no-repeat bg-cover"
             style="background-image: url('<%=root%>/assets/images/main.webp')">
          <div class="container mx-auto text-center text-white px-4">
            <h1 class="text-4xl md:text-6xl font-bold">Welcome to NTV Cinema</h1>
            <p class="text-xl mt-4">Experience movies like never before.</p>
            <div class="py-2 px-6 bg-gray-100 text-gray-800 hover:bg-gray-200 rounded-md mt-8 w-40 mx-auto font-bold">
              <a href="<%=root%>/showing">Get Started</a>
            </div>
          </div>
        </div>
      </div>

      <section class="bg-white px-32 pb-16">
        <div class="container mx-auto px-4" data-aos="fade-up" data-aos-delay="100">
          <h2 class="text-3xl font-bold mb-8 text-gray-800">Upcoming Movies</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            <c:forEach var="movie" items="${movies}">
              <div class="shadow-lg rounded-lg overflow-hidden">
                <img src="<%=root%>/assets/images/${movie.getImg()}"
                     class="w-full" alt="Movie poster">
                <div class="p-4">
                  <h3 class="text-xl font-bold mb-2 line-clamp-1">${movie.getTitle()}</h3>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </section>

      <jsp:include page="./Component/footer.jsp">
        <jsp:param name="" value="" />
      </jsp:include>


      <script src="<%=root%>/tailwind/flowbite.min.js"></script>
      <script src="<%=root%>/assets/js/aos.js"></script>
      <script>
        AOS.init();
      </script>
      </body>
      </html>