<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% 
  String root = request.getContextPath();
  
  // delete ".jsp"
  String URI = request.getRequestURI();
  URI = URI.substring(0, URI.length() - 4);
%>

<!-- Create, Edit form -->
<div class="form mt-8">
  <form action="<%=URI%>" method="post">
    <!-- Cagtegory -->
    <input type="hidden" name="action" value="${action}" />
    <c:if test="${action == 'update'}">
      <div class="relative z-0 w-full mb-6 group">
        <input
          type="text"
          name="id"
          id="id"
          class="block py-2.5 px-0 w-full text-sm bg-transparent border-0 border-b-2 appearance-none text-gray-400 text-gray-400 focus:border-blue-500 focus:outline-none focus:ring-0 peer"
          placeholder=" "
          value="${seatClass.getId()}"
          readonly
          />
        <label
          for="id"
          class="peer-focus:font-medium absolute text-sm text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
          >Seat Class ID</label
        >
      </div>
    </c:if>

    <div class="grid md:grid-cols-2 md:gap-6">
      <div class="relative z-0 w-full mb-6 group">
        <input
          type="text"
          name="category"
          id="category"
          class="block py-2.5 px-0 w-full text-sm bg-transparent border-0 border-b-2 appearance-none text-white border-white focus:border-blue-500 focus:outline-none focus:ring-0 peer"
          placeholder=" "
          value="${seatClass.getCategory()}"
          required
          />
        <label
          for="category"
          class="peer-focus:font-medium absolute text-sm text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
          >Category</label
        >
      </div>
      <div class="relative z-0 w-full mb-6 group">
        <input
          type="text"
          name="factor"
          id="factor"
          class="block py-2.5 px-0 w-full text-sm bg-transparent border-0 border-b-2 appearance-none text-white border-white focus:border-blue-500 focus:outline-none focus:ring-0 peer"
          placeholder=" "
          value="${seatClass.getFactor()}"
          required
          />
        <label
          for="factor"
          class="peer-focus:font-medium absolute text-sm text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
          >Factor</label
        >
      </div>
    </div>
    <button
      type="submit"
      class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
      Submit
    </button>
          <a href="<%=URI%>" class=" font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 bg-gray-800 text-white border-gray-600 hover:bg-gray-700 hover:border-gray-600 focus:ring-gray-700">Back</a>
  </form>
</div>
