<!DOCTYPE html>
<html>
<head>
    <title>Add Courses</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            background: #f9f9f9;
        }
        .form-box {
            width: 700px;
            margin: 50px auto;
            padding: 20px 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .form-box input[type="text"],
        .form-box input[type="number"],
        .form-box select {
            padding: 8px 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 15px;
        }
        .form-box input[type="text"],
        .form-box select {
            width: 100%;
        }
        .subject-row {
            display: flex;
            gap: 10px;
            margin: 8px 0;
            align-items: center;
        }
        .subject-row input[type="text"],
        .subject-row input[type="number"] {
            flex: 1;
        }
        .form-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            background: #28a745;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        .plus-icon {
            background: none;
            border: none;
            color: #28a745;
            font-size: 24px;
            cursor: pointer;
            padding: 0;
            margin-left: 5px;
            line-height: 1;
        }
        .add-button-container {
            text-align: center;
            margin-top: -10px;
            margin-bottom: 10px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
    </style>
    <script>
        function addTheorySubject() {
            const container = document.getElementById('theorySubjects');

            const row = document.createElement('div');
            row.className = 'subject-row';

            const codeInput = document.createElement('input');
            codeInput.type = 'text';
            codeInput.name = 'theoryCourseCodes';
            codeInput.placeholder = 'Course Code';
            codeInput.required = true;

            const subjectInput = document.createElement('input');
            subjectInput.type = 'text';
            subjectInput.name = 'theorySubjects';
            subjectInput.placeholder = 'Course Name';
            subjectInput.required = true;

            const creditsInput = document.createElement('input');
            creditsInput.type = 'number';
            creditsInput.name = 'theoryCredits';
            creditsInput.placeholder = 'Credits';
            creditsInput.min = 0;
            creditsInput.step = "0.5";
            creditsInput.required = true;

            row.appendChild(codeInput);
            row.appendChild(subjectInput);
            row.appendChild(creditsInput);

            container.insertBefore(row, container.lastElementChild);
        }

        function addLabSubject() {
            const container = document.getElementById('labSubjects');

            const row = document.createElement('div');
            row.className = 'subject-row';

            const codeInput = document.createElement('input');
            codeInput.type = 'text';
            codeInput.name = 'labCourseCodes';
            codeInput.placeholder = 'Course Code';
            codeInput.required = true;

            const subjectInput = document.createElement('input');
            subjectInput.type = 'text';
            subjectInput.name = 'labSubjects';
            subjectInput.placeholder = 'Course Name';
            subjectInput.required = true;

            const creditsInput = document.createElement('input');
            creditsInput.type = 'number';
            creditsInput.name = 'labCredits';
            creditsInput.placeholder = 'Credits';
            creditsInput.min = 0;
            creditsInput.step = "1";
            creditsInput.required = true;

            row.appendChild(codeInput);
            row.appendChild(subjectInput);
            row.appendChild(creditsInput);

            container.insertBefore(row, container.lastElementChild);
        }
    </script>
</head>
<body>
    <div class="form-box">
        <form action="AddCoursesServlet" method="post">
            <label for="year">Select Year:</label>
            <select id="year" name="year" required>
                <option value="">Select Year</option>
                <option value="1">1st Year</option>
                <option value="2">2nd Year</option>
                <option value="3">3rd Year</option>
                <option value="4">4th Year</option>
                <option value="5">5th Year</option>
            </select>

            <label for="semester">Select Semester:</label>
            <select id="semester" name="semester" required>
                <option value="">Select Semester</option>
                <option value="1">1 Semester</option>
                <option value="2">2 Semester</option>
                <option value="3">3 Semester</option>
                <option value="4">4 Semester</option>
                <option value="5">5 Semester</option>
                <option value="6">6 Semester</option>
                <option value="7">7 Semester</option>
                <option value="8">8 Semester</option>
                <option value="9">9 Semester</option>
                <option value="10">10 Semester</option>
            </select>

            <label>Theory Subjects:</label>
            <div id="theorySubjects">
                <div class="subject-row">
                    <input type="text" name="theoryCourseCodes" placeholder="Course Code" required>
                    <input type="text" name="theorySubjects" placeholder="Course Name" required>
                    <input type="number" name="theoryCredits" placeholder="Credits" min="0" step="1" required>
                </div>
                <div class="add-button-container">
                    <button type="button" class="plus-icon" onclick="addTheorySubject()">&#43;</button>
                </div>
            </div>

            <label>Lab Subjects:</label>
            <div id="labSubjects">
                <div class="subject-row">
                    <input type="text" name="labCourseCodes" placeholder="Course Code" required>
                    <input type="text" name="labSubjects" placeholder="Course Name" required>
                    <input type="number" name="labCredits" placeholder="Credits" min="0" step="1" required>
                </div>
                <div class="add-button-container">
                    <button type="button" class="plus-icon" onclick="addLabSubject()">&#43;</button>
                </div>
            </div>

            <input type="submit" value="Save Subjects">
        </form>
    </div>
</body>
</html>
