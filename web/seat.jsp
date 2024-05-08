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
				<title>Booking Seats</title>
				<script src="<%=root%>/tailwind/tailwind.js"></script>
				<link href="<%=root%>/assets/css/aos.css" rel="stylesheet">
			</head>

			<!-- component header -->
			<jsp:include page="./Component/header.jsp">
				<jsp:param name="activeTab" value="" />
			</jsp:include>

			<!--content-->
			<div class="booking-wrapper py-14 2xl:mx-32 xl:mx-16 lg:mx-8">
				<div class="classify-seat grid 2xl:grid-cols-2 2xl:gap-5 xl:grid-cols-1 grid-cols-1 lg:gap-2 gap-2"
						 data-aos="fade-up">
					<div class="flex items-center gap-7">
						<div class="bg-slate-600 w-12 rounded h-6"></div>
						<span class="font-bold md:text-xl text-sm">Standard</span>
					</div>
					<div class="flex items-center gap-7">
						<div class="bg-red-600 w-12 rounded h-6"></div>
						<span class="font-bold md:text-xl text-sm">Unavailable</span>
					</div>
					<div class="flex items-center gap-7">
						<div class="bg-purple-600 w-12 rounded h-6"></div>
						<span class="font-bold md:text-xl text-sm">Vip</span>
					</div>
					<div class="flex items-center gap-7">
						<div class="bg-green-600 w-12 rounded h-6"></div>
						<span class="font-bold md:text-xl text-sm w-[200px]">Your selected seats</span>
					</div>
				</div>
				<div class="screen-seats mt-12" data-aos="fade-up">
					<span
								class="bg-slate-600 text-center text-white text-xl uppercase font-bold py-2 rounded lg:px-64 lg:mx-40 px-[188px] mx-[70px]">Screen
					</span>
				</div>

				<div class="flex flex-row lg:gap-2 lg:mt-8 mt-[5px] gap-2">
					<!--Column-->
					<div class="name-seats flex flex-col gap-[8px] text-black text-center font-bold lg:mt-[3px]"
							 data-aos="fade-up" data-aos-delay="100">
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-white border-[1px] h-[42px] text-white lg:border-1 rounded select-none">
							O
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							A
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							B
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							C
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							D
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							E
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							F
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							G
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							H
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							I
						</div>
						<div
								 class="lg:w-12 lg:p-4 w-8 lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] h-[42px] rounded select-none">
							J
						</div>
					</div>

					<div class="name-detail-seats h-fit grid grid-cols-10 xl:gap-2 xl:ml-[115px] 2xl:gap-2
           2xl:ml-28 lg:gap-[20px] lg:ml-[110px] ml-[68px] gap-1 mt-[3px] text-center" data-aos="fade-up"
							 data-aos-delay="100">

						<input type="checkbox" id="A" class="hidden custom-label" name="group-seats" />
						<label for="A" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">1</label>

						<input type="checkbox" id="B" class="hidden custom-label" name="group-seats" />
						<label for="B" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">2</label>

						<input type="checkbox" id="C" class="hidden custom-label" name="group-seats" />
						<label for="C" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">3</label>

						<input type="checkbox" id="D" class="hidden custom-label" name="group-seats" />
						<label for="D" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">4</label>

						<input type="checkbox" id="E" class="hidden custom-label" name="group-seats" />
						<label for="E" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">5</label>

						<input type="checkbox" id="F" class="hidden custom-label" name="group-seats" />
						<label for="F" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">6</label>

						<input type="checkbox" id="G" class="hidden custom-label" name="group-seats" />
						<label for="G" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">7</label>

						<input type="checkbox" id="H" class="hidden custom-label" name="group-seats" />
						<label for="H" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">8</label>

						<input type="checkbox" id="I" class="hidden custom-label" name="group-seats" />
						<label for="I" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">9</label>

						<input type="checkbox" id="J" class="hidden custom-label" name="group-seats" />
						<label for="J" class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1 lg:border-1
               border-gray-500 border-[1px] rounded cursor-pointer font-bold">10</label>

						<c:set var="SeatName" value="ABCDEFGHIJ" />
						<c:forEach var="i" begin="0" end="99">
							<c:set var="found" value="false" />
							<c:forEach var="seat" items="${chosenSeats}" varStatus="loop">
								<c:if test="${!found && i == seat.getSeatNumber() - 1}">
									<input type="hidden" name="seatNumber" value="${i + 1}" />
									<input type="submit"
												 class="lg:w-12 w-8 lg:py-[9px] lg:ml-[2px] py-1 bg-red-600
                     lg:border-1 rounded cursor-pointer text-white text-center select-none"
												 value="${SeatName.charAt(i/10)}${i%10 + 1}" />
									<c:set var="found" value="true" />
								</c:if>
							</c:forEach>
							<c:if test="${!found && i >= 30 && i <= 60 - 1}">
								<input type="hidden" name="seatNumber" id="seatNumber" value="${i + 1}" />
								<input type="submit"
											 class="lg:w-12 w-8 lg:py-[9px] lg:ml-[2px] py-1 bg-purple-600
                   lg:border-1 rounded cursor-pointer text-white text-center select-none"
											 value="${SeatName.charAt(i/10)}${i%10 + 1}"
											 onclick="changeColor(this, ${i + 1})"
											 seatClass="vip"
											 data-factor="1.2"
											 data-seat-number="${i + 1}" />
								<c:set var="found" value="true" />
							</c:if>
							<c:if test="${!found}">
								<input type="hidden" name="seatNumber" value="${i + 1}" />
								<input type="submit"
											 class="lg:w-12 w-8 lg:py-[9px] lg:ml-[2px] py-1 bg-slate-600
                   lg:border-1 rounded cursor-pointer text-white text-center select-none"
											 value="${SeatName.charAt(i/10)}${i%10 + 1}"
											 onclick="changeColor(this, ${i + 1})"
											 seatClass="normal"
											 data-factor="1"
											 data-seat-number="${i + 1}" />
							</c:if>
						</c:forEach>
					</div>

					<div class="info-film ml-[110px] max-w-[470px] lg:mt-[-5%] md:mx-16 lg:mx-20 xl:mx-16 flex flex-col gap-4">
						<div class="shadow-2xl p-10 px-20 flex flex-col gap-2" data-aos="fade-up">
							<!-- thumbnail -->
							<div class="image-container h-[450px] w-[calc(450px*0.7)]">
								<img class="rounded-t-lg h-full" src="<%=root%>/assets/images/${showtime.getMovie().getImg()}" alt="">
							</div>

							<!-- description -->
							<h1 class="max-w-[300px] text-center xl:text-4xl lg:text-2xl font-bold">${showtime.getMovie().getTitle()}
							</h1>
							<div id="price" data-price="${showtime.getPrice()}" class="text-sm xl:text-lg lg:text-lg text-center">
								Retail:
								<span class="font-bold"> ${showtime.getPrice()} VND</span>
							</div>

							<!-- calculate price -->
							<div class="py-2 border-t-2 border-slate-600 max-w-[320px]">
								<!-- positions -->
								<div id="positions" class="">
									Positions:
									<span class="font-bold"> list of positions here</span>
								</div>

								<!-- total price estimate -->
								<div id="total-price" class="">
									Total price:
									<span class="font-bold"> total price here</span>
								</div>
							</div>
						</div>

						<c:if test="${sessionScope.state == 'book_success'}">
							<div class="flex items-center p-4 mb-4 text-sm text-green-400 rounded bg-gray-800" role="alert">
								<svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										 fill="currentColor" viewBox="0 0 20 20">
									<path
												d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
								</svg>
								<div>
									<span class="font-medium">Booking successful! Your seats are now reserved. Enjoy the show!</span>
								</div>
							</div>
							<c:remove var="state" scope="session" />

						</c:if>
						<c:if test="${sessionScope.state == 'book_fail'}">
							<div class="flex items-center p-4 mb-4 text-sm text-red-400 rounded bg-gray-800" role="alert">
								<svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										 fill="currentColor" viewBox="0 0 20 20">
									<path
												d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
								</svg>
								<div>
									<span class="font-medium">Booking unsuccessful. Insufficient funds in your account.</span>
								</div>
							</div>
							<c:remove var="state" scope="session" />
						</c:if>

						<c:if test="${sessionScope.state == 'seat_booked'}">
							<div class="flex items-center p-4 mb-4 text-sm text-red-400 rounded bg-gray-800" role="alert">
								<svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										 fill="currentColor" viewBox="0 0 20 20">
									<path
												d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
								</svg>
								<div>
									<span class="font-medium">Booking unsuccessful. Seat are booked by another person</span>
								</div>
							</div>
							<c:remove var="state" scope="session" />
						</c:if>

						<c:if test="${sessionScope.state == 'empty_seat'}">
							<div class="flex items-center p-4 mb-4 text-sm text-red-400 rounded bg-gray-800" role="alert">
								<svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										 fill="currentColor" viewBox="0 0 20 20">
									<path
												d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
								</svg>
								<div>
									<span class="font-medium">Booking unsuccessful. You must choose a seat</span>
								</div>
							</div>
							<c:remove var="state" scope="session" />
						</c:if>

						<button class="bg-red-600 rounded w-full text-center text-white p-3 
          hover:shadow-2xl shadow-black text-lg font-bold uppercase"
										type="submit"
										data-modal-target="confirm_buy_ticket"
										data-modal-toggle="confirm_buy_ticket"
										onclick="setDataConfirmModal();">
							Check out
						</button>

						<!-- Main modal -->
						<div id="confirm_buy_ticket"
								 data-modal-backdrop="static" t
								 abindex="-1" aria-hidden="true"
								 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 
          z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
							<!-- Modal -->
							<div class="relative p-4 w-full max-w-2xl max-h-full">
								<!-- Modal content -->
								<div class="relative bg-white rounded-lg shadow">
									<!-- Modal header -->
									<div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t">
										<h3 class="text-2xl font-semibold text-gray-900">
											${showtime.getMovie().getTitle()}
										</h3>
										<button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 
                  rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center"
														data-modal-hide="confirm_buy_ticket">

											<svg class="w-3 h-3"
													 aria-hidden="true"
													 xmlns="http://www.w3.org/2000/svg"
													 fill="none"
													 viewBox="0 0 14 14">
												<path stroke="currentColor"
															stroke-linecap="round"
															stroke-linejoin="round"
															stroke-width="2"
															d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
											</svg>

											<span class="sr-only">Close modal</span>
										</button>
									</div>
									<!-- Modal body -->
									<div class="p-4 md:p-5 space-y-4">
										<ol class="relative border-s border-gray-200 ms-3.5 mb-4 md:mb-5">
											<li class="mb-10 ms-8">
												<span
															class="absolute flex items-center justify-center w-6 h-6 bg-gray-100 rounded-full -start-3.5 ring-8 ring-white">
													<svg class="w-2.5 h-2.5 text-gray-500"
															 aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
															 fill="none" viewBox="0 0 20 20">
														<path fill="currentColor"
																	d="M6 1a1 1 0 0 0-2 0h2ZM4 4a1 1 0 0 0 2 0H4Zm7-3a1 1 0 1 0-2 0h2ZM9 4a1 1 0 1 0 2 0H9Zm7-3a1 1 0 1 0-2 0h2Zm-2 3a1 1 0 1 0 2 0h-2ZM1 6a1 1 0 0 0 0 2V6Zm18 2a1 1 0 1 0 0-2v2ZM5 11v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 11v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 15v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 15v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 11v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM5 15v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM2 4h16V2H2v2Zm16 0h2a2 2 0 0 0-2-2v2Zm0 0v14h2V4h-2Zm0 14v2a2 2 0 0 0 2-2h-2Zm0 0H2v2h16v-2ZM2 18H0a2 2 0 0 0 2 2v-2Zm0 0V4H0v14h2ZM2 4V2a2 2 0 0 0-2 2h2Zm2-3v3h2V1H4Zm5 0v3h2V1H9Zm5 0v3h2V1h-2ZM1 8h18V6H1v2Zm3 3v.01h2V11H4Zm1 1.01h.01v-2H5v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H5v2h.01v-2ZM9 11v.01h2V11H9Zm1 1.01h.01v-2H10v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM9 15v.01h2V15H9Zm1 1.01h.01v-2H10v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM14 15v.01h2V15h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM14 11v.01h2V11h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM4 15v.01h2V15H4Zm1 1.01h.01v-2H5v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H5v2h.01v-2Z" />
													</svg>
												</span>

												<div class="flex">
													<span
																class="bg-purple-100 text-purple-800 font-bold mr-2 px-2.5 mb-1 rounded flex items-center">
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
												<span
															class="absolute flex items-center justify-center w-6 h-6 bg-gray-100 rounded-full -start-3.5 ring-8 ring-white">
													<svg class="w-2.5 h-2.5 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
															 fill="none" viewBox="0 0 20 20">
														<path fill="currentColor"
																	d="M6 1a1 1 0 0 0-2 0h2ZM4 4a1 1 0 0 0 2 0H4Zm7-3a1 1 0 1 0-2 0h2ZM9 4a1 1 0 1 0 2 0H9Zm7-3a1 1 0 1 0-2 0h2Zm-2 3a1 1 0 1 0 2 0h-2ZM1 6a1 1 0 0 0 0 2V6Zm18 2a1 1 0 1 0 0-2v2ZM5 11v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 11v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM10 15v-1H9v1h1Zm0 .01H9v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 15v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM15 11v-1h-1v1h1Zm0 .01h-1v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM5 15v-1H4v1h1Zm0 .01H4v1h1v-1Zm.01 0v1h1v-1h-1Zm0-.01h1v-1h-1v1ZM2 4h16V2H2v2Zm16 0h2a2 2 0 0 0-2-2v2Zm0 0v14h2V4h-2Zm0 14v2a2 2 0 0 0 2-2h-2Zm0 0H2v2h16v-2ZM2 18H0a2 2 0 0 0 2 2v-2Zm0 0V4H0v14h2ZM2 4V2a2 2 0 0 0-2 2h2Zm2-3v3h2V1H4Zm5 0v3h2V1H9Zm5 0v3h2V1h-2ZM1 8h18V6H1v2Zm3 3v.01h2V11H4Zm1 1.01h.01v-2H5v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H5v2h.01v-2ZM9 11v.01h2V11H9Zm1 1.01h.01v-2H10v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM9 15v.01h2V15H9Zm1 1.01h.01v-2H10v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H10v2h.01v-2ZM14 15v.01h2V15h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM14 11v.01h2V11h-2Zm1 1.01h.01v-2H15v2Zm1.01-1V11h-2v.01h2Zm-1-1.01H15v2h.01v-2ZM4 15v.01h2V15H4Zm1 1.01h.01v-2H5v2Zm1.01-1V15h-2v.01h2Zm-1-1.01H5v2h.01v-2Z" />
													</svg>
												</span>
												<div class="flex">
													<span
																class="bg-purple-100 text-purple-800 font-bold mr-2 px-2.5 mb-1 rounded flex items-center">
														VIP
													</span>
													<h3 id="modalVipSeats" class="flex items-start mb-1 text-lg font-semibold text-gray-900">
													</h3>
												</div>
												<div id="modalVipPrice" class="block mb-3 text-sm font-normal leading-none text-gray-500">Price
												</div>
											</li>
										</ol>

										<h5 class="text-xl">Total price: <span id="modal-total-price"></span></h5>
									</div>
									<!-- Modal footer -->

									<% String csrfToken = (String) session.getAttribute("csrfToken"); %>
									<form action="<%=root%>/showing/film/seat" method="POST" onsubmit="prepareData();">
										<input type="hidden" name="csrfToken" value="<%=csrfToken%>">
										<input type="hidden" name="action" value="bookingSeats">
										<input type="hidden" name="seatNumbers" id="seatNumbersInput">
										<input type="hidden" name="showtimeId" value="${showtime.getShowtimeId()}">

										<div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b">
											<button data-modal-hide="confirm_buy_ticket"
															type="submit"
															class="text-white bg-red-600 hover:bg-red-700 focus:ring-4 
                    focus:outline-none focus:ring-red-300 font-medium rounded-lg 
                    text-sm px-5 py-2.5 text-center">
												Buy
											</button>

											<button data-modal-hide="confirm_buy_ticket"
															type="button"
															class="ms-3 text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 
                    focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 
                    text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">
												Cancel
											</button>
										</div>
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

			<script>
				const toggleMultipleClasses = (element, ...classes) =>
					classes.forEach((className, index) => element.classList.toggle(className));

				const toggleElement = (arr, val) => {
					return arr.includes(val) ? arr.filter(el => el !== val) : [...arr, val];
				}

				const prepareData = () => {
					document.getElementById('seatNumbersInput').value = activeInputs.map(input => input.getAttribute('data-seat-number')).join(',');
				}

				let listPositionsElement = document.querySelector('#positions span');
				let totalPriceElement = document.querySelector('#total-price span');

				const showtimePrice = document.getElementById('price').getAttribute('data-price');

				var activeInputs = [];

				function changeColor(input, seatNumber) {

					var purpleRangeStart = 31;
					var purpleRangeEnd = 60;

					//toggle class and put to list
					const seatClass = input.getAttribute('seatClass');

					if (seatClass === 'normal') {
						toggleMultipleClasses(input, 'bg-green-600', 'bg-slate-600');
					} else if (seatClass === 'vip') {
						toggleMultipleClasses(input, 'bg-green-600', 'bg-purple-600');
					}

					//remove inactive seats
					activeInputs = toggleElement(activeInputs, input);

					//calculate price
					const totalPrice = activeInputs.reduce((acc, cur) =>
						acc + cur.getAttribute('data-factor') * showtimePrice, 0);

					totalPriceElement.innerHTML = totalPrice + ' VND';
					listPositionsElement.innerHTML = activeInputs.map(input => input.value).join(', ');

					console.log(activeInputs.map(input => input.getAttribute('data-seat-number')).join(','));
				}

				function setDataConfirmModal() {
					const standardSeats = activeInputs.filter(input => input.getAttribute('seatClass') === 'normal');
					const vipSeats = activeInputs.filter(input => input.getAttribute('seatClass') === 'vip');
					const totalPrice = activeInputs.reduce((acc, cur) =>
						acc + cur.getAttribute('data-factor') * showtimePrice, 0);

					document.getElementById('modalStandardSeats').innerHTML = standardSeats.map(input => input.value).join('-');
					document.getElementById('modalVipSeats').innerHTML = vipSeats.map(input => input.value).join('-');

					const standardPrice = standardSeats.reduce((acc, cur) =>
						acc + cur.getAttribute('data-factor') * showtimePrice, 0);
					const vipPrice = vipSeats.reduce((acc, cur) =>
						acc + cur.getAttribute('data-factor') * showtimePrice, 0);

					document.getElementById('modalStandardPrice').innerHTML = standardPrice + ' VND';
					document.getElementById('modalVipPrice').innerHTML = vipPrice + ' VND';
					document.getElementById('modal-total-price').innerHTML = totalPrice + ' VND';

				}

			</script>

			<script src="<%=root%>/tailwind/flowbite.min.js"></script>
			<script src="<%=root%>/assets/js/aos.js"></script>

			<script>
				AOS.init();
			</script>

			</body>

			</html>