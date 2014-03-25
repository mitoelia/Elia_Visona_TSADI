<!DOCTYPE html>
<html>
    
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="css/bootstrap.css">
  <title>Flappy Bird Clone</title>

  <style>
    #game_div, p {
      width: 400px;
      margin: auto;
      margin-top: 20px;
    }
  </style>
  
  <script type="text/javascript" src="jquery-1.11.0.js"></script>
  <script type="text/javascript" src="phaser.min.js"></script>
  <script type="text/javascript" src="main.js"></script>
</head>

<body>

  <p>Press the spacebar to jump</p>
  
  <div class="container">
      <div class="row">
        <div class="col-xs-6">
            <div id="game_div"> </div>
        </div>
        <div class="col-xs-6">
            <div id="result_game">
                <table class="table" id="result_table">
                    <thead>
                        <th>Username</th>
                        <th>Score</th>
                        <th>Timestamp</th>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
                
            </div>
        </div>
      </div>
  </div>
  
  

  <p>Learn how to make this game with a tutorial <a href="http://blog.lessmilk.com/how-to-make-flappy-bird-in-html5-1/">here</a></p>
  
  <script type="text/javascript" src="topFive.js"></script>
  
</body>

</html>