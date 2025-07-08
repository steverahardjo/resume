#import "@preview/basic-resume:0.2.8": *

#let name = "Steve Jevon Rahardjo"
#let location = "Subang Jaya, Selangor"
#let email = "steve.jevon.r@gmail.com"
#let github = "github.com/steverahardjo"
#let linkedin = "linkedin.com/in/steve-jevon-rahardjo-7a53332b7"
#let phone = "+601136674969"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  phone: phone,
  font:"New Computer Modern",
  paper:"a4",
  author-position: center,
  personal-info-position: center,
  font-size: 11pt,
)

== Education

#edu(
  institution: "Monash University Malaysia",
  location: "Subang Jaya, Selangor",
  degree: "bachelor of Computer Science specialization Data Science",
  dates: dates-helper(start-date:"Feb 2021", end-date:"Nov 2025"))

  - Relevant Coursework: Data Structure and Algorithm, Data Management and Modelling, Computation Theory, Data Analytics, Object-Oriented Programming, Big Data Processing, Discrete Mathematics, Calculus
#edu(
institution: "SMA Kolese Loyola",
dates: "2020",
degree: "High School Diploma in Natural Science",
location: "Semarang, Jawa Tengah"
)

== Work Experience
#work(
  title: "Data Analyst Trainee in CDP Team",
  location: "Puchong Jaya, Selangor",
  company: "SynergyXYZ",
  dates: dates-helper(start-date: "Nov 2024", end-date: "Feb 2025")
)
- Research Customer Data Platforms vendors, document and evaluate their offerings
- Formulate CDP offerings for prospective client and compile a proposal deck on it
- Compile technical documents surround a CDP tool
- Plan overall directions of CDP team with supervisors.
- Gained experience in uzing Google Ads

#work(
  title : "Website Admin",
  company: "PPI Monash Malaysia",
  dates: dates-helper(end-date:"June 2025", start-date:"July 2024"),
  location: "Subang Jaya, Selangor",
)
- Doing total revamp of PPI Eunoia Wordpress website
- Plan overall content & format direction of website
- Publishing writtten and video content on the PPI Eunoia Website
- Assisting in PPI Monash Event program, beyond web administration

== Heading: Projects

=== Multi-purpose Form  #sub[Node.js, PostgreSQL, TypeScript, HTML, Tailwind CSS]

- Developing a full-stack application to gather data for PPI Eunoia, custom-built for the organization.
- Creating front-end designs and reusable HTML templates.
- Researching and implementing a suitable API for the problem case.
- Developing back-end triggers integrated with front-end functionality.
- Adding production-ready security features and deploying via VPS.
