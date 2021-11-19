<?php
session_start();
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
	<?php include("./include/header.php"); ?>
    <?php require_once("function.php"); ?>
    <?php include("./include/menus.php"); ?>
    <div style="padding-top: 30px" id="main">
        <div style="text-align: center" class="col-md-12">
		<?php
                $question = 1;
				echo "<h2>Questionnaire</h2><BR/>";
                echo "<br>";
                question();
                echo '<form action="Questionnaire.php" method="post"
                <input type="submit" name="plusquestion" value="Ajouter une question">
                </form>';
                if(isset($_POST['plusquestion'])) {
                    $question += 1;
                    question();
                }
		?>		
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>