<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%String root=request.getContextPath();%>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="<%=root%>/assets/images/logo.png" type="image/gif" sizes="16x16">
        <title>Admin page</title>
        <script src="<%=root%>/tailwind/tailwind.js"></script>
        <link rel="stylesheet" href="<%=root%>/assets/css/style.css" />
      </head>

      <body>
        <div class="admin-page bg-[#3D4857E1]">
          <!-- Aside bar -->
          <aside
                 id="separator-sidebar"
                 class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0"
                 aria-label="Sidebar">
            <div class="h-full px-3 py-4 overflow-y-auto bg-gray-800">
              <ul class="space-y-2 font-medium">
                <!-- Dashboard -->
                <li>
                  <a
                     href="<%=root%>"
                     class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group">
                    <svg
                         class="w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                         aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg"
                         fill="currentColor"
                         viewBox="0 0 22 21">
                      <path
                            d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z" />
                      <path
                            d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z" />
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">NTV Cinema</span>
                  </a>
                </li>
                <!-- Movies -->
                <li>
                  <a
                     href="<%=root%>/admin/movies"
                     class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group">
                    <svg
                         class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                         xmlns="http://www.w3.org/2000/svg"
                         height="1em"
                         fill="currentColor"
                         viewBox="0 0 640 512">
                      <path
                            d="M64 64V352H576V64H64zM0 64C0 28.7 28.7 0 64 0H576c35.3 0 64 28.7 64 64V352c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V64zM128 448H512c17.7 0 32 14.3 32 32s-14.3 32-32 32H128c-17.7 0-32-14.3-32-32s14.3-32 32-32z" />
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Movies</span>
                  </a>
                </li>
                <!-- Rooms -->
                <li>
                  <a
                     href="<%=root%>/admin/rooms"
                     class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group">
                    <svg
                         class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                         xmlns="http://www.w3.org/2000/svg"
                         height="1em"
                         fill="currentColor"
                         viewBox="0 0 512 512">
                      <path
                            d="M0 96C0 60.7 28.7 32 64 32H448c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM48 368v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V368c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zm368-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V368c0-8.8-7.2-16-16-16H416zM48 240v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V240c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zm368-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V240c0-8.8-7.2-16-16-16H416zM48 112v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zM416 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H416zM160 128v64c0 17.7 14.3 32 32 32H320c17.7 0 32-14.3 32-32V128c0-17.7-14.3-32-32-32H192c-17.7 0-32 14.3-32 32zm32 160c-17.7 0-32 14.3-32 32v64c0 17.7 14.3 32 32 32H320c17.7 0 32-14.3 32-32V320c0-17.7-14.3-32-32-32H192z" />
                    </svg>
                    <span class="flex-1 ms-3 whitespace-nowrap">Rooms</span>
                  </a>
                </li>
                <!-- Showtimes -->
                <li>
                  <a
                     href="<%=root%>/admin/showtimes"
                     class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group">
                    <svg
                         class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                         aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg"
                         fill="currentColor"
                         viewBox="0 0 20 18">
                      <path
                            d="M14 2a3.963 3.963 0 0 0-1.4.267 6.439 6.439 0 0 1-1.331 6.638A4 4 0 1 0 14 2Zm1 9h-1.264A6.957 6.957 0 0 1 15 15v2a2.97 2.97 0 0 1-.184 1H19a1 1 0 0 0 1-1v-1a5.006 5.006 0 0 0-5-5ZM6.5 9a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9ZM8 10H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5Z" />
                    </svg>

                    <span class="flex-1 ms-3 whitespace-nowrap">Showtime</span>
                  </a>
                </li>
                <!-- Statistics -->
                <li>
                  <a
                     href="<%=root%>/admin/statistics"
                     class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group">
                    <svg
                         class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                         aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg"
                         fill="currentColor"
                         viewBox="0 0 18 18">
                      <path
                            d="M6.143 0H1.857A1.857 1.857 0 0 0 0 1.857v4.286C0 7.169.831 8 1.857 8h4.286A1.857 1.857 0 0 0 8 6.143V1.857A1.857 1.857 0 0 0 6.143 0Zm10 0h-4.286A1.857 1.857 0 0 0 10 1.857v4.286C10 7.169 10.831 8 11.857 8h4.286A1.857 1.857 0 0 0 18 6.143V1.857A1.857 1.857 0 0 0 16.143 0Zm-10 10H1.857A1.857 1.857 0 0 0 0 11.857v4.286C0 17.169.831 18 1.857 18h4.286A1.857 1.857 0 0 0 8 16.143v-4.286A1.857 1.857 0 0 0 6.143 10Zm10 0h-4.286A1.857 1.857 0 0 0 10 11.857v4.286c0 1.026.831 1.857 1.857 1.857h4.286A1.857 1.857 0 0 0 18 16.143v-4.286A1.857 1.857 0 0 0 16.143 10Z" />
                    </svg>

                    <span class="flex-1 ms-3 whitespace-nowrap">Statistics</span>
                  </a>
                </li>
              </ul>
            </div>
          </aside>

          <!-- Content -->
          <div class="content ml-64 px-4 min-h-[100vh] pt-4">
            <!-- Movies table -->
            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
              <table
                     class="w-full text-sm text-left rtl:text-right text-gray-500 text-gray-400">
                <thead class="text-xs uppercase bg-gray-700 text-gray-400">
                  <tr>
                    <th scope="col" class="px-6 py-3">Revenue</th>
                    <th scope="col" class="px-6 py-3">Tickets Sold</th>
                    <th scope="col" class="px-6 py-3">Showtime Count</th>
                    <th scope="col" class="px-6 py-3">Movie Count</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="border-b bg-gray-800 border-gray-700 font-medium">
                    <th scope="row"
                        class="px-6 py-2 whitespace-nowrap text-white">
                      ${totalRevenue} VND
                    </th>
                    <td class="px-6 py-2">${totalTickets}</td>
                    <td class="px-6 py-2">${totalShowtimes}</td>
                    <td class="px-6 py-2">${totalMovies}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

        <script src="<%=root%>/tailwind/flowbite.min.js"></script>
        <script>
          // Prevent click behavior in active tab
          const activeTab = document.querySelector(".aside-tab--active");
          activeTab.addEventListener("click", (e) => {
            e.preventDefault();
          });

          // get data and save to input field from delete action
          let roomNumber;
          const roomDeleteButtons = document.querySelectorAll('[data-seatclass-id]');
          const roomNumberInput = document.querySelector('[name="seatClassID"]');

          for (let roomDeleteButton of roomDeleteButtons) {
            roomDeleteButton.addEventListener("click", (e) => {
              //Get data room from element
              roomNumber = roomDeleteButton.getAttribute("data-seatclass-id");
              roomNumberInput.value = roomNumber;
            });
          }
        </script>
      </body>
      </html>