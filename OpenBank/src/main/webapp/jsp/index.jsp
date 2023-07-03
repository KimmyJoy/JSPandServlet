<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>은행 사이트</title>
<meta content="" name="description">
<meta content="" name="keywords">
 <!-- Favicons -->
<link href="${ pageContext.request.contextPath }/jsp/assets/img/favicon.png" rel="icon">
<link href="${ pageContext.request.contextPath }/jsp/assets/img/apple-touch-icon.png" rel="apple-touch-icon">



<!-- Vendor CSS Files -->
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${ pageContext.request.contextPath }/jsp/assets/css/style.css" rel="stylesheet">
 
<!-- =======================================================
  * Template Name: Vesperr
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
<header id="header" class="fixed-top d-flex align-items-center">
<jsp:include page="top_menu.jsp"></jsp:include>
 </header>
	<!-- ======= Testimonials Section ======= -->
	<div class="testimonials-container">
		<section id="testimonials" class="testimonials section-bg">
			<div class="container">
<!-- 
				<div class="section-title" data-aos="fade-up">
					<h2>Testimonials</h2>
					<p>Magnam dolores commodi suscipit eum quidem consectetur velit</p>
				</div> -->

				<div class="testimonials-slider swiper" data-aos="fade-up"
					data-aos-delay="100">
					<div class="swiper-wrapper">


						<div class="swiper-slide" >
							<div class="testimonial-wrap">
								<div class="testimonial-item" style="background-image:url('${ pageContext.request.contextPath }/jsp/assets/img/testimonials/first.svg')">
									<%-- <img src="${ pageContext.request.contextPath }/jsp/assets/img/testimonials/testimonials-1.jpg"
										class="testimonial-img" alt="">
									<h3>Saul Goodman</h3>
									<h4>Ceo &amp; Founder</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Proin
										iaculis purus consequat sem cure digni ssim donec porttitora
										entum suscipit rhoncus. Accusantium quam, ultricies eget id,
										aliquam eget nibh et. Maecen aliquam, risus at semper. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p> --%>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item"  style="background-image:url('${ pageContext.request.contextPath }/jsp/assets/img/testimonials/saving.svg')">
									<!-- <h3>Sara Wilsson</h3>
									<h4>Designer</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export
										tempor illum tamen malis malis eram quae irure esse labore
										quem cillum quid cillum eram malis quorum velit fore eram
										velit sunt aliqua noster fugiat irure amet legam anim culpa. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p> -->
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img src="${ pageContext.request.contextPath }/jsp/assets/img/testimonials/testimonials-3.jpg"
										class="testimonial-img" alt="">
									<h3>Jena Karlis</h3>
									<h4>Store Owner</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Enim
										nisi quem export duis labore cillum quae magna enim sint
										quorum nulla quem veniam duis minim tempor labore quem eram
										duis noster aute amet eram fore quis sint minim. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img src="${ pageContext.request.contextPath }/jsp/assets/img/testimonials/testimonials-4.jpg"
										class="testimonial-img" alt="">
									<h3>Matt Brandon</h3>
									<h4>Freelancer</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Fugiat
										enim eram quae cillum dolore dolor amet nulla culpa multos
										export minim fugiat minim velit minim dolor enim duis veniam
										ipsum anim magna sunt elit fore quem dolore labore illum
										veniam. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img src="${ pageContext.request.contextPath }/jsp/assets/img/testimonials/testimonials-5.jpg"
										class="testimonial-img" alt="">
									<h3>John Larson</h3>
									<h4>Entrepreneur</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Quis
										quorum aliqua sint quem legam fore sunt eram irure aliqua
										veniam tempor noster veniam enim culpa labore duis sunt culpa
										nulla illum cillum fugiat legam esse veniam culpa fore nisi
										cillum quid. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->
	</div>


		<!-- 서치바 섹션 -->
		<section id="clients" class="clients clients">
			<div class="container">
		<jsp:include page="searchbar.jsp"></jsp:include>
			</div>
		</section>
	<main id="main">
		
		<!-- ======= Pricing Section ======= -->
		<section id="pricing" class="pricing">
			<div class="container">

				<div class="section-title">
					<h2>금융 상품</h2>
					<p>Sit sint consectetur velit nemo qui impedit suscipit alias
						ea</p>
				</div>

				<div class="row">

					<div class="col-lg-4 col-md-6">
						<div class="box" data-aos="zoom-in-right" data-aos-delay="200">
							<h3>Free</h3>
							<h4>
								<sup>$</sup>0<span> / month</span>
							</h4>
							<ul>
								<li>Aida dere</li>
								<li>Nec feugiat nisl</li>
								<li>Nulla at volutpat dola</li>
								<li class="na">Pharetra massa</li>
								<li class="na">Massa ultricies mi</li>
							</ul>
							<div class="btn-wrap">
								<a href="#" class="btn-buy">Buy Now</a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mt-4 mt-md-0">
						<div class="box recommended" data-aos="zoom-in"
							data-aos-delay="100">
							<h3>Business</h3>
							<h4>
								<sup>$</sup>19<span> / month</span>
							</h4>
							<ul>
								<li>Aida dere</li>
								<li>Nec feugiat nisl</li>
								<li>Nulla at volutpat dola</li>
								<li>Pharetra massa</li>
								<li class="na">Massa ultricies mi</li>
							</ul>
							<div class="btn-wrap">
								<a href="#" class="btn-buy">Buy Now</a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
						<div class="box" data-aos="zoom-in-left" data-aos-delay="200">
							<h3>Developer</h3>
							<h4>
								<sup>$</sup>29<span> / month</span>
							</h4>
							<ul>
								<li>Aida dere</li>
								<li>Nec feugiat nisl</li>
								<li>Nulla at volutpat dola</li>
								<li>Pharetra massa</li>
								<li>Massa ultricies mi</li>
							</ul>
							<div class="btn-wrap">
								<a href="#" class="btn-buy">Buy Now</a>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Pricing Section -->

		<!-- ======= About Us Section ======= -->
		<section id="about" class="about">
			<div class="container">

				<div class="section-title" data-aos="fade-up">
					<h2>About Us</h2>
				</div>

				<div class="row content">
					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="150">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
						<ul>
							<li><i class="ri-check-double-line"></i> Ullamco laboris
								nisi ut aliquip ex ea commodo consequat</li>
							<li><i class="ri-check-double-line"></i> Duis aute irure
								dolor in reprehenderit in voluptate velit</li>
							<li><i class="ri-check-double-line"></i> Ullamco laboris
								nisi ut aliquip ex ea commodo consequat</li>
						</ul>
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0" data-aos="fade-up"
						data-aos-delay="300">
						<p>Ullamco laboris nisi ut aliquip ex ea commodo consequat.
							Duis aute irure dolor in reprehenderit in voluptate velit esse
							cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
						<a href="#" class="btn-learn-more">Learn More</a>
					</div>
				</div>

			</div>
		</section>
		<!-- End About Us Section -->

		<!-- ======= Counts Section ======= -->
		<section id="counts" class="counts">
			<div class="container">

				<div class="row">
					<div
						class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-xl-start"
						data-aos="fade-right" data-aos-delay="150">
						<img src="${ pageContext.request.contextPath }/jsp/assets/img/counts-img.svg" alt="" class="img-fluid">
					</div>

					<div class="col-xl-7 d-flex align-items-stretch pt-4 pt-xl-0"
						data-aos="fade-left" data-aos-delay="300">
						<div class="content d-flex flex-column justify-content-center">
							<div class="row">
								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-emoji-smile"></i> <span
											data-purecounter-start="0" data-purecounter-end="65"
											data-purecounter-duration="1" class="purecounter"></span>
										<p>
											<strong>Happy Clients</strong> consequuntur voluptas nostrum
											aliquid ipsam architecto ut.
										</p>
									</div>
								</div>

								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-journal-richtext"></i> <span
											data-purecounter-start="0" data-purecounter-end="85"
											data-purecounter-duration="1" class="purecounter"></span>
										<p>
											<strong>Projects</strong> adipisci atque cum quia aspernatur
											totam laudantium et quia dere tan
										</p>
									</div>
								</div>

								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-clock"></i> <span data-purecounter-start="0"
											data-purecounter-end="18" data-purecounter-duration="1"
											class="purecounter"></span>
										<p>
											<strong>Years of experience</strong> aut commodi quaerat modi
											aliquam nam ducimus aut voluptate non vel
										</p>
									</div>
								</div>

								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-award"></i> <span data-purecounter-start="0"
											data-purecounter-end="15" data-purecounter-duration="1"
											class="purecounter"></span>
										<p>
											<strong>Awards</strong> rerum asperiores dolor alias quo
											reprehenderit eum et nemo pad der
										</p>
									</div>
								</div>
							</div>
						</div>
						<!-- End .content-->
					</div>
				</div>

			</div>
		</section>
		<!-- End Counts Section -->

		<!-- ======= More Services Section ======= -->
		<section id="more-services" class="more-services">
			<div class="container">

				<div class="row">
					<div class="col-md-6 d-flex align-items-stretch">
						<div class="card"
							style='background-image: url("${ pageContext.request.contextPath }/jsp/assets/img/more-services-1.jpg");'
							data-aos="fade-up" data-aos-delay="100">
							<div class="card-body">
								<h5 class="card-title">
									<a href="">Lobira Duno</a>
								</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									elit, sed do eiusmod tempor ut labore et dolore magna aliqua.</p>
								<div class="read-more">
									<a href="#"><i class="bi bi-arrow-right"></i> Read More</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
						<div class="card"
							style='background-image: url("assets/img/more-services-2.jpg");'
							data-aos="fade-up" data-aos-delay="200">
							<div class="card-body">
								<h5 class="card-title">
									<a href="">Limere Radses</a>
								</h5>
								<p class="card-text">Sed ut perspiciatis unde omnis iste
									natus error sit voluptatem doloremque laudantium, totam rem.</p>
								<div class="read-more">
									<a href="#"><i class="bi bi-arrow-right"></i> Read More</a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-6 d-flex align-items-stretch mt-4">
						<div class="card"
							style='background-image: url("assets/img/more-services-3.jpg");'
							data-aos="fade-up" data-aos-delay="100">
							<div class="card-body">
								<h5 class="card-title">
									<a href="">Nive Lodo</a>
								</h5>
								<p class="card-text">Nemo enim ipsam voluptatem quia
									voluptas sit aut odit aut fugit, sed quia magni dolores.</p>
								<div class="read-more">
									<a href="#"><i class="bi bi-arrow-right"></i> Read More</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex align-items-stretch mt-4">
						<div class="card"
							style='background-image: url("assets/img/more-services-4.jpg");'
							data-aos="fade-up" data-aos-delay="200">
							<div class="card-body">
								<h5 class="card-title">
									<a href="">Pale Treda</a>
								</h5>
								<p class="card-text">Nostrum eum sed et autem dolorum
									perspiciatis. Magni porro quisquam laudantium voluptatem.</p>
								<div class="read-more">
									<a href="#"><i class="bi bi-arrow-right"></i> Read More</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End More Services Section -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container">

				<div class="section-title" data-aos="fade-up">
					<h2>Contact Us</h2>
				</div>

				<div class="row">

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="100">
						<div class="contact-about">
							<h3>Vesperr</h3>
							<p>Cras fermentum odio eu feugiat. Justo eget magna fermentum
								iaculis eu non diam phasellus. Scelerisque felis imperdiet proin
								fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
							<div class="social-links">
								<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
									href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
									href="#" class="instagram"><i class="bi bi-instagram"></i></a>
								<a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 mt-4 mt-md-0" data-aos="fade-up"
						data-aos-delay="200">
						<div class="info">
							<div>
								<i class="ri-map-pin-line"></i>
								<p>
									A108 Adam Street<br>New York, NY 535022
								</p>
							</div>

							<div>
								<i class="ri-mail-send-line"></i>
								<p>info@example.com</p>
							</div>

							<div>
								<i class="ri-phone-line"></i>
								<p>+1 5589 55488 55s</p>
							</div>

						</div>
					</div>

					<div class="co
					l-lg-5 col-md-12" data-aos="fade-up"
						data-aos-delay="300">
						<form action="forms/contact.php" method="post" role="form"
							class="php-email-form">
							<div class="form-group">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="Your Name" required>
							</div>
							<div class="form-group">
								<input type="email" class="form-control" name="email" id="email"
									placeholder="Your Email" required>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="Subject" required>
							</div>
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5"
									placeholder="Message" required></textarea>
							</div>
							<div class="my-3">
								<div class="loading">Loading</div>
								<div class="error-message"></div>
								<div class="sent-message">Your message has been sent.
									Thank you!</div>
							</div>
							<div class="text-center">
								<button type="submit">Send Message</button>
							</div>
						</form>
					</div>

			
				</div>

			</div>
		</section>
		<!-- End Contact Section -->
	</main>
	<!-- End #main -->
	
	
	<!-- ======= Footer ======= -->
	<footer>
	<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
 <!-- Vendor JS Files -->
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/aos/aos.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${ pageContext.request.contextPath }/jsp/assets/js/main.js"></script>

</body>
</html>