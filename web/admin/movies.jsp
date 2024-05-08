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

        <form action="<%=root%>/admin/movies" method="get" class="px-72 py-4 bg-[#3D4857E1]">
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
                   placeholder="Movies Name" value="${movieName}" required>
            <button type="submit"
                    class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2">Search</button>
          </div>
        </form>

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
                     href="<%=root%>/"
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
                     href=""
                     class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group aside-tab--active">
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
            <!-- Table -->

            <c:choose>
              <c:when test="${action == 'update' || action == 'add'}">
                <!-- update form -->
                <c:import url="${root}/AdminComponent/Update/movie.jsp" />
              </c:when>
              <c:otherwise>
                <!-- Movies table -->
                <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                  <table
                         class="w-full text-sm text-left rtl:text-right text-gray-500 text-gray-400">
                    <thead class="text-xs uppercase bg-gray-700 text-gray-400">
                      <tr>
                        <th scope="col" class="px-6 py-3">Product name</th>
                        <th scope="col" class="px-6 py-3">Director</th>
                        <th scope="col" class="px-6 py-3">Main actor</th>
                        <th scope="col" class="px-6 py-3">Genre</th>
                        <th scope="col" class="px-2 py-3">Duration</th>
                        <th scope="col" class="px-2 py-3 text-center">Description</th>
                        <th scope="col" class="px-6 py-3"></th>
                        <th scope="col" class="px-6 py-3"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="movie" items="${movies}">
                        <tr class="border-b bg-gray-800 border-gray-700 font-medium">
                          <th
                              scope="row"
                              class="px-6 py-2 text-white">
                            ${movie.getTitle()}
                          </th>
                          <td class="px-6 py-2">${movie.getDirector()}</td>
                          <td class="px-6 py-2">${movie.getMainActor()}</td>
                          <td class="px-6 py-2">${movie.getGenre()}</td>
                          <td class="px-2 py-2">${movie.getMins()} mins</td>
                          <td class="px-2 py-2 w-80">${movie.getDescription()}</td>
                          <td class="px-6 py-2">
                            <a href="<%=root%>/admin/movies?action=update&movieID=${movie.getMovieID()}"
                               class="font-medium text-blue-500 hover:underline">Edit</a>
                          </td>
                          <td class="px-6 py-2">
                            <button data-modal-target="delete_modal" data-movie-ID=${movie.getMovieID()}
                                    data-modal-toggle="delete_modal"
                                    class="block text-white focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-blue-600 hover:bg-blue-700 focus:ring-blue-800"
                                    type="button">
                              Delete
                            </button>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>

                <!--Add Movie-->
                <form method="get" action="<%=root%>/admin/movies">
                  <input type="hidden" name="action" value="add" />
                  <button type="submit"
                          class="mt-4 focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2">Add
                    movie</button>
                </form>

                <div id="delete_modal" tabindex="-1"
                     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                  <div class="relative p-4 w-full max-w-md max-h-full">
                    <div class="relative rounded-lg shadow bg-gray-700">
                      <button type="button"
                              class="absolute top-3 end-2.5 text-gray-400 bg-transparent rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center hover:bg-gray-600 hover:text-white"
                              data-modal-hide="delete_modal">
                        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                             viewBox="0 0 14 14">
                          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                        </svg>
                        <span class="sr-only">Close modal</span>
                      </button>
                      <div class="p-4 md:p-5 text-center">
                        <svg class="mx-auto mb-4 w-12 h-12 text-gray-200" aria-hidden="true"
                             xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                stroke-width="2" d="M10 11V6m0 8h.01M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                        </svg>
                        <h3 class="mb-5 text-lg font-normal text-gray-400">Are you sure you want to delete this
                          product?</h3>

                        <!--FORM TO DELETE SERVLET-->
                        <form method="post" action="<%=root%>/admin/movies">
                          <input type="hidden" name="action" value="delete" />
                          <input type="hidden" name="movieID" value="" />
                          <button data-modal-hide="delete_modal" type="submit"
                                  class="text-white bg-red-600 px-5 py-2.5 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center text-center me-2">
                            Yes, I'm sure
                          </button>
                          <button data-modal-hide="delete_modal" type="button"
                                  class=" focus:ring-4 focus:outline-none 0 rounded-lg border text-sm font-medium px-5 py-2.5  focus:z-10 bg-gray-700 text-gray-300 border-gray-500 hover:text-white hover:bg-gray-600 focus:ring-gray-600">No,
                            cancel</button>

                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </c:otherwise>
            </c:choose>

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
          let movieID;
          const movieDeleteButtons = document.querySelectorAll('[data-movie-ID]');
          const movieIDInput = document.querySelector('[name="movieID"]');

          for (let movieDeleteButton of movieDeleteButtons) {
            movieDeleteButton.addEventListener("click", (e) => {
              //Get data movie from element
              movieID = movieDeleteButton.getAttribute("data-movie-ID");
              movieIDInput.value = movieID;
            });
          }
        </script>
      </body>
      </html>