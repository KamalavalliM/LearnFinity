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
<form id="quizForm" action="cppresult.jsp">
	<div class="question">
		<p>Which of the following is a valid use of the const keyword in C++?</p>
		<input type="radio" name="qn1" value="declare a constant pointer">declare a constant pointer
        <input type="radio" name="qn1" value="declare a constant variable">declare a constant variable
        <input type="radio" name="qn1" value="declare a constant function">declare a constant function
        <input type="radio" name="qn1" value="All of the above">all
	</div>
    <div class="question">
         <p>2. What is the purpose of a destructor in C++?</p>
         <input type="radio" name="qn2" value="initialize class objects">initialize class objects
         <input type="radio" name="qn2" value="To clean up resources when an object goes out of scope">To clean up resources
         <input type="radio" name="qn2" value="copy objects">copy objects
         <input type="radio" name="qn2" value="To overload operators">To overload operators
    </div>

    <div class="question">
         <p>3. Which of the following correctly describes the concept of polymorphism in C++?</p>
         <input type="radio" name="qn3" value="Ability to create multiple objects from a class">Ability to create multiple objects from a class
         <input type="radio" name="qn3" value="Ability to call the same method on different objects">Ability to call the same method on different objects 
         <input type="radio" name="qn3" value="Ability to define multiple classes with the same name">Ability to define multiple classes with the same name 
         <input type="radio" name="qn3" value="Ability to overload operators">Ability to overload operators
    </div>

    <div class="question">
            <p>4. Is pointer allowed in cpp</p>
           	<input type="radio" name="qn4" value="yes">yes
            <input type="radio" name="qn4" value="no">no
     </div>
     <div class="question">
            <p>5. Which of the following is a valid way to allocate memory dynamically in C++?</p>
            <input type="radio" name="qn5" value="malloc()">malloc()
            <input type="radio" name="qn5" value="new">new
            <input type="radio" name="qn5" value="calloc()">calloc()
            <input type="radio" name="qn5" value="Both A and B">Both A and B
     </div>
  
     <div class="question">
            <p>6. In C++, what does the `virtual` keyword signify?</p>
            <input type="radio" name="qn6" value="A method that can be called only once"> A method that can be called only once
          	<input type="radio" name="qn6" value="A method that can be overridden in derived classes">A method that can be overridden in derived classes
            <input type="radio" name="qn6" value="method can be overridden">method can be overridden
            <input type="radio" name="qn6" value="method can be overridden">method can be overridden
      </div>

      <div class="question">
            <p>7.Which of the following statements about constructors is true?</p>
            <input type="radio" name="qn7" value="return values">return values
            <input type="radio" name="qn7" value="can overload">can overload
            <input type="radio" name="qn7" value="can declare virtual">can declare virtual
            <input type="radio" name="qn7" value="can call automatically">can call automatically
      </div>

      <div class="question">
            <p>8.What is the purpose of the `friend` keyword in C++?</p>
            <input type="radio" name="qn8" value="To define a private variable">To define a private variable
            <input type="radio" name="qn8" value="To allow a function or class to access private members of another class">To allow a function or class to access private members of another class
            <input type="radio" name="qn8" value="To declare a global variable">To declare a global variable 
            <input type="radio" name="qn8" value="To inherit from a base class">To inherit from a base class
      </div>

      <div class="question">
            <p>9.Which of the following is an example of a STL (Standard Template Library) container?</p>
            <input type="radio" name="qn9" value="current class">current class
            <input type="radio" name="qn9" value="parent class">parent class
            <input type="radio" name="qn9" value="object">Object
            <input type="radio" name="qn9" value="class">class
      </div>

      <div class="question">
            <p>10.What will happen if you attempt to delete a pointer that has already been deleted in C++?</p>
            <input type="radio" name="qn10" value="no error">no error
            <input type="radio" name="qn10" value="compilation error">compilation error
            <input type="radio" name="qn10" value="undefined behaviour">map
            <input type="radio" name="qn10" value="reset the pointer">reset the pointer
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