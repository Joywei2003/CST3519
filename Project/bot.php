<?php

// function for getting database object
function get_db_object() {
    $server = "localhost";
    $user = "root";
    $password = "root";
    $database = "chat_bot";

    // Create connection
    $conn = new mysqli($server, $user, $password, $database);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}

function getAnswer($conn, $question) {
    $question = $conn->real_escape_string($question);
    $sql = "SELECT answer FROM chat_history WHERE question = '$question'";
    $result = $conn->query($sql);

    // Debugging: Check if there's any error in the SQL query execution
    if (!$result) {
        die("Error executing query: " . $conn->error);
    }

    if ($result->num_rows > 0) {
        // Question found, return the corresponding answer
        $row = $result->fetch_assoc();
        return $row["answer"];
    } else {
        // Question not found
        return "Sorry, I don't have an answer to that question.";
    }
}

$database = get_db_object();

// Check if the 'question' parameter is set in the POST request
if (isset($_POST['question'])) {
    $message = $_POST['question'];

    // Simulate a bot response (echo back the received message)
    $answer = getAnswer($database, $message);
    echo $answer;
} else {
    echo "No question provided.";
}
?>
