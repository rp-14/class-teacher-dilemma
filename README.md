

```markdown
# Class Teacher Dilemma

This is a School Management System built with Ruby on Rails.

## Prerequisites

Before you start, make sure you have the following installed on your machine:

- Ruby 3.1.2
- Rails 7.1.2
- Git

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/rp-14/class-teacher-dilemma.git
   ```

2. Navigate to the project directory:

   ```bash
   cd class-teacher-dilemma
   ```

3. Install gems:

   ```bash
   bundle install
   ```

4. Run migrations:

   ```bash
   rails db:migrate
   ```

5. Seed the database with dummy data:

   ```bash
   rails db:seed
   ```

## Usage

To start the Rails server, run:

```bash
rails s -p 3000
```

Replace `3000` with the desired port.

### Routes



#### Scorecard-related Routes:

- Scorecard of all students: http://localhost:3000/api/scorecards

#### Grade Report-related Routes:

- Grade report of all students: http://localhost:3000/api/grade_reports

#### Student-related Routes:

- Index of all students: http://localhost:3000/students
- Show details of a specific student: http://localhost:3000/students/:id
- Form to create a new student: http://localhost:3000/students/new
- Create a new student: POST to http://localhost:3000/students
- Form to edit a specific student: http://localhost:3000/students/:id/edit
- Update a specific student: PATCH or PUT to http://localhost:3000/students/:id
- Delete a specific student: DELETE to http://localhost:3000/students/:id

```

