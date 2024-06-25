<?php
    //getting the passing variable (through a key)
    $searchText = $_GET["searchKey"];
    //access (make a connection) to the database historical_figures
    //$connection = mysqli_connect($server,$user,$password,$database); 
    //setup the parameters
    $server = "localhost";
    $user = "root";
    $password = "root";
    $database = "historical_figures";
    $connection = mysqli_connect($server, $user, $password, $database) or die("no connection");
    //create a String that holds the SQL select command
    $SQLselect = "select * from historical_figures_table where name like '$searchText%' or name like '%$searchText'";
    //now run the above command using php mysqli_query(connection,command) $result = mysqli_query($connection,$SQLselect) or die("query did not run");
    //find out how many matched records 
    $numrecs = mysqli_num_rows($result);
    if ($numrecs == 0) print("No records found"); 
    else
    {
        if($numrecs == 1) 
        {
            //send the name
            //let's get the name of the matched record 
            //turn $result into an array
            $recordArray = mysqli_fetch_array($result);
            //extracting the values
            $name = $recordArray[1]; 
            $nationality = $recordArray[2]; 
            $profession = $recordArray[3]; 
            $imagefile = $recordArray[4];
            //send to HTML these values
            $allinfo= $name.",".$nationality.",".$profession.",".$imagefile;
            print($allinfo); 
        }
        else 
        {
            //send the start of a select element
            print("<select id='personList' onchange='showinfo()'>");
            print("<option value=''>Select a Person</option>");
            //send a select element
            while ( $recordArray = mysqli_fetch_array($result)) 
            {
                //extracting the values
                $name = $recordArray[1]; 
                $nationality = $recordArray[2];
                $profession = $recordArray[3];
                $imagefile = $recordArray[4];
                //send these values as options to the select element
                $allinfo= $name.",".$nationality.",".$profession.",".$imagefile;
                print("<option value='". $allinfo . "'>" . $name . "</option>"); 
            }//end of while loop
            //send the close select element to HTML
            print("</select>"); 
        }
    } 
?>