 Cosmetics Management System
A comprehensive system for managing a cosmetics company, including clients, suppliers, stock, sales, and more. Built with FastAPI (backend), React (frontend), and PostgreSQL (database).
Project Structure
cosmetics-management/
├── backend/              # FastAPI backend
├── frontend/             # React frontend
├── database/             # SQL scripts and migrations
├── docs/                 # Documentation
├── docker-compose.yml    # Docker services
├── .gitignore
├── README.md
└── LICENSE

Prerequisites

Python 3.10+
Node.js 18+
PostgreSQL 15+
Docker (optional, for containerized setup)
Visual Studio Code with GitHub Copilot

Setup Instructions

Clone the repository:
git clone <repository-url>
cd cosmetics-management


Set up the database:

Run PostgreSQL locally or via Docker:
docker-compose up -d


Apply the schema:
psql -h localhost -U admin -d cosmetics_management -f database/schema.sql




Set up the backend:
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload


Set up the frontend:
cd frontend
npm install
npm start



Next Steps

Implement CRUD endpoints in backend/app/routes/.
Develop React components in frontend/src/.
Customize the UI with Tailwind CSS in frontend/tailwind.config.js.

License
MIT

