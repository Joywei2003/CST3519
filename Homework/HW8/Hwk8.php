<?php
    //have to access the database: create a connection to the database
    //$connection = mysqli_connect(parameters); //let's first setup the parameters
    $server = "localhost";
    $user = "root";
    $password = "root";
    $database = "historical_figures";
    $connection = mysqli_connect($server, $user, $password, $database) or die("no connection"); $SQLselect = "select * from historical_figures_table";
    //need to run the above command string: use PHP mysqli_query(connection, command string) 
    $results = mysqli_query($connection, $SQLselect) or die("query did not run");
    //checking the number of record found in the database table 
    $numrecs = mysqli_num_rows($results);
    
    if ($numrecs > 0) 
    {
        //start sending select element to HTML
        print("<select id='personList' onchange='showinfo()'>"); 
        print("<option value=''>Select a Person</option>");
        //loop through all the records inside $results 
        while($recordArray = mysqli_fetch_array($results)) 
        {
            //extract the database table column's values
            //$hfindex = $recordArray[0]; (we don't need this value) 
            $name = $recordArray[1];
            $nationality = $recordArray[2];
            $profession = $recordArray[3];
            $imagefile = $recordArray[4];
            $optionValue = $name.",".$nationality.",".$profession.",".$imagefile;
            //send this option to HTML
            print("<option value='" . $optionValue."'>".$name."</option>"); 
        }//end of while loop
        //send the closing select to HTML
        print("</select>"); 
    }
?>