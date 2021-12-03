<?php
try {
    $conn = new PDO('mysql:host=localhost;dbname=user_ptut','user_ptut', 'ZQSVEAbwsxpB7eth');
    $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    echo "Connexionnnnn";
} catch (PDOException $e) {
    echo $e->getMessage();
    die('could not connect');

}
?>