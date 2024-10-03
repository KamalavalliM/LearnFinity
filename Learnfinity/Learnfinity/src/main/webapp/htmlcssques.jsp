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
<form id="quizForm" action="htmlresult.jsp">
	<div>
		<p>1.Which HTML5 element is used to define navigation links?</p>
		<input type="radio" name="qn1" value="nav">nav
        <input type="radio" name="qn1" value="link">link
        <input type="radio" name="qn1" value="ul">ul
        <input type="radio" name="qn1" value="section">section
	</div>
    <div>
         <p>2. In CSS, which property is used to change the text color of an element?</p>
         <input type="radio" name="qn2" value="font-color">font-color
         <input type="radio" name="qn2" value="text-color">text-color
         <input type="radio" name="qn2" value="color">color
         <input type="radio" name="qn2" value="foreground-color">foreground-color
    </div>

    <div class="question">
         <p>3. What does the `z-index` property do in CSS?</p>
         <input type="radio" name="qn3" value="sets stacking order">sets stacking order
         <input type="radio" name="qn3" value="sets transparency order">sets transparency order
         <input type="radio" name="qn3" value="defines font-size">defines the font-size
         <input type="radio" name="qn3" value="sets margin">sets margin
    </div>

    <div class="question">
            <p>4. Which CSS selector selects all p elements inside div elements?</p>
           	<input type="radio" name="qn4" value="div p">div p
            <input type="radio" name="qn4" value="div>p">div>p
            <input type="radio" name="qn4" value="div+p">div+p
            <input type="radio" name="qn4" value="div:p">div:p
     </div>
     <div class="question">
            <p>5. What is the purpose of the `box-sizing` property in CSS?</p>
            <input type="radio" name="qn5" value="change the size">change the size
            <input type="radio" name="qn5" value="Define the width and height">Define the width and height
            <input type="radio" name="qn5" value="add padding">add padding
            <input type="radio" name="qn5" value="set border">set border
     </div>
  
     <div class="question">
            <p>6. Which attribute is used to specify an external CSS file in an HTML document?</p>
            <input type="radio" name="qn6" value="href">href
          	<input type="radio" name="qn6" value="src">src
            <input type="radio" name="qn6" value="style">style
            <input type="radio" name="qn6" value="rel">rel
      </div>

      <div class="question">
            <p>7.  In which HTML version was the canvas element introduced?</p>
            <input type="radio" name="qn7" value="HTML4">HTML4
            <input type="radio" name="qn7" value="HTML5">HTML5
            <input type="radio" name="qn7" value="XHTML">XHTML
            <input type="radio" name="qn7" value="HTML3">HTML3
      </div>

      <div class="question">
            <p>8.  What does the `display: flex;` property do in CSS?</p>
            <input type="radio" name="qn8" value="element invisible">element invisible
            <input type="radio" name="qn8" value="flexible layout">flexible layout
            <input type="radio" name="qn8" value="grid layout">grid layout
            <input type="radio" name="qn8" value="absolute position">absolute position
      </div>

      <div class="question">
            <p>9.  Which CSS property is used to create space between the border and the content of an element?</p>
            <input type="radio" name="qn9" value="margin">margin
            <input type="radio" name="qn9" value="padding">padding
            <input type="radio" name="qn9" value="border-spacing">bo
            <input type="radio" name="qn9" value="class">class
      </div>

      <div class="question">
            <p>10. What is the purpose of the `@media` rule in CSS?</p>
            <input type="radio" name="qn10" value="animation">animation
            <input type="radio" name="qn10" value="responsive designs">responsive designs
            <input type="radio" name="qn10" value="import style">import styles
            <input type="radio" name="qn10" value="inline styles">inline styles
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