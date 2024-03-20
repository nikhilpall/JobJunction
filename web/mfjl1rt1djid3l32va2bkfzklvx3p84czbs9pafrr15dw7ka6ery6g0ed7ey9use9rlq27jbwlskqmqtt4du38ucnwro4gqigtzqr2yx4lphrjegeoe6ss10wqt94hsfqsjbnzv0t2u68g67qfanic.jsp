
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Only for admin otherwise legal action</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
        <style>
            textarea,input{
                width: 100%;
                padding: 10px 20px;
            }
        </style>
    </head>
    <body>
        <header><jsp:include page="header.jsp"></jsp:include></header>
            <main>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <form method="post" action="add_job">
                                <table class="table">
                                    <tr>
                                        <td><b>Job Title :</b></td>
                                        <td><textarea id="id" name="job_title" rows="4" cols="10" placeholder="Job Title"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><b>Job Posted On :</b></td>
                                        <td><input type="text" name="job_posted_on" placeholder="24/08/2023"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Job Description :</b></td>
                                        <td><textarea id="id" name="job_description" rows="4" cols="10" placeholder="Job Description"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><b>Company Name :</b></td>
                                        <td><input type="text" name="company_name" placeholder="Wipro"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Job Role :</b></td>
                                        <td><input type="text" name="job_role" placeholder="System Engineer"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Qualifications  :</b></td>
                                        <td><input type="text" name="qualification" placeholder="Any Graduate"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Branch :</b></td>
                                        <td><input type="text" name="branch" placeholder="Any Branches"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Batch :</b></td>
                                        <td><input type="text" name="batch" placeholder="2017, 2018, 2019, 2020, 2021, 2022, 2023 & 2024"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Salary :</b></td>
                                        <td><input type="text" name="salary" placeholder="INR 3 LPA*"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Experience :</b></td>
                                        <td><input type="text" name="experience" placeholder="Fresher"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Location :</b></td>
                                        <td><input type="text" name="location" placeholder="Mumbai"/></td>
                                    </tr>
                                    <tr>
                                        <td><b>Responsibilities :</b></td>
                                        <td><textarea id="id" name="responsibilities" rows="4" cols="10" placeholder="Troubleshoot Windows, Outlook, Teams, and Citrix. VDI, VPN, Security app, etc. over remote support. Answer incoming calls and respond to customers’ emails in a timely manner. Manage and resolve customer complaints. Identify and escalate issues to supervisors as and when needed. Provide product and service information to customers. Research required information using available resources and offer Solutions to customers. Research, identify, and resolve customer complaints using applicable software. Route calls and tickets to appropriate resources and Domains that can best support the user, Document all call information according to standard operating procedures. Recognize, document, and alert the management team of trends in customer calls. Create SOPs for new Issues and resolution given. Complete call logs and reports."></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><b>Selection Process :</b></td>
                                        <td><textarea id="id" name="selection_process" rows="4" cols="10" placeholder="Online Application Submission Online Test- Aptitude Test, Technical Test Interview Selection (Wipro Off Campus Drive 2023)"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><b>About Company :</b></td>
                                        <td><textarea id="id" name="about_company" rows="4" cols="10" placeholder="Wipro Ltd was incorporated in the year 1945 at Karnataka by Azim H Premji who is promoter and chairman of the company. The company started as an edible oil producer and then transformed itself into leading player in Fast Moving Consumer Goods and IT services & Products business."></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><b>Apply Link :</b></td>
                                        <td><input type="text" name="apply_link" required="" placeholder="https://unstop.com/jobs/system-engineer-wipro-limited-741506?utm_source=Prepflix&utm_medium=Affiliates&utm_campaign=Wipro24082023&ref=Prepflix"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><br></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;"><input type="submit" value="Add Job"/></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </div>
            </main>
            <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </body>
</html>
