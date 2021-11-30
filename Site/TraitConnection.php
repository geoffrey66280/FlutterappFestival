<?php
session_start();
$login = 'admin';
$mdp = 'admin';

if (!empty($_POST['login']) && !empty($_POST['mdp']) && !empty($_POST['valider'])) {
    if ($login != $_POST['login'] && $mdp != $_POST['mdp']) {
        header("location: ./FormConnection.php?msg=Erreur de connection... Réessayer");
    } else {
        header("location: index.php");
        $_SESSION["SLogin"] = 'bon';
    }
} else {
    header("location: ./FormConnection.php?msg=L'identidication n'a pas fonctionné");
}
?>