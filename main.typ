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
- Plan and executing total revamp of PPI Eunoia Wordpress website
- Publishing writtten and video content on the PPI Eunoia Website
- Assisting in PPI Monash Event program, beyond web administration

== Heading: Projects

=== Patent Analyzer  #sub[Python, Django, OpenAI, TogetherAI, QdrantDB, Selenium]

- Research and Developing a decoder-based patent analyzer on TRIZ principles as a part of a Final Year Project
- Develop and maintain proprietary text extraction module from PDF using Selenium and BS4
- Develop and implement a novel CoT and prompt injection to do multi-label classification using a decoder model
- Implement fact-grounded QA system using hybrid search RAG through QdrantDB
- Implement a Django RESTful API and containerize in docker to ensure ease of deployment
- Iterate and improve on backend bugs

=== Expense Tracker #sub[Python, LLM, Agent, MCP, AWS, Telegram API, Matplotlib]

- Plan and design a expense tracker and retriever powered by LLM model
- Implement from scratch LLM agentic modules such as Agentic paradigms, Model proxy, Tooling, MCP servers, and usage loggings
- Implement a upsert and retriever system through a natural language input into a Database through agentic tooling
- Implement a retrieved output displayed through a tabular or graph form using matplotlib
- Host backend app in AWS and connect it to a Telegram chatbot interfacr

=== File Manipulation CLI tool #sub[Go, Bubbletea]
- Plan development roadmap and tools I need
- Implement an autocomplete UI from Bubbletea to autocomplete file-related CLI command such as cd, ls with folder name

=== Big Data File Processing of IoT Data #sub[PySpark, Kafka, Zookeeper, MongoDB, Matplotlib]
- Plan and compile data warehousing design for our project (variables, collection relationship, Upsert pattern, Tradeoff, Data governance policy)
- Create collection of complementary datasets we need into mongodb Database
- Produce and consume messages through a Pub/Sub server in Kafka of 3 different sources
- Use PySpark to do pre-processing data inside these 3 different streams
- Detect violations through custom functions, atatched to Spark through UDF
- Do a full online join of 3 streams by confugring join through conditionals and Watermarking.
- Save said result from Spark into a MongoDB collection
- Create another stream through mongoDB trigger of saved result to be later process into a dynamic plot
