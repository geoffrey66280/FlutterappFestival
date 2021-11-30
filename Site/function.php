<?php

    function connection(){
        echo "<h2> Bienvenue sur la page de connexion</h2>
        <br>
        <h3>Pour vous connecter cliquez sur le bouton ci-dessous</h3>
        <br><br>";
        echo '<form method="post"><input type="submit" name="SeConnecter" value="Se connecter"></form>';
        if(isset($_POST['SeConnecter'])){
            header("location: ./FormConnection.php");
        }
    }
    
    function deconnection(){
        echo "<h2> Bienvenue sur la page de déconnexion
        <br>
        <h3>Pour vous déconnecter cliquez sur le bouton ci-dessous<h3>
        <br><br>";
        echo '<form method="post"><input type="submit" name="SeDeconnecter" value="Se déconnecter"></form>';
        if(isset($_POST['SeDeconnecter'])) {
            if (empty($_SESSION['SLogin'])) {
                header("location: ./FormConnection.php?msg=Vous n'êtes pas identifié");
            }
            session_destroy();
            header('location: ./FormConnection.php?msg=Déconnexion effectuée');
        }
    }

    function question(){
        echo "<h4>Question</h4>";
        echo "<p>Type de la réponse !</p>";
        echo "<br>";
        echo "<form action='Questionnaire.php' method='post'>
                 <input type='checkbox' name='type' value='checkbox'/> Checkbox  
                 <input type='checkbox' name='type' value='string'/> Chaine de caractère  
                 <input type='checkbox' name='type' value='int'/> Valeur numérique  
                 <input type='checkbox' name='type' value='list'/> Liste
                 <br> <br>
                 <p>Nombre de réponse souhaité !</p>
                 <br>
                 <input type='text' name='nbquestion' />
              </form>
              <br><br>";
    }
?>