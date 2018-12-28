<!doctype html>
<html>
<body>

    <!--
        EVERYTHING IN HERE IS TERRIBLE, DON'T DO ANY OF IT THIS WAY.
        WE SHOULD BE DIVIDING IT INTO MULTIPLE FILES INSTEAD.

        SEPARATE MODEL, VIEW, AND CONTROLLER.

        See https://symfony.com/doc/master/introduction/from_flat_php_to_symfony2.html
    -->

    <!----------------------------- USING PDO TO CONNECT TO POSTGRES ------------------------------>
    <h1>USING PDO:</h1>
    <div>
        <?php
            // Connect to the database, return object.
            echo "Result of connection attempt: ";
            $pg_pdo = new PDO("pgsql:host=localhost;dbname=postgres;", "andrew");

            /****** Perform a query ******/
            echo "<br />Result of query: ";
            $result = $pg_pdo->query('SELECT * FROM starter_data');

            // Display error and exit if query fails.
            if (!$result) {
                echo "An error occurred in the query.\n";
                exit;
            } else {
                echo "Query succeeded!";
            }

            /******* Display results from query *******/
            echo "<br /><h2>Data by result (row-by-row):</h2>";
            $all_rows = array();

            // Display one row at a time.
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                print_r($row);
                foreach ($row as $key => $value) {
                    $clean_val = ($value === False) ? "0" : $value;
                    print_r("<br />$key : $clean_val");
                }
                echo "<br /><br />";

                // Store all rows.
                $all_rows[] = $row;
            }

            // Display all results in a single object.
            echo "<br />all_rows object:<br />";
            print_r($all_rows);

            // Disconnect from the database.
            $pg_pdo = null;
        ?>
    </div>





    <!------------------------------------------------------------>
    <!--------------- DO NOT USE THE BELOW MECHANISM ------------->
    <!------------------------------------------------------------>

    <!-- See: http://php.net/manual/en/book.pgsql.php -->
    <!---------------------- USING CLASSIC MECHANISM TO CONNECT TO POSTGRES ----------------------->
    <h1>USING pg_pconnect (don't do this):</h1>
    <div>
        <?php
            // Connect to the database, return object.
            echo "Result of connection attempt: ";
            $conn = pg_pconnect("host=localhost dbname=postgres user=andrew");
            if (!$conn) {
                echo "An error occurred.\n";
                exit;
            } else {
                echo "Connection succeeded!";
            }

            // Perform a query.
            echo "<br />Result of query: ";
            $result = pg_query($conn, "SELECT * FROM starter_data");
            if (!$result) {
                echo "An error occurred.\n";
                exit;
            } else {
                echo "Query succeeded!";
            }

            // Check for number of rows, exit if none found.
            $num_rows = pg_num_rows($result);
            if ($num_rows === 0) {
               echo "<br />0 records";
                exit;
            } else {
                echo "<br />$num_rows records found!";
            }

            // Display data from query.
            echo "<br /><h2>Data by result (row-by-row):</h2>";
            while ($row = pg_fetch_row($result)) {
                echo "<div style=\"text-indent: 10px; margin-bottom: 10px;\">";
                print_r($row);
                echo "<div>First Name: $row[0]</div>";
                echo "<div>Last Name: $row[1]</div>";
                echo "<div>Colour: $row[2]</div>";
                echo "<div>Favourite bear: $row[3]</div>";
                echo "<div>Gr: $row[4]</div>";
                echo "</div>";
            }
        ?>

        <h2>
            <?php
                // Close the db connection, and ensure close succeeded
                if(!pg_close($conn)) {
                    print "Failed to close connection to " . pg_host($conn) . ": " .
                   pg_last_error($conn) . "<br/>\n";
                } else {
                    print "Successfully disconnected from database.";
                }
            ?>
        </h2>
    </div>

</body>
</html>