<!-- templates/list.php -->
<!-- To work, the file importing this file must define a $dogs array -->

<!DOCTYPE html>
<html>
    <head>
        <title>List of Dogs</title>
    </head>
    <body>
        <h1>List of Dogs</h1>
        <ul>
            <?php foreach ($dogs as $dog): ?>
            <li>
                <a href="/show.php?first_name=<?= $dog['first_name'] ?>">
                    <?= $dog['first_name'] . " " . $dog['last_name'] ?>
                </a>
            </li>
            <?php endforeach ?>
        </ul>
    </body>
</html>
