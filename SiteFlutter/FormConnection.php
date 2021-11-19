<?php
    if (isset($_GET['msg'])) {
        $n = htmlentities($_GET['msg']);
        echo "<h2> $n </h2>";
    } else {
       echo "<h3>Veuillez entrer les identifiants pour accéder aux données</h3>";
    }
    echo '<form action="TraitConnection.php" method="post">
            Login : <input type="text" name="login"><br><br>
            Mot de passe : <input type="password" name="mdp"><br><br>
            <input type="submit" name="valider" value="Valider">
        </form>';

    if(isset($_POST['valider'])){
        if(empty($_POST['login']) && empty($_POST['mdp'])) {
            header("location: FormConnection.php");
        }
    }
?>