<?php
    //print("hello from the server"); 
    //need to read the csv file
    $file = "distance_ny_capital.csv";
    //ensuring the file exist and a stream can be made out of it 
    if (file_exists($file) && $fileStream = fopen($file, "r"))
    {
        //going to start reading the csv file
        //but we need to skip the first two records (title line & columns' names) 
        $reading = 1;
        //start sending the select element to HTML page
        print("<select id='countryList' onchange='showresult()'>"); 
        print("<option value=''>Select a Capital</option>");
        //now we can start reading the csv file
        while ( ($lineArray = fgetcsv($fileStream, 0, ",")) != FALSE) 
        {
            if ($reading <= 2) $reading++; 
            else
            {
                $country = $lineArray[0]; 
                $capital = $lineArray[1]; 
                $miles = $lineArray[2]; 
                $km = $lineArray[3];
                $allinfo = $country.",".$capital.",".$miles.",".$km;
                //send a select option to HTML
                print("<option value='" . $allinfo . "'>" . $capital.", ".$country."</option>"); 
            }
        }//end of reading csv files
        //send the close select tag to HTML file
        print("</select>"); 
    }
    else print("Can not process the request"); 
?>