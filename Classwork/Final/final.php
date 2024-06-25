<?
    $server = "localhost";
    $user = "root";
    $password = "root";
    $database = "movie";
    $connection = mysqli_connect($server, $user, $password, $database) or die("no connection"); 
    
    if (isset($_POST['genre'])) {
        $genre = $_POST['genre'];
        $stmt = $conn->prepare("SELECT title FROM movies WHERE genre = ?");
        $stmt->bind_param("s", $genre);
        $stmt->execute();
        $result = $stmt->get_result();
    
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<li>" . $row['title'] . "</li>";
            }
        } else {
            echo "<li>No movies found for this genre</li>";
        }
        $stmt->close();
    }
    
    $conn->close();
    ?>