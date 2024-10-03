<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<form id="quizForm" action="jsresult.jsp">
	<div>
		<p>1. Which of the following is a feature of JavaScript?</p>
		<input type="radio" name="qn1" value="Static typing"> Static typing  
        <input type="radio" name="qn1" value="First-class functions">First-class functions 
        <input type="radio" name="qn1" value="Strongly typed">Strongly typed
        <input type="radio" name="qn1" value="None of the above">None of the above
	</div>
    <div>
         <p>2.  What does the `this` keyword refer to in a JavaScript function?</p>
         <input type="radio" name="qn2" value="The global object">The global object  
         <input type="radio" name="qn2" value="The function itself">The function itself
         <input type="radio" name="qn2" value="The calling object">The calling object 
         <input type="radio" name="qn2" value="The parent function">The parent function
    </div>

    <div class="question">
         <p>3.  Which of the following methods can be used to convert a string to a number in JavaScript?</p>
         <input type="radio" name="qn3" value="parseInt()">parseInt()
         <input type="radio" name="qn3" value="`parseFloat()">`parseFloat()
         <input type="radio" name="qn3" value="Number()">Number()
         <input type="radio" name="qn3" value="All of the above"> All of the above
    </div>

    <div class="question">
            <p>4.What is the output of `typeof null` in JavaScript?</p>
           	<input type="radio" name="qn4" value="object">object
            <input type="radio" name="qn4" value="null">null
            <input type="radio" name="qn4" value="undefined">undefined
            <input type="radio" name="qn4" value="string">string
     </div>
     <div class="question">
            <p>5. In JavaScript, what is a promise?</p>
            <input type="radio" name="qn5" value="A synchronous operation">A synchronous operation 
            <input type="radio" name="qn5" 
           value=" An object that represents the eventual completion or 
           failure of an asynchronous operation"> An object that represents 
           the eventual completion or failure of an asynchronous operation  
            <input type="radio" name="qn5" value="A way to handle errors">A way to handle errors
            <input type="radio" name="qn5" value="A method to create an object">A method to create an object  
     </div>
  
     <div class="question">
            <p>6. Which of the following statements is true about closures in JavaScript?</p>
            <input type="radio" name="qn6" value="Closures can access variables from their own scope">Closures can access variables from their own scope
          	<input type="radio" name="qn6" value="Closures can access variables from outer function scopes"> Closures can access variables from outer function scopes
            <input type="radio" name="qn6" value="Closures cannot access global variables">Closures cannot access global variables
            <input type="radio" name="qn6" value=" Both A and B"> Both A and B  
      </div>

      <div class="question">
            <p>7. What will the expression `0.1 + 0.2 === 0.3` evaluate to?</p>
            <input type="radio" name="qn7" value="true">true
            <input type="radio" name="qn7" value="false">false
            <input type="radio" name="qn7" value="undefined">undefined
            <input type="radio" name="qn7" value="TypeError">TypeError
      </div>

      <div class="question">
            <p>8. How can you prevent a default action in an event handler in JavaScript?</p>
            <input type="radio" name="qn8" value="event.stopPropagation()">event.stopPropagation()
            <input type="radio" name="qn8" value="event.preventDefault()">event.preventDefault()
            <input type="radio" name="qn8" value="return false">return false
            <input type="radio" name="qn8" value="Both B and C">Both B and C
      </div>

      <div class="question">
            <p>9.Which JavaScript method can be used to remove an item from an array?</p>
            <input type="radio" name="qn9" value="delete">delete
            <input type="radio" name="qn9" value="splice()">splice()
            <input type="radio" name="qn9" value="pop()">pop()
            <input type="radio" name="qn9" value="Both B and C">Both B and C
      </div>

      <div class="question">
            <p>10. In ES6, which feature allows you to define a block-scoped variable?</p>
            <input type="radio" name="qn10" value="var">var
            <input type="radio" name="qn10" value="let">let
            <input type="radio" name="qn10" value="const">const
            <input type="radio" name="qn10" value=" Both B and C"> Both B and C
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