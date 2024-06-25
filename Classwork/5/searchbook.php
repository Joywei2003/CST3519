<?php
    //read the passing variable: search text 
    $searchTxt = $_GET["searchKey"];
    
    //read csv file and search for a match: file contents and the search input text 
    $fileName = "national_book_awards.csv";
    
    //boolean variable for a match 
    $found = false;
    
    //ensuring the file exists and it is not corrupt(a stream can be made out of it) 
    if (file_exists($fileName) && ($fileStream = fopen($fileName, "r")))
    {
        //loop through the data searching for a match but we need to skip the first 3 records 
        $reading = 0;
        $skip = true;
        
        while(($lineArray = fgetcsv($fileStream, 0, "/"))!= FALSE) 
        {
            $reading++;
            if ($reading > 3)
            {
                $style = $lineArray[0]; 
                $author = $lineArray[1]; 
                $title = $lineArray[2]; 
                $authorphoto = $lineArray[3]; 
                $bookcover = $lineArray[4]; 
                $authorbio = $lineArray[5]; 
                $isbn = $lineArray[6]; 
                $publisher = $lineArray[7];
            
                if(stripos($style,$searchTxt) !== false or stripos($author,$searchTxt) !== false or stripos($title,$searchTxt) !== false or stripos($authorbio,$searchTxt) !== false or $isbn==$searchTxt or stripos($publisher,$searchTxt) !== false)
                    if(stripos($author, $searchTxt) !== false) {
                        $found = true;
                        //send the matching information to the HTML
                        print($style.";".$author.";".$title.";".$authorphoto.";".$bookcover.";".$authorbio.";". $isbn.";".$publisher);
                } 
            }
        }//end of loop
        if ($found == false) 
            print("Sorry, our booksellers can't find what you are looking for"); 
        else print("File not available or damaged"); 
    }
?>
