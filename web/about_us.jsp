
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobJunction - About us</title>
</head>
<body>
    <header>

            <jsp:scriptlet>
                String email = (String) session.getAttribute("email_id");
                if (!"".equals(email) && email != null) {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
            } else {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>

        </header>

    <main>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="about-us">
                    <br><br>
                    <h1>JobJunction</h1>
                    <p class="job-junction-about-us">Introducing JobJunction, the culmination of my singular vision and tireless efforts. As the sole architect of this platform, I've poured my heart into creating a space where your career ambitions are met with precision. JobJunction is more than a portal; it's a testament to my commitment, offering you tailored roles matching your passions and securing optimal remuneration. Embark on this journey crafted by my hands, and let's navigate a future brimming with professional success, together.</p>
                    <br><br>
                    <h2>Our Mission</h2>
                    <div class="row" style="text-align: left;">
                        <div class="col-md-7">
                            <p class="about-us-para">To revolutionize the job search experience by putting passion at the forefront. We believe that a job should be more than a paycheck—it should be a fulfilling journey that inspires growth and purpose.</p>
                        </div>
                        <div class="col-md-5">
                            <img src="images/our_mission_image.gif"/>
                        </div>
                    </div>
                    <br><br>
                    <h2>Our Values</h2>
                    <div class="row" style="text-align: left;">
                        <div class="col-md-12">
                            <p class="about-us-para"><span style="font-weight: bolder;">&#x25CF; Passion : </span>We're driven by the passion to help individuals find careers they love.</p>
                            <p class="about-us-para"><span style="font-weight: bolder;">&#x25CF; Innovation : </span>We're constantly innovating to make the job search process smarter and more effective.</p>
                            <p class="about-us-para"><span style="font-weight: bolder;">&#x25CF; Empowerment : </span>We empower job seekers with the tools and insights to negotiate the best possible salary.</p>
                            <p class="about-us-para"><span style="font-weight: bolder;">&#x25CF; Individuality : </span>We celebrate diversity and recognize that every career path is unique.</p>
                        </div>
                    </div>
                    <br><br>
                    <h2>Why Choose JobJunction</h2>
                    <div class="row" style="text-align: left;">
                        <div class="col-md-12">
                            <p class="about-us-para"><span style="font-weight: bolder;">Personalization : </span>Our advanced algorithms tailor job recommendations to your interests and aspirations.</p>
                            <p class="about-us-para"><span style="font-weight: bolder;">Salary Advocacy : </span>We're not just about finding jobs; we're about ensuring you're well-compensated.</p>
                            <p class="about-us-para"><span style="font-weight: bolder;">Simplicity : </span> Our user-friendly interface makes job searching intuitive and hassle-free.</p>
                            <p class="about-us-para"><span style="font-weight: bolder;">Passion-Driven : </span>We understand that a fulfilling career is born from passion, not just qualifications.</p>
                        </div>
                    </div>
                    <br><br>
                    <h2 class="about-us-last-heading">Join us in reshaping the way you approach your career journey. With JobJunction, your dream job is just a click away.</h2>
                    <br>
                    <a href="search_jobs.jsp" class="btn btn-primary">See Jobs</a>
                    <br><br><br>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </main>

    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</body>
</html>

