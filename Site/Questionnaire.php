<?php
 session_start();
$cpt = 0;
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <link rel="stylesheet" href="include/bootstrap.min.css">
    <link rel="stylesheet" href="include/styles.css">
	<title>Mon site PWS en PHP!</title>
</head>
<body>
	<?php 
    include("./include/header.php");
    require_once("function.php");
    include("./include/menus.php"); 
    ?>
    <div style="padding-top: 30px" id="main">
        <div style="text-align: center" class="col-md-12">
		<?php
				echo "<h2>Questionnaire</h2>";
                echo "<br>";
                question();
                if(isset($_POST['plusquestion'])) {
                    $cpt++;
                    $cptcopy = $cpt;
                    while ($cptcopy > 0){
                        question();
                        $cptcopy--;
                    }
                }
                echo "<br>";
                echo "<form method='post'>
                        <input type='submit' name='plusquestion' value='Ajouter une question'/>
                      </form>";
		?>
        </div>
    </div>
	<?php include("./include/footer.php"); ?>
</body>
</html>