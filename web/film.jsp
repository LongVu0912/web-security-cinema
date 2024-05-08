<%@ page import="java.time.format.TextStyle" %>
  <%@ page import="java.util.Locale" %>
    <%@ page import="java.sql.Date" %>


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
              <title>${movie.getTitle()}</title>
              <link rel="icon" href="<%=root%>/assets/images/logo.png" type="image/gif" sizes="16x16">
              <script src="<%=root%>/tailwind/tailwind.js"></script>
              <link href="<%=root%>/assets/css/aos.css" rel="stylesheet">
            </head>

            <body>
              <!-- component header -->
              <jsp:include page="./Component/header.jsp">
                <jsp:param name="activeTab" value="" />
              </jsp:include>

              <!--content-->
              <div class="film-wrapper pb-[60px]">
                <!--Show movie-->
                <div class="text-white py-14 bg-no-repeat bg-cover"
                     style="background-image: url('<%=root%>/assets/images/main.webp')">
                  <div class="film-wrapper-content md:mx-64 mx:-32 flex gap-16">
                    <div class="film-thumbnail border-2 border-white rounded-lg min-w-[300px]">
                      <img
                           src="<%=root%>/assets/images/${movie.getImg()}"
                           alt="film-thumbnail"
                           class="w-80 h-96 rounded-t-lg object-cover" />
                      <div
                           class="flex items-center justify-center text-center bg-black text-white border-t-2 py-2 rounded-b-lg">
                        <svg fill="white" width="20px" height="20px" viewBox="0 -13.54 122.88 122.88" version="1.1"
                             style="margin-right: 5px;"
                             id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                             style="enable-background:new 0 0 122.88 95.8" xml:space="preserve">
                          <g>
                            <path
                                  d="M12.14,0H32.8h29.43h28.8h19.71c3.34,0,6.38,1.37,8.58,3.56c2.2,2.2,3.56,5.24,3.56,8.58v7.13v57.25v7.09 c0,3.34-1.37,6.38-3.56,8.58c-2.2,2.2-5.24,3.56-8.58,3.56h-19.2c-0.16,0.03-0.33,0.04-0.51,0.04c-0.17,0-0.34-0.01-0.51-0.04 H62.74c-0.16,0.03-0.33,0.04-0.51,0.04c-0.17,0-0.34-0.01-0.51-0.04H33.31c-0.16,0.03-0.33,0.04-0.51,0.04 c-0.17,0-0.34-0.01-0.51-0.04H12.14c-3.34,0-6.38-1.37-8.58-3.56S0,86.95,0,83.61v-7.09V19.27v-7.13C0,8.8,1.37,5.76,3.56,3.56 C5.76,1.37,8.8,0,12.14,0L12.14,0z M55.19,31.24l20.53,14.32c0.32,0.2,0.61,0.48,0.84,0.81c0.92,1.33,0.58,3.14-0.74,4.06 L55.37,64.57c-0.5,0.41-1.15,0.66-1.85,0.66c-1.62,0-2.93-1.31-2.93-2.93V33.63h0.01c0-0.58,0.17-1.16,0.52-1.67 C52.05,30.64,53.87,30.32,55.19,31.24L55.19,31.24z M93.95,79.45V89.9h16.78c1.73,0,3.3-0.71,4.44-1.85 c1.14-1.14,1.85-2.71,1.85-4.44v-4.16H93.95L93.95,79.45z M88.1,89.9V79.45H65.16V89.9H88.1L88.1,89.9z M59.31,89.9V79.45H35.73 V89.9H59.31L59.31,89.9z M29.87,89.9V79.45H5.85v4.16c0,1.73,0.71,3.3,1.85,4.44c1.14,1.14,2.71,1.85,4.44,1.85H29.87L29.87,89.9z M5.85,73.6H32.8h29.43h28.8h26V22.2h-26h-28.8H32.8H5.85V73.6L5.85,73.6z M88.1,16.35V5.85H65.16v10.49H88.1L88.1,16.35z M93.95,5.85v10.49h23.07v-4.2c0-1.73-0.71-3.3-1.85-4.44c-1.14-1.14-2.71-1.85-4.44-1.85H93.95L93.95,5.85z M59.31,16.35V5.85 H35.73v10.49H59.31L59.31,16.35z M29.87,16.35V5.85H12.14c-1.73,0-3.3,0.71-4.44,1.85c-1.14,1.14-1.85,2.71-1.85,4.44v4.2H29.87 L29.87,16.35z" />
                          </g>
                        </svg>
                        Showing
                      </div>
                    </div>
                    <div class="film-detail flex flex-col items-start justify-center gap-4">
                      <h1
                          class="film-name xl:text-4xl text-2xl font-bold">
                        ${movie.getTitle()}
                      </h1>
                      <div class="flex film-duration xl:text-lg xl:font-semmibold font-medium">
                        <svg width="28px" height="28px" viewBox="0 0 24 24" fill="white" style="margin-right: 7px;"
                             xmlns="http://www.w3.org/2000/svg">
                          <path d="M23 12C23 18.0751 18.0751 23 12 23C5.92487 23 1 18.0751 1 12C1 5.92487 5.92487 1 12 1C18.0751 1 23 5.92487 23 12ZM3.00683 12C3.00683 16.9668 7.03321 20.9932 12 20.9932C16.9668 20.9932 20.9932 16.9668 20.9932 12C20.9932 7.03321 16.9668 3.00683 12 3.00683C7.03321 3.00683 3.00683 7.03321 3.00683 12Z"
                                fill="white" />
                          <path d="M12 5C11.4477 5 11 5.44771 11 6V12.4667C11 12.4667 11 12.7274 11.1267 12.9235C11.2115 13.0898 11.3437 13.2343 11.5174 13.3346L16.1372 16.0019C16.6155 16.278 17.2271 16.1141 17.5032 15.6358C17.7793 15.1575 17.6155 14.5459 17.1372 14.2698L13 11.8812V6C13 5.44772 12.5523 5 12 5Z"
                                fill="white" />
                        </svg>
                        ${movie.getDuration()}
                      </div>
                      <div class="film-genres xl:text-lg xl:font-semmibold font-bold">
                        ${movie.getGenre()}
                      </div>
                      <div class="flex film-director xl:text-lg xl:font-semmibold font-bold">
                        Director:
                        <div class="font-medium ml-2">
                          ${movie.getDirector()}
                        </div>
                      </div>
                      <div class="flex film-director xl:text-lg xl:font-semmibold font-bold">
                        Main Actor:
                        <div class="font-medium ml-2">
                          ${movie.getMainActor()}
                        </div>
                      </div>
                      <div class="film-mainactor xl:text-lg xl:font-normal font-normal">
                        ${movie.getDescription()}
                      </div>
                    </div>
                  </div>
                </div>

                <!--Showtime-->
                <div id="show-time-movie" class="xl:mx-64 mx-32 mt-7">
                  <div class="show-time-detail">
                    <h1 class="xl:text-3xl text-2xl font-bold mb-3">
                      Showtime ${movie.getTitle()}
                    </h1>

                    <div class="border-2 rounded p-3 flex flex-col gap-4">
                      <!--Choose date-->
                      <div class="show-days show-rooms grid grid-cols-7 text-center gap-4">

                        <c:forEach var="comingDate" items="${comingDates}">
                          <c:set var="dayOfWeek"
                                 value="${comingDate.toLocalDate().getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.getDefault())}" />
                          <div>
                            <input type="radio"
                                   id="${dayOfWeek}"
                                   name="dayOfWeek"
                                   value="${comingDate}"
                                   class="hidden peer">
                            <label for="${dayOfWeek}" class="flex items-center justify-center w-full p-3 xl:font-bold font-semmibold
                                   border-2 border-gray-200 rounded cursor-pointer peer-checked:border-blue-600 peer-checked:text-blue-600
                                   hover:text-gray-700 hover:bg-gray-100">
                              <div class="flex items-center justify-center">
                                ${dayOfWeek} <br />
                                (${comingDate})
                              </div>
                            </label>

                          </div>
                        </c:forEach>
                      </div>

                      <!--Choose Time-->
                      <div id="showtime_times" class="hidden">
                        <div class="text-xl font-bold mb-3">2D</div>
                        <div class="grid grid-cols-5 text-center gap-2">
                          <c:forEach var="comingShowTime" items="${comingShowTimes}" varStatus="loop">
                            <div>
                              <input
                                     type="radio"
                                     id="time_${loop.index + 1}"
                                     name="time"
                                     value="${comingShowTime.getStartTime()}"
                                     -data-day-of-week="${comingShowTime.getDayOfWeek()}"
                                     class="hidden peer" />
                              <a
                                 for="time_${loop.index + 1}"
                                 href="<%=root%>/showing/film/seat?showtimeId=${comingShowTime.getShowtimeId()}"
                                 class="block border-2 rounded py-3 cursor-pointer font-bold peer-checked:border-blue-600
                                peer-checked:text-blue-600 hover:text-gray-700 hover:bg-gray-100">
                                <span class="text-xl"> ${comingShowTime.getStartTime_ToMinute()} </span> ~
                                ${comingShowTime.getEndTime_ToMinute()}
                              </a>
                            </div>
                          </c:forEach>

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
                const dateInputs = [...document.querySelectorAll("[name='dayOfWeek']")];
                const timeInputs = [...document.querySelectorAll("[name='time']")];
                const showtime_times = document.getElementById("showtime_times");
                let dayOfWeek_atDateInput, dayOfWeek_atTimeInput;

                dateInputs.forEach((dateInput) => {
                  dateInput.addEventListener("click", (e) => {
                    dayOfWeek_atDateInput = e.target.getAttribute("id");

                    // set display of showtime_times to block
                    showtime_times.classList.remove("hidden");
                    showtime_times.classList.add('show-times', 'flex', 'flex-col');

                    // show times by day of week hide times not in day of week
                    timeInputs.forEach((timeInput) => {
                      dayOfWeek_atTimeInput = timeInput.getAttribute("-data-day-of-week");

                      if (dayOfWeek_atDateInput === dayOfWeek_atTimeInput)
                        timeInput.parentElement.style.display = "block";
                      else
                        timeInput.parentElement.style.display = "none";
                    });
                  });
                });
              </script>
              <script src="<%=root%>/assets/js/aos.js"></script>
              <script>
                AOS.init();
              </script>
            </body>
            </html>