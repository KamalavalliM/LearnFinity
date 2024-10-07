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
<form id="quizForm" action="reactresult.jsp">
	<div>
		<p>1. What is the purpose of `useEffect` in React?</p>
		<input type="radio" name="qn1" value="To manage component state">To manage component state
        <input type="radio" name="qn1" value="To handle side effects in functional components  ">To handle side effects in functional components  
        <input type="radio" name="qn1" value="To define component structure">To define component structure  
        <input type="radio" name="qn1" value="To create class components">To create class components
	</div>
    <div>
         <p> 2. Which lifecycle method is called immediately after a component is mounted?</p>
         <input type="radio" name="qn2" value="componentDidMount">componentDidMount
         <input type="radio" name="qn2" value="componentWillMount">componentWillMount
         <input type="radio" name="qn2" value="componentDidUpdate">componentDidUpdate
         <input type="radio" name="qn2" value="componentWillUnmount">componentWillUnmount
    </div>

    <div class="question">
         <p>3. What is a common use case for React's Context API?</p>
         <input type="radio" name="qn3" value="To manage local component state">To manage local component state  
         <input type="radio" name="qn3" value=" To share data between components without props drilling"> To share data between components without props drilling  
         <input type="radio" name="qn3" value=" To handle component lifecycle"> To handle component lifecycle  
         <input type="radio" name="qn3" value=" To optimize rendering performance">To optimize rendering performance  
    </div>

    <div class="question">
            <p> 4. How do you optimize performance in a React application?</p>
           	<input type="radio" name="qn4" value="By using `setState` in every render ">By using `setState` in every render 
            <input type="radio" name="qn4" value="By using `shouldComponentUpdate` or `React.memo`">By using `shouldComponentUpdate` or `React.memo`  
            <input type="radio" name="qn4" value="By avoiding hooks  ">By avoiding hooks  
            <input type="radio" name="qn4" value="By using inline styles ">By using inline styles 
     </div>
     <div class="question">
            <p>5.What is the purpose of keys in React lists?</p>
            <input type="radio" name="qn5" value="To uniquely identify elements for rendering">To uniquely identify elements for rendering  
            <input type="radio" name="qn5" value="To define styles for list items">To define styles for list items  
            <input type="radio" name="qn5" value="To manage event listeners">To manage event listeners
            <input type="radio" name="qn5" value="To pass data to components">To pass data to components
     </div>
  
     <div class="question">
            <p>6. Which hook is used to manage state in a functional component?</p>
            <input type="radio" name="qn6" value="useEffect">useEffect
          	<input type="radio" name="qn6" value="useState">useState
            <input type="radio" name="qn6" value="useReducer">useReducer
             <input type="radio" name="qn6" value="Both B and C">Both B and C
      </div>

      <div class="question">
            <p> 7. What is the result of trying to update state directly in React?
            </p>
            <input type="radio" name="qn7" value="The state updates successfully">The state updates successfully 
            <input type="radio" name="qn7" value="The component re-renders"> The component re-renders  
            <input type="radio" name="qn7" value="The state does not update and may lead to unexpected behavior ">The state does not update and may lead to unexpected behavior 
            <input type="radio" name="qn7" value=" It triggers a warning in the console"> It triggers a warning in the console
      </div>

      <div class="question">
            <p>8.What does the `React.Fragment` component do?</p>
            <input type="radio" name="qn8" value="It adds a new DOM element"> It adds a new DOM element
            <input type="radio" name="qn8" value="It groups multiple children without adding extra nodes to the DOM "> It groups multiple children without adding extra nodes to the DOM 
            <input type="radio" name="qn8" value="It creates a new context">It creates a new context  
            <input type="radio" name="qn8" value="It optimizes performance by preventing re-render"> It optimizes performance by preventing re-render
      </div>

      <div class="question">
            <p>9. Which method is used to send data from a child component to a parent component?</p>
            <input type="radio" name="qn9" value="Props">Props
            <input type="radio" name="qn9" value="Context">Context
            <input type="radio" name="qn9" value="Callbacks">Callbacks  
            <input type="radio" name="qn9" value="State">State
      </div>

      <div class="question">
            <p>10. What is the primary purpose of Redux in a React application?</p>
            <input type="radio" name="qn10" value="To manage local component state ">To manage local component state 
            <input type="radio" name="qn10" value="To handle side effects">To handle side effects
            <input type="radio" name="qn10" value="To manage global application state in a predictable way">To manage global application state in a predictable way
            <input type="radio" name="qn10" value="To optimize rendering performance">To optimize rendering performance
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