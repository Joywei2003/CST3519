<?php
    //access the database: make a connection to the database, set up the connection parameters 
    $server = "localhost";
    $user = "root";
    //$pwd = ""; //for windows machine
    $pwd = "root"; //for mac machine 
    $database = "distances";
    $connection = mysqli_connect($server, $user, $pwd, $database) or die("No connection established"); 
    print("Connection established");
    //start sending the select element to HTML page 
    print("<select id='countryList' onchange='showresult()'>"); 
    print("<option value=''>Select a Capital</option>");
    //run the SQL command that gets all the records in the database table 
    //create a String that holds the SQL select command
    $SQLselect = "select * from distance_table";
    //store the run of the above command in a variable
    $results = mysqli_query($connection, $SQLselect) or die("SQL select did not run"); 
    //print("SQL ran");
    //extracting the values of database table fields 
    while ( $row = mysqli_fetch_array($results)) 
    {
        $country = $row['country']; 
        $capital = $row['capital']; 
        $miles = $row['miles']; 
        $km = $row['km'];
        
        //send the select option to HTML
        $allinfo = $country.",".$capital.",".$miles.",".$km;
        //send a select option to HTML
        print("<option value='" . $allinfo . "'>" . $capital.", ".$country."</option>"); 
    }//end of while loop
    //send the close select tag to HTML file
    print("</select>"); 
?>