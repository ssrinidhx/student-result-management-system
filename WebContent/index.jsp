<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Coimbatore Institute of Technology</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: Calibri, sans-serif;
      scroll-behavior: smooth;
    }
    .hero {
	  position: relative;
	  height: 100vh;
	  color: white;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  text-align: center;
	  overflow: hidden;
	}
	.hero::before {
	  content: "";
	  position: absolute;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background: url('images/cit.jpg') no-repeat center center fixed;
	  background-size: cover;
	  filter: blur(5px); 
	  z-index: 1;
	}
	.hero > * {
	  position: relative;
	  z-index: 2; 
	}
    .hero-overlay {
      background-color: rgba(0, 0, 0, 0.6);
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      z-index: 1;
    }
    .hero-content {
      z-index: 2;
      position: relative;
    }
    .hero img {
      max-width: 150px;
      margin-bottom: 20px;
    }
    .section {
      padding: 60px 20px;
    }
    .section:nth-child(even) {
      background-color: #f8f9fa;
    }
    .section h2 {
      margin-bottom: 22px;
    }
    footer {
      background-color: #212529;
      color: white;
      padding: 40px 20px;
    }
    footer a {
      color: #ffc107;
      text-decoration: none;
    }
    footer a:hover {
      text-decoration: underline;
    }
    .navbar-brand img {
      max-height: 40px;
      margin-right: 10px;
    }
    .nav-link {
      color: white !important;
    }

    .nav-link:hover {
      color: #ffc107 !important;
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
	  <div class="container-fluid d-flex justify-content-between align-items-center">
	    <div class="d-flex align-items-center">
	      <img src="images/Coimbatore_Institute_of_Technology_logo.png" alt="CIT Logo" style="height: 40px; width: auto; margin-right: 10px;">
	      <span class="navbar-brand mb-0 h5">Coimbatore Institute of Technology</span>
	    </div>
	    <div>
	      <ul class="navbar-nav flex-row" style="font-family: Calibri, sans-serif; line-height: 1.8;">
	        <li class="nav-item me-3"><a class="nav-link" href="#about">About</a></li>
	        <li class="nav-item me-3"><a class="nav-link" href="admin-login.jsp">Admin</a></li>
	        <li class="nav-item"><a class="nav-link" href="student-login.jsp">Student</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
  <section class="hero" id="home" style="font-family: Calibri, sans-serif; line-height: 1.8;">
    <div class="hero-overlay"></div>
    <div class="hero-content">
      <h1 class="display-4 fw-bold">Coimbatore Institute of Technology</h1>
      <p class="lead">Maintaining Global Standards and Excellence</p>
    </div>
  </section>
  <section class="section text-center" id="about" style="font-family: Calibri, sans-serif; line-height: 1.8;">
    <div class="container">
      <h2><b>About Us</b></h2>
      <p>CIT offers 8 Under Graduate Academic Programmes, 6 Post Graduate Academic Programmes, 4 Five Year Integrated M.Sc. Programmes in addition to Ph.D. Research Programmes. As part of the invaluable service rendered to the society by V. Rangaswamy Educational Trust, the CIT Sandwich Polytechnic College was started in 1961. Presently, 8 Engineering Diploma Programmes are offered by the polytechnic in various engineering disciplines. The Institute boasts of strong academic-industrial interaction and a high quality of research and consultancy. CIT, managed by a pedigreed lineage for the past 60 years, enjoys national repute. The Institute has the services of competent qualified faculty, and visionary management to enhance the quality of education at all levels and maintain its position in emerging global scenario.</p>
    </div>
  </section>
  <section class="section text-center" id="departments" style="font-family: Calibri, sans-serif; line-height: 1.8">
    <div class="container">
      <h2><b>Departments</b></h2>
      <div class="row">
        <div class="col-md-4">
          <h5>Computer Science</h5>
          <p>Focus on AI, ML, Data Science, Software Development.</p>
        </div>
        <div class="col-md-4">
          <h5>Electrical Engineering</h5>
          <p>Smart grids, electronics, and sustainable tech.</p>
        </div>
        <div class="col-md-4">
          <h5>Mechanical Engineering</h5>
          <p>Core mechanical systems and design innovation.</p>
        </div>
      </div>
    </div>
  </section>
  <section class="section text-center" id="admissions" style="font-family: Calibri, sans-serif; line-height: 1.8;">
	  <div class="container mb-5">
	    <h2 class="mb-4"><b>Our Mission</b></h2>
	    <p style="margin-bottom: 20px;">The mission of CIT is to "impart high quality education and training to its students to make them World-Class Engineers with a foresight to the changes and problems, and pioneers to offer innovative solutions to benefit the nation and the world at large".</p>
	  </div>
	  <div class="container mb-5">
	    <h2 class="mb-4"><b>Our Vision</b></h2>
	    <p style="margin-bottom: 20px;">The Institute strives to inculcate a sound knowledge in engineering along with realized social responsibilities to enable its students to combat the current and impending challenges faced by our country and to extend their expertise to the global arena.</p>
	  </div>
	  <div class="container">
	    <h2 class="mb-4"><b>Core Values</b></h2>
	    <ul class="text-start" style="max-width: 960px; margin: 0 auto; padding-left: 1rem;">
	      <li class="mb-3"><strong>Aiding Social Advancements through Technologies:</strong> We strongly believe that technologies are the instruments par excellence in promoting individuals and society. Thus, the curriculum and syllabi offered, along with effective teaching-learning methodologies at CIT, enable holistic student progress with a commitment to uplift society.</li>
	      <li class="mb-3"><strong>Employability for Students:</strong> Understanding various global job avenues, the institution continuously and sincerely strives to mold students into qualified manpower by imparting deeper knowledge, critical skills, and transferable competencies.</li>
	      <li class="mb-3"><strong>Quality Education:</strong> The institution ensures quality education through excellent teaching, modern infrastructure, research and development, up-to-date syllabi, strong industry interaction, and a productive academic environment supported by co-curricular and extracurricular activities.</li>
	      <li class="mb-3"><strong>Appreciation of Intellectual Excellence:</strong> CIT proudly recognizes the intellectual achievements of both students and faculty through numerous endowment awards and formal acknowledgments on various occasions.</li>
	      <li class="mb-3"><strong>Transparency, Accountability, and Empathy:</strong> These core values are deeply embedded in the administrative and academic culture of CIT.</li>
	    </ul>
	  </div>
	</section>
  <footer class="text-center">
    <div class="container" style="font-family: Calibri, sans-serif; line-height: 1.8;">
      <p class="mb-2">&copy; 2025 Coimbatore Institute of Technology. All rights reserved.</p>
      <div>
        <a href="#">Privacy Policy</a> | 
        <a href="#">Contact</a> | 
        <a href="#">Careers</a>
      </div>
    </div>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
