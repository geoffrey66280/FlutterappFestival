<?php
try {
    $conn = new PDO('mysql:host=localhost;dbname=user_ptut; charset=UTF8',
        'user_ptut', 'ZQSVEAbwsxpB7eth', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
    die();
}
