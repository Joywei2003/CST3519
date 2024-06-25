var chatHistory = []; // Array to store chat history

// Function to display chat history
function displayChatHistory() {
    $('#chat').empty(); // Clear the chat window
    chatHistory.forEach(function(item) {
        $('#chat').append('<div class="user-message mb-2"> User: ' + item.question + '</div>');
        $('#chat').append('<div class="bot-message mb-2">Bot: ' + item.response + '</div>');
    });
}

function sendMessage() {
    var question = $('#user-input').val();
    $('#chat').append('<div class="user-message mb-2">' + question + '</div>');

    $.post('bot.php', { question: question }, function(response) {
        $('#chat').append('<div class="bot-message mb-2">'  + response + '</div>');
        // Save the question and bot response in the array
        console.log({question})
        console.log({response})
        chatHistory.push({ question: question, response: response });
        displayChatHistory(); // Update chat history display
    });

    $('#user-input').val('');
}

// Display chat history when the page loads
$(document).ready(function() {
    displayChatHistory();
});  
