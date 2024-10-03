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
<form id="quizForm" action="javaresult.jsp">
	<div>
		<p>1.Which of the following methods can be overridden in Java?</p>
		<input type="radio" name="qn1" value="static">Static
        <input type="radio" name="qn1" value="final">Final
        <input type="radio" name="qn1" value="private">Private
        <input type="radio" name="qn1" value="protected">Protected
	</div>
    <div>
         <p>2. What is the output of the following code if a subclass overrides a method from its superclass?</p>
         <input type="radio" name="qn2" value="The superclass method is always called">The superclass method is always called
         <input type="radio" name="qn2" value="The subclass method is called"> The subclass method is called.
         <input type="radio" name="qn2" value="A compilation error occurs">A compilation error occurs
         <input type="radio" name="qn2" value="The output is unpredictable">The output is unpredictable
    </div>

    <div class="question">
         <p>3. Which of the following statements about the Java `final` keyword is true?</p>
         <input type="radio" name="qn3" value="cannot have subclasses">cannot have subclasses
         <input type="radio" name="qn3" value="method can be overridden">method can be overridden
         <input type="radio" name="qn3" value="variable can be reassigned">variable can be reassigned
         <input type="radio" name="qn3" value=" interface can be implemented multiple times"> interface can be implemented multiple times
    </div>

    <div class="question">
            <p>4. What does the `transient` keyword signify in Java?</p>
           	<input type="radio" name="qn4" value="A variable that should be serialized">A variable that should be serialized.
            <input type="radio" name="qn4" value="A variable that should not be serialized">A variable that should not be serialized
            <input type="radio" name="qn4" value="A variable that is static">A variable that is static
            <input type="radio" name="qn4" value="A variable that can change its value during runtime">A variable that can change its value during runtime
     </div>
     <div class="question">
            <p>5. Which of the following exceptions is checked at compile-time?</p>
            <input type="radio" name="qn5" value="NullPointerException">NullPointerException
            <input type="radio" name="qn5" value="ArithmeticException">Arithmetic Exception
            <input type="radio" name="qn5" value="IOException">IOException
            <input type="radio" name="qn5" value="ArrayIndexOutOfBoundsException">ArrayIndexOutOfBoundsException
     </div>
  
     <div class="question">
            <p>6. What is the purpose of the volatile keyword in Java?</p>
            <input type="radio" name="qn6" value="To make a variable immutable">To make a variable immutable
          	<input type="radio" name="qn6" value="To ensure that changes to a variable are visible to all threads">To ensure that changes to a variable are visible to all threads
            <input type="radio" name="qn6" value="To mark a method as thread-safe">To mark a method as thread-safe
      </div>

      <div class="question">
            <p>7. Which of the following is a valid way to create a thread in Java?</p>
            <input type="radio" name="qn7" value=" Implementing the `Runnable` interface"> Implementing the `Runnable` interface
            <input type="radio" name="qn7" value=" Extending the `Thread` class">Extending the `Thread` class
            <input type="radio" name="qn7" value="Using an anonymous inner class">Using an anonymous inner class
            <input type="radio" name="qn7" value="All">All
      </div>

      <div class="question">
            <p>8. Which of the following methods can be overridden in Java?</p>
            <input type="radio" name="qn8" value="static">Static
            <input type="radio" name="qn8" value="final">Final
            <input type="radio" name="qn8" value="private">Private
            <input type="radio" name="qn8" value="protected">Protected
      </div>

      <div class="question">
            <p>9. In Java, what does the `super` keyword refer to?</p>
            <input type="radio" name="qn9" value="current class">current class
            <input type="radio" name="qn9" value="parent class">parent class
            <input type="radio" name="qn9" value="object">Object
            <input type="radio" name="qn9" value="class">class
      </div>

      <div class="question">
            <p>10. Which collection allows duplicates and maintains insertion order?</p>
            <input type="radio" name="qn10" value="list">list
            <input type="radio" name="qn10" value="set">set
            <input type="radio" name="qn10" value="map">map
            <input type="radio" name="qn10" value="hashset">hashset
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