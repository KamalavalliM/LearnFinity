<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp" %>
<script type="text/javascript">
        var totalTime = 15 * 60;  // Set total time (in seconds)

        function startTimer() {
            var countdownElement = document.getElementById("countdown");

            function updateTimer() {
                if (totalTime <= 0) {
                    document.getElementById("quizForm").submit(); // Auto-submit the form
                } else {
                    var minutes = Math.floor(totalTime / 60);
                    var seconds = totalTime % 60;

                    // Update the countdown display
                    countdownElement.innerHTML = minutes + "m " + (seconds < 10 ? "0" : "") + seconds + "s";

                    totalTime--; // Decrease the time
                    setTimeout(updateTimer, 1000); // Call updateTimer again after 1 second
                }
            }
            updateTimer(); // Start the timer
        }

        window.onload = function() {
            startTimer(); // Start the timer when the page loads
        };
    </script>
<body>
<c:if test="${empty sessionScope.login}">
		<jsp:forward page="index.jsp">
			<jsp:param name="msg" value="Your Not Authenticated" />
		</jsp:forward>
</c:if>
<%@include file="header.jsp" %>
<div id="examInstructions">
    <h2>Exam Instructions</h2>
    <p>Welcome to the MCQ Test! Please read the following instructions carefully before starting:<p>
        
        <ul>
        <li><b>Duration:</b> You have <b>15 minutes</b> to complete the test. Please manage your time wisely.</li>
        <li><b>Number of Questions:</b> The test consists of <b>10 multiple-choice questions</b>. Each question has four answer options.</li>
        <li> <b>Selecting Answers:</b><br>
           - To select an answer, click on the radio button next to your choice.<br>
           - You may change your answer before submitting the test.</li>
        <li><b>Submitting the Test:</b><br>
           - Once you have answered all the questions or the time is up, click the <b>Submit</b> button to finish the test.<br>
           - Ensure that you have selected an answer for each question before submitting.</li>
        <li><b>No Extra Time:</b> There will be no additional time granted after the 15 minutes are over, so please keep an eye on the timer.</li>
        <li><b>Resources:</b> You are not allowed to use any external resources (books, notes, or online searches) during the test. Please rely on your knowledge.</li>
        <li><b>Technical Issues:</b> If you experience any technical difficulties, please notify the exam supervisor immediately.</li>
        <li><b>Confidentiality:</b> All questions and answers are confidential. Do not discuss the content of the test with anyone until after it has been completed.</li>
        <li><b>Integrity:</b> Please adhere to the highest standards of academic integrity. Any form of cheating or dishonesty will not be tolerated.</li></ul>
    <p><b>Good luck! Click the checkbox below to confirm you have read and understood these instructions, then click 'Start Test' to begin.</b></p>
    <label>
        <input type="checkbox" id="acceptCheckbox"> I accept the instructions
    </label>
    <br>
    <button id="startTestBtn" disabled>Start Test</button>
</div>
<div id="examQuestions">
<div>
    <span id="countdown">Time remaining:</span>
</div>
<form id="quizForm" action="sqlresult.jsp">
	<div>
		<p>1.Which of the following is used to remove all records from a table in SQL?</p>
		<input type="radio" name="qn1" value="DELETE">DELETE
        <input type="radio" name="qn1" value="TRUNCATE">TRUNCATE 
        <input type="radio" name="qn1" value="DROP">DROP
        <input type="radio" name="qn1" value="CLEAR">CLEAR
	</div>
    <div>
         <p>2.What does the `JOIN` clause do in SQL?</p>
         <input type="radio" name="qn2" value="Combines rows from two or more tables based on a related column">Combines rows from two or more tables based on a related column 
         <input type="radio" name="qn2" value="Deletes rows from a table">Deletes rows from a table
         <input type="radio" name="qn2" value="Creates a new table">Creates a new table
         <input type="radio" name="qn2" value="Updates records in a table">Updates records in a table
    </div>

    <div class="question">
         <p>3. In SQL, which statement is used to update existing records in a table?</p>
         <input type="radio" name="qn3" value="CHANGE">CHANGE
         <input type="radio" name="qn3" value="MODIFY">MODIFY
         <input type="radio" name="qn3" value="UPDATE">UPDATE
         <input type="radio" name="qn3" value="ALTER">ALTER
    </div>

    <div class="question">
            <p>4.What is a primary key in a database?</p>
           	<input type="radio" name="qn4" value="A column that can accept duplicate values">A column that can accept duplicate values
            <input type="radio" name="qn4" value="A column that uniquely identifies each row in a table">A column that uniquely identifies each row in a table
            <input type="radio" name="qn4" value=" A column that can hold null values"> A column that can hold null values
            <input type="radio" name="qn4" value="A foreign key that references another table">A foreign key that references another table
     </div>
     <div class="question">
            <p>5.Which SQL function is used to count the number of rows in a result set?</p>
            <input type="radio" name="qn5" value="SUM()">SUM() 
            <input type="radio" name="qn5" value="COUNT()">COUNT() 
            <input type="radio" name="qn5" value="TOTAL()">TOTAL()
            <input type="radio" name="qn5" value="ADD()">ADD()  
     </div>
  
     <div class="question">
            <p>6. What is the purpose of the `GROUP BY` clause in SQL?</p>
            <input type="radio" name="qn6" value="To sort the result set">To sort the result set
          	<input type="radio" name="qn6" value="To aggregate data across multiple rows"> To aggregate data across multiple rows
            <input type="radio" name="qn6" value="To filter records based on a condition"> To filter records based on a condition
            <input type="radio" name="qn6" value="To join two tables"> To join two tables
      </div>

      <div class="question">
            <p>7.In SQL, what is a subquery?</p>
            <input type="radio" name="qn7" value="A query that is executed on its own">A query that is executed on its own
            <input type="radio" name="qn7" value="A query nested inside another query">A query nested inside another query
            <input type="radio" name="qn7" value="A query that returns no results">A query that returns no results
            <input type="radio" name="qn7" value="A query that modifies data in a table">A query that modifies data in a table
      </div>

      <div class="question">
            <p>8.What does the `HAVING` clause do in SQL?</p>
            <input type="radio" name="qn8" value="It filters records before aggregation">It filters records before aggregation
            <input type="radio" name="qn8" value="It filters records after aggregation">It filters records after aggregation
            <input type="radio" name="qn8" value="It sorts the result set"> It sorts the result set
            <input type="radio" name="qn8" value="It renames columns in the result set"> It renames columns in the result set
      </div>

      <div class="question">
            <p>9.Which SQL statement is used to create a new table?</p>
            <input type="radio" name="qn9" value="CREATE">CREATE
            <input type="radio" name="qn9" value="NEW TABLE">NEW TABLE
            <input type="radio" name="qn9" value="INSERT">INSERT
            <input type="radio" name="qn9" value="DEFINE">DEFINE
      </div>

      <div class="question">
            <p>10. What is the result of the following SQL query if there are no matching records in the left table?</p>
            <p>SELECT * FROM table1 LEFT JOIN table2 ON table1.id = table2.id;</p>
            <input type="radio" name="qn10" value="All records from table1 and matching records from table2">All records from table1 and matching records from table2
            <input type="radio" name="qn10" value="All records from table2 and matching records from table1">All records from table2 and matching records from table1
            <input type="radio" name="qn10" value="All records from both tables">All records from both tables
            <input type="radio" name="qn10" value="Only records from table1"> Only records from table1
      </div>
      <input type="submit" value="End Test"/>
</form>
</div>
<script>
    const acceptCheckbox = document.getElementById('acceptCheckbox');
    const startTestBtn = document.getElementById('startTestBtn');
    const examInstructions = document.getElementById('examInstructions');
    const examQuestions = document.getElementById('examQuestions');

    acceptCheckbox.addEventListener('change', () => {
        startTestBtn.disabled = !acceptCheckbox.checked;
    });

    startTestBtn.addEventListener('click', () => {
        examInstructions.style.display = 'none'; 
        examQuestions.style.display = 'block';   
    });
</script>
</body>
</html>