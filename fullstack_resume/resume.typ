#import "@preview/basic-resume:0.2.9": *
#let name = "Steve Jevon Rahardjo"
#let location = "Semarang, Central Java"
#let email = "steve.jevon.r@gmail.com"
#let github = "github.com/steverahardjo"
#let linkedin = "linkedin.com/in/steve-jevon-rahardjo"
#let website = "sjrah.net"
#let phone = "+6285190651240"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  personal-site: website,
  phone: phone,
  font: "New Computer Modern",
  paper: "a4",
  author-position: center,
  personal-info-position: center,
  font-size: 10pt,
)

== Professional Summary

#text(size: 9.5pt)[Data-oriented software engineer skilled across backend systems, AI/ML pipelines, and full-stack development. Experienced in building RESTful APIs with Go and Python, designing streaming data pipelines with Kafka and PySpark, and integrating LLM-based multi-agent systems using Google ADK and LangChain. Comfortable with end-to-end project delivery — from database design and CI/CD to frontend UI — and driven to ship scalable products with clean engineering.]

== Work Experience

#work(
  title: "Data Analyst Trainee in CDP Team",
  location: "Puchong Jaya, Selangor",
  company: "SynergyXYZ",
  dates: dates-helper(start-date: "Nov 2024", end-date: "Feb 2025")
)
- Evaluated 20+ Customer Data Platform vendors on integration capabilities, features, and pricing for client recommendations.
- Compiled client-facing proposal decks and authored early-version SDK and workflow documentation for internal engineering use.

== Volunteer Experience
#work(
  title: "Website Admin",
  company: "PPI Monash Malaysia",
  dates: dates-helper(end-date: "Nov 2025", start-date: "July 2024"),
  location: "Subang Jaya, Selangor",
)
- Led WordPress revamp project and published written and video content.
- Supported event coordination and digital presence beyond web administration.

== Projects

=== Deneb — Full-Stack Finance App #sub[Go, Python, React, TanStack Router, PostgreSQL, Google ADK, YOLO, Better-Auth]
- Built a full-stack expense tracker with Go REST APIs, React + Shadcn UI, and TanStack Router for modular frontend architecture.
- Implemented email OTP authentication via Better-Auth and designed PostgreSQL schema with versioned API endpoints.
- Integrated a multimodal multi-agent AI system (Google ADK) for receipt scanning, categorization, and financial Q&A via Telegram bot.
- Built a YOLO-based receipt preprocessing pipeline and tracked ML model versions with MLflow.

=== QR Invite — Event QR Invitation System #sub[Go, PostgreSQL, sqlc, JWT, Docker]
- Built a backend event invitation system with QR code generation, participant management, and attendance tracking.
- Designed PostgreSQL schema with sqlc for type-safe, compile-time-checked queries and JWT (HS256) authentication.
- Integrated multi-channel delivery via WhatsApp (Meta Graph API) and email (Resend) with structured logging via Zap.

=== Big Data IoT Stream Processing #sub[PySpark, Kafka, MongoDB, Matplotlib]
- Designed a real-time streaming pipeline with 3 Kafka producers for IoT data ingestion and PySpark for transformation.
- Built custom UDFs for anomaly detection and implemented MongoDB data warehouse with optimized upsert strategies.
- Enabled event-driven visualization using MongoDB change streams and Matplotlib for live monitoring dashboards.

=== GitAegis — CLI Secret Scanner #sub[Go, Cobra, Tree-sitter, Git]
- Built a CLI tool detecting secrets and API keys via Shannon entropy calculation and Tree-sitter AST parsing.
- Implemented configurable scanning via CLI flags and `.toml` configuration with structured JSON output and automated `.gitignore` updates.

=== Granarium — Read-Only GitHub Frontend #sub[Bun, React, TypeScript, Shiki, GitHub API, Docker]
- Built a premium code browser consuming the GitHub REST API with server-proxied calls for repo, file, commit, and pull request views.
- Implemented Shiki-powered syntax highlighting, interactive file trees, side-by-side diff viewers, and commit graph visualization.
- Architected a performant Bun backend with Express-style routing and Dockerized deployment.

== Technical Skills

#text(size: 9.5pt)[
*Languages*: Go, Python, TypeScript, Java, SQL, R \
*Backend & APIs*: REST APIs, PostgreSQL, MongoDB, pgx, sqlc, Authentication (JWT, OTP, bcrypt) \
*AI/ML & Data*: Google ADK, LangChain, LLMs, RAG, YOLO, Scikit-Learn, PyTorch, Pandas, PySpark, NLP \
*Infrastructure*: Docker, Kafka, GitHub Actions, MLflow, Git, Zookeeper \
*Frontend*: React, TanStack Router, Shadcn UI]
== Education

#edu(
  institution: "Monash University Malaysia",
  location: "Subang Jaya, Selangor",
  degree: "Bachelor of Computer Science in Data Science",
  dates: dates-helper(start-date: "Feb 2023", end-date: "Nov 2025"))
  - Relevant Coursework: Big Data Processing, Data Management and Warehousing, Data Analytics, Data Modelling, Data Structure and Algorithm, Object-Oriented Programming, Data Visualization, App Development in Android

#edu(
  institution: "Monash College",
  location: "Subang Jaya, Selangor",
  degree: "Diploma of Higher Education in Information Technology",
  dates: dates-helper(start-date: "Feb 2021", end-date: "Nov 2022"))
