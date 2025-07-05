# Student Result Management System

A web-based application that allows college staff (admin) to manage student details, course information, and results. Students can log in using their Register Number to view their academic performance, including GPA.

# Features:

## Admin (Staff):
- Add new student details.
- Add course details for up to **10 semesters**.
- Enter and update student marks based on register number.
- View and manage all student records and results.

## Student:
- Log in using only their **Register Number**.
- View personal details, semester-wise subjects, grades, and **calculated GPA**.
- Clean and organized result display.

# Technologies Used:
- **Java (JSP & Servlet)** – Backend and frontend logic.
- **MySQL** – Database to store student, course, and marks data.
- **JDBC** – Java Database Connectivity to communicate with MySQL.
- **Apache Tomcat Server (v10.1)** – Used to deploy and run the application.
- **HTML/CSS** – Frontend interface.

# Project Structure:
```
StudentResultManagementSystem/
│
├── src/main/java/
│   └── (default package)
│ 	  └── AddCoursesServlet.java
│ 	  └── AddStudentServlet.java
│ 	  └── AdminLoginServlet.java
│ 	  └── DeleteStudentServlet.java
│ 	  └── EditStudentServlet.java
│ 	  └── InsertResultServlet.java
│ 	  └── LogoutServlet.java
│ 	  └── StudentLoginServlet.java
│ 	  └── StudentResultServlet.java
│   └── DB
│ 	  └── DBUtil.java
│
├── WebContent
│	  └── images
│ 	  └── all images
│	  └── add-courses.jsp
│	  └── add-student.jsp
│	  └── admin-dashboard.jsp
│	  └── admin-login.jsp
│	  └── all-student-results.jsp
│	  └── course-details.jsp
│	  └── course-error.jsp
│  	 └── delete-student.jsp
│	  └── edit-student.jsp
│	  └── error.jsp
│	  └── error1.jsp
│	  └── error2.jsp
│	  └── index.jsp
│	  └── insert-result.jsp
│  	 └── logout.jsp
│	  └── logout-confirmation.jsp
│	  └── logout-confirmation-student.jsp
│	  └── logout-handler.jsp
│	  └── rank.jsp
│	  └── register-students.jsp
│	  └── student-login.jsp
└──	 └── student-results.jsp

```

# Database Tables(MySQL):

### Database Name: `student_result_db`

### 1. `users` : Stores admin login details.

### 2. `students` : Stores student registration and academic info.

### 3. `semesterX_subjects` : Stores the subjects of each semester (X = 1 to 10).

_Note: A separate table exists for each semester such as `semester1_subjects`, `semester2_subjects`, etc._

### 4. `semesterX_result` : Stores the marks obtained by students per semester (X = 1 to 10).

_Note: Subjects and fields vary per semester. These are just examples for `semester1_result`._

### 5. `gpa_results` : Stores GPA results and converted percentage for student ranking.

## Relationships:
- `register_number` is the **linking key** across `students`, `semesterX_result`, and `gpa_results`.
- `semesterX_subjects` and `semesterX_result` are designed to be **semester-specific** for modular data handling.



