<!-- This gets returned when a POST is done to this location -->

<!--
    htmlspecialchars():
        Makes sure any characters that are special in html are properly encoded
        so people can't inject HTML tags or Javascript into your page.

    $_POST:
        Object containing hashmap with all data submitted here from a form.
-->
Hi <?php echo htmlspecialchars($_POST['name']); ?>.
You are <?php echo (int)$_POST['age']; ?> years old.
