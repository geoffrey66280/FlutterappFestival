<div id="sidebar" class="sidebar-offcanvas">
    <div style="padding-top: 30px;" class="col-md-12">
        <ul class="nav nav-pills flex-column">
            
			<?php
                // on récupère le nom du script executé sans son chemin
				$page = pathinfo($_SERVER['PHP_SELF'], PATHINFO_BASENAME);
				// echo $page;
                if(empty($_SESSION['SLogin'])) {
                    echo '<li class="nav-item">';
                    if ($page == 'index.php') {
                        echo '<a class="nav-link active" href="index.php">Accueil</a>';
                    }
                    else {
                        echo '<a class="nav-link" href="index.php">Accueil</a>';
                    }
                    echo '</li>';
                } else {
                    echo '<li class="nav-item">';
                    if ($page == 'index.php') {
                        echo '<a class="nav-link active" href="index.php">Accueil</a>';
                    }
                    else {
                        echo '<a class="nav-link" href="index.php">Accueil</a>';
                    }
                    echo '</li>';
                }

                if(!empty($_SESSION['SLogin'])) {
                    echo '<li class="nav-item">';
                    if ($page == 'Questionnaire.php') {
                        echo '<a class="nav-link active" href="Questionnaire.php">Questionnaire</a>';
                    }
                    else {
                        echo '<a class="nav-link" href="Questionnaire.php">Questionnaire</a>';
                    }
                    echo '</li>';
                }
			?>
        </ul>
    </div>
</div>

